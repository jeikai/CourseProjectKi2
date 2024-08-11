drop database if exists Library;
create database if not exists Library;
use Library;

create table `User`(
`libraryCard` varchar(10) primary key DEFAULT '0',
`fullname` varchar(100) not null,
`gender` enum ('Nam','Nữ','Khác') not null,
`dateOfBirth` date not null,
`address` text not null,
`numberPhone` varchar(13) unique not null,
`email`  varchar(100) unique not null,
`username` varchar(50) unique not null,
`password` varchar(50) not null,
`role` enum('librarian','borrower')
);

CREATE TABLE LIBRARYCARD
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER tg_User_insert
BEFORE INSERT ON `User`
FOR EACH ROW
BEGIN
  INSERT INTO LIBRARYCARD VALUES (NULL);
  SET NEW.libraryCard=CONCAT('TV', LPAD(LAST_INSERT_ID(),4, '0'));
END$$
DELIMITER ;

insert into `User` (`fullname`,`gender`,`dateOfBirth`,`address`,`numberPhone`,`email`,`username`,`password`,`role`)
values  ('Nguyễn Đại Phát','Nam','2003-04-24','Nam Định','0788087260','21010625@st.phenikaa-uni.edu.vn','21010625','123456','borrower'),
        ('Phan Quan Sang','Nam','2002-03-05','Bắc Ninh','0369789654','sang@phenikaa-uni.edu.vn','phanquangsang','123456','librarian'),
	('Nguyễn Trí Chung','Nam','1986-07-05','Hải Phòng','045216846','22050637@st.phenikaa-uni.edu.vn','2050637','123456','borrower'),
        ('Phạm Xuân Bắc','Nam','1983-06-05','Yên Bái','0369998751','22050638@st.phenikaa-uni.edu.vn','22050638','123456','borrower'),
        ('Lương Anh Đức','Nam','1990-07-05','Hải Phòng','0158962365','22050639@st.phenikaa-uni.edu.vn','22050639','123456','borrower'),
        ('Mai Ngọc Hoàng Linh','Nữ','1992-01-05','Bắc Giang','0632589245','22050640@st.phenikaa-uni.edu.vn','22050640','123456','borrower'),
        ('Bùi Phương Ly','Nữ','1993-07-18','Lào Cai','063257416','22050641@st.phenikaa-uni.edu.vn','22050641','123456','borrower'),
        ('Vu Van Phong','Nam','2002-05-03','Hà Giang','0369136828','phong@phenikaa-uni.edu.vn','vanphong','123456','librarian'),
        ('Tran Van Manh','Nam','2002-12-05','Điện Biên','0125639854','manh@phenikaa-uni.edu.vn','vanmanh','123456','librarian'),
        ('Phạm Văn Kiên','Nam','1986-07-05','Bắc Ninh','0156325986','22050642@st.phenikaa-uni.edu.vn','22050642','123456','borrower');
      
create table `Book`(
`bookId`  varchar(10) primary key,
`name` varchar(200) not null,
`publisher` varchar(200) not null,
`yearOfPublisher` int not null,
`author` varchar(20) not null,
`subject` text not null,
`price` int not null,
`totalQuantity` int not null,
`summary` text not null
);


CREATE TABLE BOOKID
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER tg_Book_insert
BEFORE INSERT ON `Book`
FOR EACH ROW
BEGIN
  INSERT INTO BOOKID VALUES (NULL);
  SET NEW.bookId = CONCAT('SA', LPAD(LAST_INSERT_ID(),4, '0'));
END$$
DELIMITER ;

insert into `Book`(`name`,`publisher`,`yearOfPublisher`,`author`,`subject`,`price`,`totalQuantity`,`summary`)
VALUES 
('The Great Gatsby', 'Scribner', 1925, 'F. Scott Fitzgerald', 'Sách kỹ năng', 120000, 10,N'Tôi nghĩ đây là một đầu sách mà bạn nên mua và đọc ngay, nội dung ly kỳ như một bộ phim hành động vậy, nó lôi cuốn người đọc theo hành trình của Cliff Stoll. Nếu bạn là một người thích phưu lưu cũng như sự kịch tính thì nên đọc nó. Đảm bảo bạn sẽ thấy những gì tôi nói là không sai.'), 
('To Kill a Mockingbird', 'J. B. Lippincott & Co.', 1960, 'Harper Lee', 'Sách truyện', 11000, 150,N'Đừng cố làm người tốt trong mắt tất cả mọi người” điều này sẽ rất vô nghĩa. Thế giới có vô vàn kiểu người, có người tốt, người xấu và trong...'),
('1984', 'Secker & Warburg', 1949, 'George Orwell', 'Tài liệu', 80000, 75,N'Nghệ thuật từ chối cuốn sách giúp bạn chinh phục kỹ năng giao tiếp, giúp bạn biết cách ứng xử sao cho phù hợp với tất cả các mối quan hệ xung quanh.'),
('Pride and Prejudice', 'T. Egerton, Whitehall', 1813, 'Jane Austen', 'Tài liệu', 95000, 200,N'Sống xanh không khó nếu chúng ta suy nghĩ tích cực về nó, thay đổi hành động mỗi ngày sẽ giúp cho cuộc sống của chúng ta tốt lên mỗi ngày.'),
('The Catcher in the Rye', 'Little, Brown and Company', 1951, 'J. D. Salinger', 'Tài liệu', 50000, 2,N'Trưởng thành sau ngàn lần tranh đấu - cuốn sách viết cho người lớn đang chao đảo bên ngưỡng cửa trưởng thành. Những tâm sự của người đi trước, bài học...'),
('The Da Vinci Code', 'Doubleday', 2003, 'Dan Brown', 'Sách truyện', 40000, 120,N'Cuốn sách “Hãy khiến tương lai biết ơn vì hiện tại bạn đã cố gắng hết mình” sẽ là người bạn đồng hành trên chặng đường tương lai phía trước, cuốn...'),
('The Alchemist', 'HarperCollins', 1988, 'Paulo Coelho', 'Tài liệu', 30000, 250,N'“Càng độc lập càng cao quý” là cuốn sách giúp cho các cô gái nắm được bản đồ cuộc sống của mình để từ đó trở thành mẫu con gái mà mình yêu thích.'),
('The Hunger Games', 'Scholastic Corporation', 2008, 'Suzanne Collins', 'Sách kỹ năng', 10000, 180,N'Ổn định hay tự do? câu hỏi mà chúng ta thường gặp khi vừa bước chân vào xã hội và đi làm. Ổn định hay tự do là tùy thuộc vào mục tiêu và cách sống của...'),
('The Lord of the Rings', 'Allen & Unwin', 1954, 'J. R. R. Tolkien', 'Sách truyện', 60000, 80,N'Nếu bạn đang bị kiệt sức giữa ngã ba đường của tuổi trẻ, vậy thì hãy để cuốn sách “Gửi bạn người đã kiệt sức vì những chịu đựng âm thầm” sẽ...'),
('Harry Potter and the Philosophers Stone', 'Bloomsbury Publishing', 1997, 'J. K. Rowling', 'Tài liệu', 300000, 300,N'Xin đổi tổn thương lấy trưởng thành - cuốn sách giúp bạn lấy lại tinh thần sau những ngày chán nản với trọng trách gánh vác trên vai “người trưởng thành...'),
('Lập trình cơ bản với C','NXB Công nghệ thông tin', 2016,'dont know','Sách Khoa học công nghệ – Kinh tế',150000,100,N'Sống thanh thản như người Thụy Điển” là cuốn sách hữu ích giúp bạn lọc bớt những đồ dùng không cần thiết trong cuộc sống. Đôi khi những vật dụng ấy...'),
('Code dạo ký sự – Lập trình viên đâu chỉ biết Code','NXB Dân trí', 2020,'Phạm Huy Hoàng','Sách Khoa học công nghệ – Kinh tế',150000,300,N'“Bluefishing Câu cá trên trời” - khi những điều không thể lại trở thành có thể. Cuộc sống luôn chứa đựng vô vàn bất ngờ vậy nên chúng ta cần phải từ từ...'),
('Liệu IT Đã Hết Thời','NXB Trẻ', 2021,'Nicolas G.carr','Sách Khoa học công nghệ – Kinh tế',250000,250,N'“Là một người con gái gai góc cũng có thể sưởi ấm cả thế gian” này theo cách mà bạn mong muốn. Một tựa sách rất đáng để các cô gái trải nghiệm, đặc...'),
('Nghệ thuật ẩn mình','NXB Công nghệ', 2018,'Kevin Mitnick','Sách Khoa học công nghệ – Kinh tế',289000,50,N'Những lời nhắn nhủ đầy yêu thương được Du Phong viết trong cuốn sách “Tự yêu” dành tặng các cô gái đã, đang và có thể là chưa từng yêu đương lần'),
('Gián điệp mạng','NXB Tự do', 2015,'Cliff Stoll','Sách Khoa học công nghệ – Kinh tế',325000,400,N'Cuốn sách “Mỗi ngày đều đóng vai một người lớn điềm tĩnh” sẽ mang đến cho bạn nhiều cảm xúc mới mẻ, góc nhìn khác đi về thế giới của người trưởng...'),
('Chính Trị Luận','NXB Thế giới', 2018,'Aristotle','Sách Chính trị - pháp luật',169000,350,N'Một lần tới nhân gian, phải sống đời rực rỡ là một cuốn sách giúp bạn khám phá những điều thú vị về cuộc sống, cách để bạn giải quyết những rắc...'),
('Chính Trị – Khái Lược Những Tư Tưởng Lớn','NXB Thế giới', 2018,'DK','Sách Chính trị - pháp luật',298000,150,N'Đừng chỉ đẹp mà không hiểu chuyện” cuốn sách cẩm nang sống dành cho mọi cô gái. Dù bạn là ai, đang ở độ tuổi nào thì cuốn sách này cũng sẽ giúp ích...'),
('Bàn Về Khế Ước Xã Hội','NXB Thế giới', 2018,'J. Rousseau','Sách Chính trị - pháp luật',169000,350,N'“Phụ nữ sống hiểu biết sẽ có cuộc sống đẳng cấp hơn” là một cuốn sách viết rất thực tế về các vấn đề đã và đang xảy ra xung quanh cuộc sống của...'),
('Cộng Hòa','NXB Chính trị', 2012,'J. Rousseau','Sách Chính trị - pháp luật',189000,350,N'hello veraybody');

create table `AwaitingApproval`(
`id` int auto_increment primary key,
`libraryCard` varchar(10) not null,
`bookId` varchar(10) not null,
`borrowedDay` int not null,
 CONSTRAINT FK_AwaitingApproval_User FOREIGN KEY (libraryCard)
        REFERENCES `User`(libraryCard)
        ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_AwaitingApproval_Book FOREIGN KEY (bookId)
        REFERENCES `Book`(bookId)
        ON DELETE CASCADE ON UPDATE CASCADE
);

create table `CallCard`(
`callCardId` varchar(10) primary key,
`libraryCard` varchar(10) not null,
`bookId` varchar(10) not null,
`borrowedDay` int not null,
`borrowedDate` date not null,

 CONSTRAINT FK_CallCard_User FOREIGN KEY (libraryCard)
        REFERENCES `User`(libraryCard)
        ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_CallCard_Book FOREIGN KEY (bookId)
        REFERENCES `Book`(bookId)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CALLCARDID
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER tg_CallCard_insert
BEFORE INSERT ON `CallCard`
FOR EACH ROW
BEGIN
  INSERT INTO CALLCARDID VALUES (NULL);
  SET NEW.callCardId = CONCAT('MS', LPAD(LAST_INSERT_ID(),4, '0'));
END$$
DELIMITER ;

create table ReturnBook(
`returnBookId` varchar(10) primary key,
`callCardId` varchar(10) not null,
`payDay` date not null,
`status` text not null,
`fines` int default 0, 
`note` text,
CONSTRAINT FK_ReturnBook_CallCard FOREIGN KEY (callCardId)
        REFERENCES `CallCard`(callCardId)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RETURNBOOKID
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DELIMITER $$
CREATE TRIGGER tg_ReturnBook_insert
BEFORE INSERT ON `ReturnBook`
FOR EACH ROW
BEGIN
  INSERT INTO RETURNBOOKID VALUES (NULL);
  SET NEW.returnBookId = CONCAT('TS', LPAD(LAST_INSERT_ID(),4, '0'));
END$$
DELIMITER ;

