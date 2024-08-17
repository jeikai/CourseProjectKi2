-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2024 at 02:42 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `awaitingapproval`
--

CREATE TABLE `awaitingapproval` (
  `id` int(11) NOT NULL,
  `libraryCard` varchar(10) NOT NULL,
  `bookId` varchar(10) NOT NULL,
  `borrowedDay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `awaitingapproval`
--

INSERT INTO `awaitingapproval` (`id`, `libraryCard`, `bookId`, `borrowedDay`) VALUES
(25, 'TV0004', 'SA0009', 25),
(26, 'TV0004', 'SA0003', 60),
(27, 'TV0001', 'SA0009', 25);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `bookId` varchar(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `publisher` varchar(200) NOT NULL,
  `yearOfPublisher` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `subject` text NOT NULL,
  `price` int(11) NOT NULL,
  `totalQuantity` int(11) NOT NULL,
  `summary` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookId`, `name`, `publisher`, `yearOfPublisher`, `author`, `subject`, `price`, `totalQuantity`, `summary`) VALUES
('SA0001', 'The Great Gatsby', 'Scribner', 1925, 'F. Scott Fitzgerald', 'Sách kỹ năng', 120000, 10, 'Tôi nghĩ đây là một đầu sách mà bạn nên mua và đọc ngay, nội dung ly kỳ như một bộ phim hành động vậy, nó lôi cuốn người đọc theo hành trình của Cliff Stoll. Nếu bạn là một người thích phưu lưu cũng như sự kịch tính thì nên đọc nó. Đảm bảo bạn sẽ thấy những gì tôi nói là không sai.'),
('SA0002', 'To Kill a Mockingbird', 'J. B. Lippincott & Co.', 1960, 'Harper Lee', 'Sách truyện', 11000, 150, 'Đừng cố làm người tốt trong mắt tất cả mọi người” điều này sẽ rất vô nghĩa. Thế giới có vô vàn kiểu người, có người tốt, người xấu và trong...'),
('SA0003', '1984', 'Secker & Warburg', 1949, 'George Orwell', 'Tài liệu', 80000, 75, 'Nghệ thuật từ chối cuốn sách giúp bạn chinh phục kỹ năng giao tiếp, giúp bạn biết cách ứng xử sao cho phù hợp với tất cả các mối quan hệ xung quanh.'),
('SA0004', 'Pride and Prejudice', 'T. Egerton, Whitehall', 1813, 'Jane Austen', 'Tài liệu', 95000, 200, 'Sống xanh không khó nếu chúng ta suy nghĩ tích cực về nó, thay đổi hành động mỗi ngày sẽ giúp cho cuộc sống của chúng ta tốt lên mỗi ngày.'),
('SA0005', 'The Catcher in the Rye', 'Little, Brown and Company', 1951, 'J. D. Salinger', 'Tài liệu', 50000, 2, 'Trưởng thành sau ngàn lần tranh đấu - cuốn sách viết cho người lớn đang chao đảo bên ngưỡng cửa trưởng thành. Những tâm sự của người đi trước, bài học...'),
('SA0006', 'The Da Vinci Code', 'Doubleday', 2003, 'Dan Brown', 'Sách truyện', 40000, 120, 'Cuốn sách “Hãy khiến tương lai biết ơn vì hiện tại bạn đã cố gắng hết mình” sẽ là người bạn đồng hành trên chặng đường tương lai phía trước, cuốn...'),
('SA0007', 'The Alchemist', 'HarperCollins', 1988, 'Paulo Coelho', 'Tài liệu', 30000, 250, '“Càng độc lập càng cao quý” là cuốn sách giúp cho các cô gái nắm được bản đồ cuộc sống của mình để từ đó trở thành mẫu con gái mà mình yêu thích.'),
('SA0008', 'The Hunger Games', 'Scholastic Corporation', 2008, 'Suzanne Collins', 'Sách kỹ năng', 10000, 180, 'Ổn định hay tự do? câu hỏi mà chúng ta thường gặp khi vừa bước chân vào xã hội và đi làm. Ổn định hay tự do là tùy thuộc vào mục tiêu và cách sống của...'),
('SA0009', 'The Lord of the Rings', 'Allen & Unwin', 1954, 'J. R. R. Tolkien', 'Sách truyện', 60000, 80, 'Nếu bạn đang bị kiệt sức giữa ngã ba đường của tuổi trẻ, vậy thì hãy để cuốn sách “Gửi bạn người đã kiệt sức vì những chịu đựng âm thầm” sẽ...'),
('SA0010', 'Harry Potter and the Philosophers Stone', 'Bloomsbury Publishing', 1997, 'J. K. Rowling', 'Tài liệu', 300000, 300, 'Xin đổi tổn thương lấy trưởng thành - cuốn sách giúp bạn lấy lại tinh thần sau những ngày chán nản với trọng trách gánh vác trên vai “người trưởng thành...'),
('SA0011', 'Lập trình cơ bản với C', 'NXB Công nghệ thông tin', 2016, 'dont know', 'Sách Khoa học công nghệ – Kinh tế', 150000, 100, 'Sống thanh thản như người Thụy Điển” là cuốn sách hữu ích giúp bạn lọc bớt những đồ dùng không cần thiết trong cuộc sống. Đôi khi những vật dụng ấy...'),
('SA0012', 'Code dạo ký sự – Lập trình viên đâu chỉ biết Code', 'NXB Dân trí', 2020, 'Phạm Huy Hoàng', 'Sách Khoa học công nghệ – Kinh tế', 150000, 300, '“Bluefishing Câu cá trên trời” - khi những điều không thể lại trở thành có thể. Cuộc sống luôn chứa đựng vô vàn bất ngờ vậy nên chúng ta cần phải từ từ...'),
('SA0013', 'Liệu IT Đã Hết Thời', 'NXB Trẻ', 2021, 'Nicolas G.carr', 'Sách Khoa học công nghệ – Kinh tế', 250000, 250, '“Là một người con gái gai góc cũng có thể sưởi ấm cả thế gian” này theo cách mà bạn mong muốn. Một tựa sách rất đáng để các cô gái trải nghiệm, đặc...'),
('SA0014', 'Nghệ thuật ẩn mình', 'NXB Công nghệ', 2018, 'Kevin Mitnick', 'Sách Khoa học công nghệ – Kinh tế', 289000, 50, 'Những lời nhắn nhủ đầy yêu thương được Du Phong viết trong cuốn sách “Tự yêu” dành tặng các cô gái đã, đang và có thể là chưa từng yêu đương lần'),
('SA0015', 'Gián điệp mạng', 'NXB Tự do', 2015, 'Cliff Stoll', 'Sách Khoa học công nghệ – Kinh tế', 325000, 400, 'Cuốn sách “Mỗi ngày đều đóng vai một người lớn điềm tĩnh” sẽ mang đến cho bạn nhiều cảm xúc mới mẻ, góc nhìn khác đi về thế giới của người trưởng...'),
('SA0016', 'Chính Trị Luận', 'NXB Thế giới', 2018, 'Aristotle', 'Sách Chính trị - pháp luật', 169000, 350, 'Một lần tới nhân gian, phải sống đời rực rỡ là một cuốn sách giúp bạn khám phá những điều thú vị về cuộc sống, cách để bạn giải quyết những rắc...'),
('SA0017', 'Chính Trị – Khái Lược Những Tư Tưởng Lớn', 'NXB Thế giới', 2018, 'DK', 'Sách Chính trị - pháp luật', 298000, 150, 'Đừng chỉ đẹp mà không hiểu chuyện” cuốn sách cẩm nang sống dành cho mọi cô gái. Dù bạn là ai, đang ở độ tuổi nào thì cuốn sách này cũng sẽ giúp ích...'),
('SA0018', 'Bàn Về Khế Ước Xã Hội', 'NXB Thế giới', 2018, 'J. Rousseau', 'Sách Chính trị - pháp luật', 169000, 350, '“Phụ nữ sống hiểu biết sẽ có cuộc sống đẳng cấp hơn” là một cuốn sách viết rất thực tế về các vấn đề đã và đang xảy ra xung quanh cuộc sống của...'),
('SA0019', 'Cộng Hòa', 'NXB Chính trị', 2012, 'J. Rousseau', 'Sách Chính trị - pháp luật', 189000, 350, 'hello veraybody');

--
-- Triggers `book`
--
DELIMITER $$
CREATE TRIGGER `tg_Book_insert` BEFORE INSERT ON `book` FOR EACH ROW BEGIN
  INSERT INTO BOOKID VALUES (NULL);
  SET NEW.bookId = CONCAT('SA', LPAD(LAST_INSERT_ID(),4, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bookid`
--

CREATE TABLE `bookid` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookid`
--

INSERT INTO `bookid` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19);

-- --------------------------------------------------------

--
-- Table structure for table `callcard`
--

CREATE TABLE `callcard` (
  `callCardId` varchar(10) NOT NULL,
  `libraryCard` varchar(10) NOT NULL,
  `bookId` varchar(10) NOT NULL,
  `borrowedDay` int(11) NOT NULL,
  `borrowedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `callcard`
--

INSERT INTO `callcard` (`callCardId`, `libraryCard`, `bookId`, `borrowedDay`, `borrowedDate`) VALUES
('MS0001', 'TV0001', 'SA0002', 25, '2024-08-10'),
('MS0002', 'TV0001', 'SA0001', 21, '2024-08-10'),
('MS0003', 'TV0001', 'SA0005', 60, '2024-08-17'),
('MS0004', 'TV0003', 'SA0004', 60, '2024-08-17'),
('MS0005', 'TV0003', 'SA0001', 21, '2024-08-17'),
('MS0006', 'TV0003', 'SA0009', 25, '2024-08-17'),
('MS0007', 'TV0004', 'SA0001', 21, '2024-08-17'),
('MS0008', 'TV0004', 'SA0002', 25, '2024-08-17');

--
-- Triggers `callcard`
--
DELIMITER $$
CREATE TRIGGER `tg_CallCard_insert` BEFORE INSERT ON `callcard` FOR EACH ROW BEGIN
  INSERT INTO CALLCARDID VALUES (NULL);
  SET NEW.callCardId = CONCAT('MS', LPAD(LAST_INSERT_ID(),4, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `callcardid`
--

CREATE TABLE `callcardid` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `callcardid`
--

INSERT INTO `callcardid` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

-- --------------------------------------------------------

--
-- Table structure for table `librarycard`
--

CREATE TABLE `librarycard` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `librarycard`
--

INSERT INTO `librarycard` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Table structure for table `returnbook`
--

CREATE TABLE `returnbook` (
  `returnBookId` varchar(10) NOT NULL,
  `callCardId` varchar(10) NOT NULL,
  `payDay` date NOT NULL,
  `status` text NOT NULL,
  `fines` int(11) DEFAULT 0,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `returnbook`
--
DELIMITER $$
CREATE TRIGGER `tg_ReturnBook_insert` BEFORE INSERT ON `returnbook` FOR EACH ROW BEGIN
  INSERT INTO RETURNBOOKID VALUES (NULL);
  SET NEW.returnBookId = CONCAT('TS', LPAD(LAST_INSERT_ID(),4, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `returnbookid`
--

CREATE TABLE `returnbookid` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `libraryCard` varchar(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL,
  `gender` enum('Nam','Nữ','Khác') NOT NULL,
  `dateOfBirth` date NOT NULL,
  `address` text NOT NULL,
  `numberPhone` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('librarian','borrower') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`libraryCard`, `fullname`, `gender`, `dateOfBirth`, `address`, `numberPhone`, `email`, `username`, `password`, `role`) VALUES
('TV0001', 'Trần Quang Phúc', 'Nam', '2003-04-24', 'Nam Định', '0788087260', '21010625@st.phenikaa-uni.edu.vn', 'jeikai', '123456', 'borrower'),
('TV0002', 'Đặng Văn Cường', 'Nam', '2002-03-05', 'Bắc Ninh', '0369789654', 'sang@phenikaa-uni.edu.vn', 'dangvancuong', '123456', 'librarian'),
('TV0003', 'Phúc Trần', 'Nam', '1986-07-05', 'Hải Phòng', '045216846', '22050637@st.phenikaa-uni.edu.vn', '21020659', '123456', 'borrower'),
('TV0004', 'Tran phuc', 'Nam', '1983-06-05', 'Yên Bái', '0369998751', '22050638@st.phenikaa-uni.edu.vn', 'phuctran', '123456', 'borrower'),
('TV0005', 'Lương Anh Đức', 'Nam', '1990-07-05', 'Hải Phòng', '0158962365', '22050639@st.phenikaa-uni.edu.vn', '22050639', '123456', 'borrower'),
('TV0006', 'Mai Ngọc Hoàng Linh', 'Nữ', '1992-01-05', 'Bắc Giang', '0632589245', '22050640@st.phenikaa-uni.edu.vn', '22050640', '123456', 'borrower'),
('TV0007', 'Bùi Phương Ly', 'Nữ', '1993-07-18', 'Lào Cai', '063257416', '22050641@st.phenikaa-uni.edu.vn', '22050641', '123456', 'borrower'),
('TV0008', 'Vu Van Phong', 'Nam', '2002-05-03', 'Hà Giang', '0369136828', 'phong@phenikaa-uni.edu.vn', 'vanphong', '123456', 'librarian'),
('TV0009', 'Tran Van Manh', 'Nam', '2002-12-05', 'Điện Biên', '0125639854', 'manh@phenikaa-uni.edu.vn', 'vanmanh', '123456', 'librarian'),
('TV0010', 'Phạm Văn Kiên', 'Nam', '1986-07-05', 'Bắc Ninh', '0156325986', '22050642@st.phenikaa-uni.edu.vn', '22050642', '123456', 'borrower');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `tg_User_insert` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
  INSERT INTO LIBRARYCARD VALUES (NULL);
  SET NEW.libraryCard=CONCAT('TV', LPAD(LAST_INSERT_ID(),4, '0'));
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `awaitingapproval`
--
ALTER TABLE `awaitingapproval`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_AwaitingApproval_User` (`libraryCard`),
  ADD KEY `FK_AwaitingApproval_Book` (`bookId`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bookId`);

--
-- Indexes for table `bookid`
--
ALTER TABLE `bookid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `callcard`
--
ALTER TABLE `callcard`
  ADD PRIMARY KEY (`callCardId`),
  ADD KEY `FK_CallCard_User` (`libraryCard`),
  ADD KEY `FK_CallCard_Book` (`bookId`);

--
-- Indexes for table `callcardid`
--
ALTER TABLE `callcardid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librarycard`
--
ALTER TABLE `librarycard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returnbook`
--
ALTER TABLE `returnbook`
  ADD PRIMARY KEY (`returnBookId`),
  ADD KEY `FK_ReturnBook_CallCard` (`callCardId`);

--
-- Indexes for table `returnbookid`
--
ALTER TABLE `returnbookid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`libraryCard`),
  ADD UNIQUE KEY `numberPhone` (`numberPhone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `awaitingapproval`
--
ALTER TABLE `awaitingapproval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `bookid`
--
ALTER TABLE `bookid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `callcardid`
--
ALTER TABLE `callcardid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `librarycard`
--
ALTER TABLE `librarycard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `returnbookid`
--
ALTER TABLE `returnbookid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `awaitingapproval`
--
ALTER TABLE `awaitingapproval`
  ADD CONSTRAINT `FK_AwaitingApproval_Book` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AwaitingApproval_User` FOREIGN KEY (`libraryCard`) REFERENCES `user` (`libraryCard`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `callcard`
--
ALTER TABLE `callcard`
  ADD CONSTRAINT `FK_CallCard_Book` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CallCard_User` FOREIGN KEY (`libraryCard`) REFERENCES `user` (`libraryCard`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `returnbook`
--
ALTER TABLE `returnbook`
  ADD CONSTRAINT `FK_ReturnBook_CallCard` FOREIGN KEY (`callCardId`) REFERENCES `callcard` (`callCardId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
