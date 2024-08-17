package DAO;

import Entity.Book;
import Ultis.JDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.math3.linear.ArrayRealVector;
import org.apache.commons.math3.linear.RealVector;

public class RecommenBookDAO {

    public List<Book> recommendBook(String libraryCard) {
        List<Book> recommendedBooks = new ArrayList<>();
        try {
            Connection connection = JDBC.Connection();

            // Step 1: Get the books the target user has borrowed
            Map<String, Integer> targetUserBooks = getUserBooks(connection, libraryCard);

            // Step 2: Get all users and their borrowed books
            Map<String, Map<String, Integer>> allUsersBooks = getAllUsersBooks(connection);

            // Step 3: Build user vectors and calculate cosine similarity
            RealVector targetUserVector = createUserVector(targetUserBooks, allUsersBooks);
            Map<String, Double> similarityScores = new HashMap<>();
            for (Map.Entry<String, Map<String, Integer>> entry : allUsersBooks.entrySet()) {
                String otherUserCard = entry.getKey();
                if (!otherUserCard.equals(libraryCard)) {
                    RealVector otherUserVector = createUserVector(entry.getValue(), allUsersBooks);
                    double similarity = cosineSimilarity(targetUserVector, otherUserVector);
                    similarityScores.put(otherUserCard, similarity);
                }
            }

            // Step 4: Recommend books based on similar users
            for (Map.Entry<String, Double> entry : similarityScores.entrySet()) {
                String similarUserCard = entry.getKey();
                if (entry.getValue() > 0.5) { // Threshold for similarity
                    Map<String, Integer> similarUserBooks = getUserBooks(connection, similarUserCard);
                    for (String bookId : similarUserBooks.keySet()) {
                        if (!targetUserBooks.containsKey(bookId)) {
                            Book book = findBookById(bookId);
                            if (book != null && !recommendedBooks.contains(book)) {
                                recommendedBooks.add(book);
                            }
                        }
                    }
                }
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return recommendedBooks;
    }

    private Map<String, Integer> getUserBooks(Connection connection, String libraryCard) throws Exception {
        Map<String, Integer> userBooks = new HashMap<>();
        String getUserBooksSQL = "SELECT B.bookId FROM CallCard C JOIN Book B ON C.bookId = B.bookId WHERE C.libraryCard = ?";
        PreparedStatement getUserBooksStmt = connection.prepareStatement(getUserBooksSQL);
        getUserBooksStmt.setString(1, libraryCard);
        ResultSet userBooksResultSet = getUserBooksStmt.executeQuery();
        while (userBooksResultSet.next()) {
            userBooks.put(userBooksResultSet.getString("bookId"), 1);
        }
        return userBooks;
    }

    private Map<String, Map<String, Integer>> getAllUsersBooks(Connection connection) throws Exception {
        Map<String, Map<String, Integer>> allUsersBooks = new HashMap<>();
        String getAllUsersBooksSQL = "SELECT libraryCard, bookId FROM CallCard";
        PreparedStatement getAllUsersBooksStmt = connection.prepareStatement(getAllUsersBooksSQL);
        ResultSet allUsersBooksResultSet = getAllUsersBooksStmt.executeQuery();
        while (allUsersBooksResultSet.next()) {
            String userCard = allUsersBooksResultSet.getString("libraryCard");
            String bookId = allUsersBooksResultSet.getString("bookId");
            allUsersBooks.computeIfAbsent(userCard, k -> new HashMap<>()).put(bookId, 1);
        }
        return allUsersBooks;
    }

    private RealVector createUserVector(Map<String, Integer> userBooks, Map<String, Map<String, Integer>> allUsersBooks) {
        RealVector vector = new ArrayRealVector(allUsersBooks.size());
        int index = 0;
        for (String bookId : allUsersBooks.keySet()) {
            vector.setEntry(index++, userBooks.getOrDefault(bookId, 0));
        }
        return vector;
    }

    private double cosineSimilarity(RealVector vec1, RealVector vec2) {
        return vec1.dotProduct(vec2) / (vec1.getNorm() * vec2.getNorm());
    }

    private Book findBookById(String bookId) {
        Book book = null;
        try {
            Connection connection = JDBC.Connection();
            String SQL = "SELECT * FROM Book WHERE bookId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, bookId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                book = new Book();
                book.setBookId(resultSet.getString("bookId"));
                book.setName(resultSet.getString("name"));
                book.setPublisher(resultSet.getString("publisher"));
                book.setYearOfPublisher(resultSet.getInt("yearOfPublisher"));
                book.setAuthor(resultSet.getString("author"));
                book.setSubject(resultSet.getString("subject"));
                book.setPrice(resultSet.getInt("price"));
                book.setTotalQuantity(resultSet.getInt("totalQuantity"));
                book.setSummary(resultSet.getString("summary"));
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return book;
    }
}
