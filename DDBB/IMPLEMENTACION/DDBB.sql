
--
-- CREATE AND USE DDBB
--
DROP DATABASE IF EXISTS hunkyDoryCode;
CREATE DATABASE hunkyDoryCode;
use hunkyDoryCode;

--
-- Table structure for table TECHNOLOGIES
--
CREATE TABLE technologies (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) NOT NULL
);


--
-- Table structure for table USERS
--
CREATE TABLE users (
  id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  name varchar(50) NOT NULL,
  lastname varchar(70) NOT NULL,
  email varchar(45) NOT NULL,
  password varchar(100) DEFAULT NULL,
  image varchar(255) DEFAULT NULL,
  linkedin varchar(50) DEFAULT NULL,
  google tinyint(1) DEFAULT '0',
  technologies int(11) DEFAULT NULL,
  verificationCode varchar(64) DEFAULT NULL,
  createdAt date DEFAULT NULL,
  updatedAt date DEFAULT NULL,
  verifiedAt date DEFAULT NULL,
  role enum('STUDENT','EXPERT','ADMIN') NOT NULL DEFAULT 'STUDENT',
  lastAuthUpdate datetime DEFAULT NULL,
  FOREIGN KEY (technologies) REFERENCES technologies (id)
);


--
-- Table structure for table POSTS
--
CREATE TABLE posts (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title varchar(80) NOT NULL,
  content text NOT NULL,
  views int(11) NOT NULL DEFAULT '0',
  technology int(11) DEFAULT NULL,
  postedBy int(11) NOT NULL,
  postedAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (postedBy) REFERENCES users (id),
  FOREIGN KEY (technology) REFERENCES technologies (id)
);


--
-- Table structure for table ANSWERS
--
CREATE TABLE answers (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  content text NOT NULL,
  posts_id int(11) DEFAULT NULL,
  createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (posts_id) REFERENCES posts (id)
);

--
-- Table structure for table POSTS_LIKES
--
CREATE TABLE posts_likes (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  post_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  date date DEFAULT NULL,
  FOREIGN KEY (post_id) REFERENCES posts (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);


--
-- Table structure for table ANSWERS_LIKES
--
CREATE TABLE answers_likes (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  answer_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  date date DEFAULT NULL,
  FOREIGN KEY (answer_id) REFERENCES answers (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);


-------------------------- INSERTS --------------------------


--
-- INSERT USERS DATA
--
-- INSERT INTO users VALUES 
-- (1,'John','Hannes','jhonny@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'STUDENT',NULL),
-- (2,'Carla','Bolilla','carlabo@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'STUDENT',NULL),
-- (3,'Cripto','Nelhams','bolicryp@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'STUDENT',NULL),
-- (4,'Bottle','Neck','botneck@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'STUDENT',NULL),
-- (5,'Charles','Baudelaire','chabau@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'STUDENT',NULL),
-- (6,'Albert','Camus','albertca@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'STUDENT',NULL),
-- (7,'Iker','Vyko','vyker@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'STUDENT',NULL),
-- (8,'Yisus','de Deus','ohlord@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'STUDENT',NULL),
-- (9,'Ramon','Canela','ramon@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'EXPERT',NULL),
-- (10,'Francisco','Sovelo','fracisco@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'EXPERT',NULL),
-- (11,'Cristina','Ruiz','cris@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'EXPERT',NULL),
-- (12,'Paola','A','paola@test.com','123456',"https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg",NULL,0,NULL,NULL,NULL,NULL,NULL,'EXPERT',NULL),
-- (30,'Kiko','Sovelo','francisco.sovelo@gmail.com','$2a$12$/r3grIvX4.Nox3ZpwKm41e9VGQ4BHCA5DE8GAsuUWvzNHC0uM8OsW','https://graph.facebook.com/10224614139448241/picture',NULL,1,NULL,'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10','2021-12-15',NULL,NULL,'STUDENT','2021-12-15 12:54:19'),
-- (40,'Ramón','Canela','rcanelav@gmail.com','$2a$12$1kFyNi88juAsL3g.GhpSeeHoiILolzGfpfMBzyAidbsH2TJQ227W.','https://res.cloudinary.com/rayci/image/upload/v1640100795/islpfy3lgal6dsgytrfe.jpg',NULL,0,NULL,'5zN9jvxe8pKr0PLn7J2xzsEIyousnANZrPB9GhTPvLilAOveINmCr0UodJ7Eeu7O','2021-12-21',NULL,NULL,'EXPERT','2021-12-21 17:12:00');
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `image`, `linkedin`, `google`, `technologies`, `verificationCode`, `createdAt`, `updatedAt`, `verifiedAt`, `role`, `lastAuthUpdate`) VALUES
(1, 'John', 'Hannes', 'jhonny@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', '2021-12-21', '2021-12-21', 'STUDENT', '2021-12-31 21:09:11'),
(2, 'Carla', 'Bolilla', 'carlabo@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', NULL, '2021-12-21', 'STUDENT', '2021-12-31 21:16:57'),
(3, 'Cripto', 'Nelhams', 'bolicryp@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', NULL, '2021-12-21', 'STUDENT', '2021-12-31 21:20:54'),
(4, 'Bottle', 'Neck', 'botneck@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', NULL, '2021-12-21', 'STUDENT', NULL),
(5, 'Charles', 'Baudelaire', 'chabau@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', NULL, '2021-12-21', 'STUDENT', NULL),
(6, 'Albert', 'Camus', 'albertca@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', NULL, '2021-12-21', 'STUDENT', NULL),
(7, 'Iker', 'Vyko', 'vyker@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', NULL, '2021-12-21', 'STUDENT', NULL),
(8, 'Yisus', 'de Deus', 'ohlord@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', NULL, '2021-12-21', 'STUDENT', NULL),
(9, 'Ramon', 'Canela', 'ramon@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, 1, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', NULL, '2021-12-21', 'EXPERT', NULL),
(10, 'Francisco', 'Cobelo', 'fracisco@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, 2, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', NULL, '2021-12-21', 'EXPERT', NULL),
(11, 'Cristina', 'Ruiz', 'cris@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, 3, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', NULL, '2021-12-21', 'EXPERT', NULL),
(12, 'Paola', 'A', 'paola@test.com', '123456', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, 4, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-21', NULL, '2021-12-21', 'EXPERT', NULL),
(30, 'Kiko', 'Cobelo', 'francisco.cobelo@gmail.com', '$2a$12$/r3grIvX4.Nox3ZpwKm41e9VGQ4BHCA5DE8GAsuUWvzNHC0uM8OsW', 'https://graph.facebook.com/10224614139448241/picture', NULL, 1, 3, 'pW0WrX9u2n60LfsPmJnXDEtLem4031N5X66OW6Y96Axljq9wfUNI4hbVbNEVZu10', '2021-12-15', NULL, '2021-12-21', 'EXPERT', '2021-12-15 12:54:19'),
(40, 'Ramón', 'Canela', 'rcanelav@gmail.com', NULL, 'https://res.cloudinary.com/rayci/image/upload/v1642177182/uctjnwzu55junuhnphnb.jpg', NULL, 0, 3, '5zN9jvxe8pKr0PLn7J2xzsEIyousnANZrPB9GhTPvLilAOveINmCr0UodJ7Eeu7O', '2021-12-21', '2022-03-11', '2021-12-21', 'ADMIN', '2022-04-10 16:25:25'),
(41, 'admin', 'admin', 'admin@admin.com', '$2a$12$nB/CFPsu9n.f9qPbcZplp.OVVzx9ZeACJ5z3J5Omqaq7NaI6uVL2W', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'G2C2pIBUNteg4HJGzRy1KdQHfC6cvKEoqN5yhAFiAaZsLQppmZZZdbONCqniJrMd', '2021-12-31', NULL, '2021-12-31', 'ADMIN', '2021-12-31 21:20:48'),
(42, 'Ramón', 'Canela', 'asdbbb@gmail.com', '$2a$12$T66z1Ul4d07IR2H533Po8.w1xsKsqMIgVvufA31oy3NmT8FG2mDz6', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'Mpmt2AgRNqEMVlLNPaGFApqkmO4TcidoH6QGvAc7sPLdXf1gPjTy4oMISXjkuBZ5', '2022-01-13', NULL, NULL, 'EXPERT', NULL),
(43, 'Ramón', 'Canela', 'admin@yopmail.com', '$2a$12$3nH7Wu0x3Au/sfy1SPSaUOrQhnptKEpQuFQLJMQcn8ywDnWT/Fe7K', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'aPiZ8IFIxXE7XZdSZxXxfFHH2jpnCNzq6uirDZAV0dmKnymErZHWMiLsoqGGeIzM', '2022-01-14', NULL, NULL, 'EXPERT', NULL),
(44, 'Ramón', 'Canela', 'ramon@yopmail.com', '$2a$12$A0WZufljaDOEy0xXpzoEyuOTSU9wZ3oO.NBrqXqweuIo7hdGwvP9i', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'XFofwPVvJ6uh9XRtKaxwOsXz18fNeP8UsQRYqNkHSgkSVkGZJyd3l7MUe5tDnQoL', '2022-01-14', NULL, NULL, 'EXPERT', NULL),
(45, 'Ramón', 'Canela', 'ramon2@yopmail.com', '$2a$12$LzyO5N2NgOJIH6KWICk5MOBvJVQE7e//fkTMQgGTBleR2l8p8JDmm', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, '1DTYG8CMKVcRKnDlHAONvM95a9IG45tS2N6s5m4bxyT5tlwEjPpzl3TjBlnXVeMk', '2022-01-14', NULL, '2022-01-14', 'EXPERT', NULL),
(46, 'Ramón', 'Canela', 'ramon3@yopmail.com', '$2a$12$YrTfgX7ON1lzuKo5lDi2bOTK9goqORsUkWQd4w5g.ML5dNFfPGhvK', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'FIeDDOzVrFgJN7JrFrA0IyRUCZRYPmIFDXPEe098vnMrPO1KgJWp3XSzSWZxF00Q', '2022-01-14', NULL, '2022-01-14', 'EXPERT', NULL),
(47, 'Ramón', 'Canela', 'ramon4@yopmail.com', '$2a$12$Fdz3RMQo2VEEwh44zF102uLfzsJEjceR7EzwVyHF1.BZ44ffDkCku', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'nD7TcrCHHHu12OgCw5irzgpKhR2v537atNFVOOcbEyjc87tAgMDLQVh1Zk5rAR4t', '2022-01-14', NULL, NULL, 'EXPERT', NULL),
(48, 'Ramón', 'Canela', 'ramon5@yopmail.com', '$2a$12$aSHTxzFLwIffqNVVs.rsH.DonwJ/Ae1Hn0hzid0Wm5mNMFHPsXmJS', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'kbXD1HVYrh8DSBKpfMKM9jtVy5OwnKSEf80ZKOezjxsCXtjT9dRmRpmFs9awFxFx', '2022-01-14', NULL, '2022-01-14', 'EXPERT', NULL),
(49, 'Ramón', 'Canela', 'ramon6@yopmail.com', '$2a$12$VOI/DHualrmqfqu4hTrScO3FaxG6BNa2KFmzzgE4dEsp/tTTMD4tq', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'QNRhb8LRdSYoZblenxdQvQBj4wyx9GQ4KCDm54T3xCmNqo0n0Lm4bXGD5LVPOb62', '2022-01-14', NULL, NULL, 'EXPERT', NULL),
(50, 'Ramón', 'Canela', 'ramon7@yopmail.com', '$2a$12$r9uCgduqn5M7L8U1EcXPYuBy63S3m2wirE.S53Q8WwUV16ilkeNcm', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'YKRkQm3wsm37fFis7lzVXQGT4Mh9cOut42eniiR653ErcJq7fL4Fy6t6K8urVkj6', '2022-01-14', NULL, NULL, 'EXPERT', NULL),
(51, 'Ramón', 'Canela', 'ramon8@yopmail.com', '$2a$12$sztS9CYRaacchFYKSgOXGuidGAHnMomaChvY8oY8nnyxWnVjddPDq', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'nDkcKJLCOunw3vFKbMF88DObsolA6Do39yCEnIzjv6lgpPXi2hAiITrGxoOFP0GS', '2022-01-14', NULL, NULL, 'ADMIN', NULL),
(52, 'Ramón', 'Canela', 'ramon9@yopmail.com', '$2a$12$fj2.SzcIpCxvx7wzCeGiReN.zN.pZKkvILGuCUte8NFARYpd3zfy2', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'yeWPo1gxzqQ4AT8B8a3wBzg1UFBhkiMPDKVs3T9bd3lRQMUPk6GNODHYJKDAi2Wl', '2022-01-14', NULL, NULL, 'ADMIN', NULL),
(53, 'Ramón', 'Canela', 'ramon10@yopmail.com', '$2a$12$P/9av/vI2DyDwwIMJ2pJye8LOfwjJ7diUAJBoENNFkJpDPbQctLSS', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'O6iIW07w7F6yO08HCPZggStoo5XvQ8MvgSgTg6DjA8LowYchMjpvzsYOaJd27lJF', '2022-01-14', NULL, '2022-01-14', 'ADMIN', NULL),
(54, 'asd', 'asd', 'asd@asd.com', '$2a$12$IPgqAuyp7KfqLqyZp3C9tuSELH.k5sfO3Xf7pKlwOad2Tu6KtlRJq', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, '7jo7nO3ecRbtm288CM7WronvtpGrEzuFFXUL6agx7V56UT70BiUdYONXm3aiu30v', '2022-01-16', NULL, NULL, 'EXPERT', NULL),
(55, 'asd', 'asd', 'asdddd@asd.com', '$2a$12$sd5qISjAjTPIV4fnQDyqx..7BavVNMeqrcaN.cfxSzdcIJzFUppAm', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'dOQoXU5Ti2g8Qiqlheavt70rSVq4ymQin7QzQeGQr1OXlpDGAJII9CnQh2hwrkCy', '2022-01-24', NULL, NULL, 'EXPERT', NULL),
(56, 'asd', 'asd', 'hunky@yopmail.com', NULL, 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, 3, 'NsFLFmJswewGbak9xceAW2TAZGgYYZ1HLfBgFXwOEOAJU5kSmjtVD1ir52yyokv0', '2022-02-19', '2022-02-19', '2022-02-19', 'EXPERT', '2022-02-19 00:37:03'),
(57, 'asd', 'asd', 'hunky2@yopmail.com', NULL, 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'vmGio49WyAvNnP6ZYwEDGUPlEM2r3l3Q6ZfYkaTK20edQ1hjee69uxGO7rb4z72C', '2022-02-19', '2022-02-19', '2022-02-19', 'STUDENT', '2022-02-19 01:27:00'),
(61, 'Rebecca', 'Parsons', 'hunky3@yopmail.com', '$2a$12$cQTjAW0Mq7txsTHyichE4.cHDCoPoFGieLGx0XfIuSfBrqpK2jSAW', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, 14, 'Jhb6O3hJYsMP6KXpWmb2bbTtggeh8N32vNIMtVBR59njDZjyUjcJoNxpIXdeD2Ci', '2022-02-22', '2022-04-05', '2022-03-13', 'EXPERT', '2022-04-20 08:00:27'),
(62, 'newUser1', 'The new1', 'newuser1@yopmail.com', '$2a$12$z1ome3tA.vS4nySN5rHi9uB.RWhjBkGoM4uUvyf.4Rnc9bKCnAk4e', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'In4CLdJGZsiGtLs3exx3ic0WxJGKfUKzDooM3YklsTdE3RmE08Jjx4nf8HUkISun', '2022-03-09', NULL, NULL, 'STUDENT', NULL),
(63, 'newUser4', 'The new4', 'newuser4@yopmail.com', '$2a$12$u32TqPtE9m.6ujOQO9Huo.2Yd7xhODyekmcHL1JA/cYwIR38pws5.', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'f5zOPLEWrmrsGmEkXtwlU4Uv5aBz5UJaEolpCIMvQQGu67Xp7NXajQUN06EVAjPv', '2022-03-09', NULL, NULL, 'STUDENT', NULL),
(64, 'newUser', 'The new', 'hunky5@yopmail.com', '$2a$12$/gja71PrGibZb59VHtlnveQrv/esWNk2kxbcEiquOeGx8H2ExQ6S6', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'AdS6AhMaLOziZ0UFa95qP5gLFyiinVMviJd6A4d1Wm0LMKsrc3AkpEp92yN2zRn3', '2022-03-11', NULL, '2022-03-11', 'STUDENT', NULL),
(65, 'newUser', 'The new', 'hunky7@yopmail.com', '$2a$12$ftJ3Cf8oF8DyqkOWY6OIwuE8mRCG/RIkxKl9/Edpl.UZHSF3h6MKa', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, '4cuQdEk2RXEtCdgBAJHACQhH5cI5YMu43usaPnN4BVCDTZNc78A6MGnFGjFIbUYY', '2022-03-11', NULL, NULL, 'STUDENT', NULL),
(66, 'newUser', 'The new', 'newuser@yopmail.com', '$2a$12$UwZoF9NC1Y8zAcwjrln5y.dyE8NeMqMUOwCDn7JGhuuH.DHp/PGnS', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'nDs7a1os5bliRzARpC5ldUhLrkBv46J1CAmPMNqwP4uRVjWojkNRtZB7VbohC5d0', '2022-03-11', NULL, '2022-03-11', 'STUDENT', NULL),
(67, 'newUser1', 'The new', 'newuser2@yopmail.com', '$2a$12$ZiJFSvMc6zRUVl6SHF/3BOpPgDBk7TwOOkkdgRQ/HGF7aOFAoQRtS', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'mytVlUtBrsYHV0NUtw96uaXLQGWbiEsdm5XqkG41xdfmoWmm03NwKpgWeQA0oYmB', '2022-03-11', NULL, NULL, 'STUDENT', NULL),
(68, 'newUser', 'The new', 'newuser10@yopmail.com', '$2a$12$qUKhfI7GV25Gx4PBbGE1Nut/7bMgCkBMYMxM1Gfyx1J42qHakVmO6', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'DGYUcDqWEGDDeqUIxoewwzBQPgYRpR8vdxTqNxs9GYONJpJxPjZvjbgHmvjZTuwp', '2022-03-11', NULL, '2022-03-11', 'STUDENT', NULL),
(69, 'newUser', 'The new', 'newuser11@yopmail.com', '$2a$12$PQAdPkXI1D4U8NO4MGHQl.QJ1pYLIm70NLRyDbdL/7rz.J9.bbGcK', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'U53RyfzbJTdGLkCNZDluZJSlZWQTxqyCM43vG0w5b3E6KluJ2teJF6GYAkyW5gO1', '2022-03-11', NULL, '2022-03-11', 'STUDENT', NULL),
(70, 'newUser', 'new', 'newuser18@yopmail.com', '$2a$12$xuMp9YmbYh5nnsx0dOmv2eSO636qYsGQ9F/SVy1dX5MjMZdxkqmXW', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'x8GlOW2gHjKre4ONqZk1b7tK95V2doUP0vPksiIzuyngBaEsQmV6m6xAIF5ki2td', '2022-03-11', '2022-03-11', NULL, 'STUDENT', '2022-03-11 19:29:30'),
(71, 'newUser', 'The new', 'newuser13@yopmail.com', '$2a$12$69kkQqHAZX7a6XapdcWPGer.dZeCSzpvOaKLCYKk262Eu0Hmx71tq', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'Iky5GiOHVBCA4C3xXcOaRmpZSW7ZCRr1fLg8ti1SPE2M1046dg7qJHztxgf1cl2H', '2022-03-11', NULL, NULL, 'STUDENT', NULL),
(72, 'newUser', 'The new', 'newuser14@yopmail.com', '$2a$12$bM4jNQvmBMMBQ5utFUQG4ubuW1MjTNhkMBRlInxPILUjWCvf6CvE.', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'H3fxiSiZXLoawQeQb9ufVqT5MNx1wtS8r8KAlS2aB6WnvR0kiEjJ5um287zY9sqL', '2022-03-11', NULL, '2022-03-11', 'STUDENT', NULL),
(73, 'newUser', 'new', 'newuser21@yopmail.com', '$2a$12$0W2zobSAx7Cr4gFzpAQFWeWBt5LM2XbguykhPRT7L8IdjNbKHka36', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'MRccpt6tbTz1g1CZFlajN0cgtxmHgzJbpEPRYKlSHMBfBHcyVPccom8nDrXtFbsm', '2022-03-11', '2022-03-11', '2022-03-11', 'STUDENT', '2022-03-11 20:08:32'),
(74, 'asdasd', 'asdasdas', 'newuser22@yopmail.com', '$2a$12$rRAYq7PS2HOJgAWdVLNineAOIkbis1lVwhpCDn1.2O89i.xZpiE4q', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, '5cT1GrD5ODAkHsNkJV5HSaIsKK8XiWoJQCRbHwemCqaygWnrpzdHJsouo0RC1NwH', '2022-03-11', NULL, '2022-03-11', 'STUDENT', '2022-03-11 20:13:13'),
(90, 'Ramon', 'Canela', 'canelacodes@gmail.com', '$2a$12$Hm3NpGsH4LZHrlgYUx/dfuHGk6leQ/eq2zSmng7JVBMlQ/gKD6mTm', 'https://lh3.googleusercontent.com/a/AATXAJxgTwVzdhAIr5_6vXm8UkyHc4DxZax0HK2ceWy5=s96-c', NULL, 1, NULL, '4OKBK2IofgPWpiPuon0V18yLVxmRfiCem36RExVPBgH8GDGPSd0xT0DiwI00G7ly', '2022-03-13', NULL, NULL, 'STUDENT', '2022-03-13 17:08:19'),
(91, 'asdasdasda', 'asd', 'hunky34@yopmail.com', '$2a$12$sA7psFyemM.p9N9gNHbwU.XX8vV..0aj.2Sj9mDL/htYoGkjBwYy2', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'fshOU6fx9gq4xiUfTfdKXSNXngdn84ypVJLeHWBkFFFdIDadbpFVtwUQe2ULNDiE', '2022-03-13', NULL, NULL, 'STUDENT', NULL),
(92, 'asd', 'asd', 'hunky01@yopmail.com', '$2a$12$K4js.QvWOmc/jQmLu5.rTO9LNgrg7egyJKiyq.B6UfTLsvsM47rVm', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'eug8PLiRUYCN98aPUEIV6x2fgTEbb8M9Drl7QAuJdBSrq5ssVDXjk2J8bEHmZpcB', '2022-03-13', NULL, NULL, 'STUDENT', NULL),
(93, 'adadad', 'gggg', 'sssss@yopmail.com', '$2a$12$Zo4USkRBxh6Rp1Pts9w7N.G9n4JF3G0zkUo2HJF5mKtOFkYtjzhJG', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'i7P5jJzmx1ZeTKXHFtgdFnjMvOVYgtDAt4AyuxNfCl1jNURmjOZaQMRXyAJbx8K2', '2022-03-13', NULL, NULL, 'STUDENT', NULL),
(94, 'ddd', 'ddd', 'hunky3asdasdasd@yopmail.com', '$2a$12$BixV83qUlmyP/8L5DUjwsuVwPcUli.cPezve7kwVelYfwL9P6gYlq', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'Gw7zJeIA8LQ9RB0ktABnuJGjgTUcWHlmvAzQqIIthiZVlP8MKD5iIh0P7Ge6eggq', '2022-03-13', NULL, NULL, 'STUDENT', NULL),
(95, 'asdasd', 'asdasd', 'hunky3tggg@yopmail.com', '$2a$12$no3EmaWSmm.45YEOC4pqB.Y6zPC9XXQZlxxm9daTUn09mkwNjvbMK', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'zGOrLcjdxFm8GFspk2Ruh5jPyXGN2J7s8UJlGj59xpRbABlPskGeWLvepbzRgAay', '2022-03-13', NULL, '2022-03-13', 'STUDENT', NULL),
(96, 'faffaaf', 'afafaf', 'hunky31111@yopmail.com', '$2a$12$U6bASkukgwsxpBsKl0dzvOorvaoP8v3b.2p68RowvBYPWZgS6PDBS', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'pSvXUgZiUf3Vg5rEEWoBMNOGEebhYbhAdIomxVwhBV0jylyNuiVgJN0q7kjOGzIj', '2022-03-13', NULL, '2022-03-13', 'STUDENT', NULL),
(97, 'asdasd', 'asdas', 'hunky55513@yopmail.com', '$2a$12$JDvnso5ocn5QnHMTpKpjleupPh7FqnI1SOQh1C5/ICu0Y7C8cY9Ui', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'foeueciLAC7P6xA0e59Wby1gVZb9sX7Y9YsIQj6NEne5liHDQJhcsl6i0GYHvt0l', '2022-03-13', NULL, '2022-03-13', 'STUDENT', NULL),
(98, 'Antia', 'PF.', 'antiap@gmail.com', '$2a$12$gotHJiU..am9YGxKzWINNeOrXCtsn56RxFamfSgamV9DzTdzr2Mr6', 'https://res.cloudinary.com/rayci/image/upload/v1648508295/qpvtxgsyryxryicpiuap.jpg', NULL, 0, 3, 'uMV9OmXxoV6G4CwyXx9DQfjr5ZYRr01bej6VCE6kGwPCmwNuCdZHvJ2QYruXItmp', '2022-03-13', NULL, '2022-03-13', 'EXPERT', '2022-03-28 22:55:49'),
(99, 'Julio ', 'Vasquez ', 'juliocesarvasquez94.2015@gmail.com', '$2a$12$vWkuP/kmUkiYbTOHnMyPpuI8eU3y6ycdNMfUOfFzQ98jhnvwW94Z.', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'WO78KLbalEt6dvJ2IFT3QV8X1f5cjf7LeP8YLdo7xBGeNh0ePRhaM1ztnZynp0fz', '2022-03-13', NULL, '2022-03-13', 'STUDENT', '2022-03-13 22:16:22'),
(100, 'Juan', 'Carlos', 'mezquitalobato@gmail.com', '$2a$12$iMtSTXnpZIVZD.HwPR5HvelJ2jyxk/FaHi2btYmBk8mWiVXtBSC76', 'https://lh3.googleusercontent.com/a-/AOh14Gh7NJQ6y3AjX0P7tdQMG22gbw6_q81jV7DckTsmoA=s96-c', NULL, 1, NULL, 'cMAkYalxoQXqmzeomCby0hq9gRMjEXLto8CMhzQbYVosW2nvUVtdelINlXHTzKUl', '2022-03-13', NULL, '2022-03-13', 'STUDENT', '2022-03-31 08:08:37'),
(101, 'Albert', 'Cinnamon', 'albertopilladocorreo@gmail.com', '$2a$12$/qUeElF4so.xAavC9/dJSO17gh3LpanFtOB8xELlqm1eSmUoLX5Me', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 1, NULL, 'bfu1Qlgkvumnx4YtFSIpQO4bO6zO4Ug1iKjg9mU00fkSxidOwLAxjxalVnqaVvQD', '2022-03-13', '2022-03-13', '2022-03-13', 'STUDENT', '2022-03-13 22:50:10'),
(102, 'Aarom', 'Veira', 'aaronvt98@gmail.com', '$2a$12$vBkPgnTg8c.J27FofpdmFOHcyC7A6ywVhTY2NenLcvgeWsOD6QXOS', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'obm6qNxn3LR9yudqbF8LEWEfBHZShIRKqivIQLs7rAeKmZU8EmbrUWl1fthrhMgQ', '2022-03-14', NULL, '2022-03-14', 'STUDENT', '2022-03-14 03:56:51'),
(103, 'Santiago', 'Folla', 's4ntif03@gmail.com', '$2a$12$dw5XiFpxlo7X2s7Me1ApjO1gCJqGi20N9IaPggpw/k9Mre6sjRw4K', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'tMKVEnHll3fdktNIAPFaIzKvoUv74uc2wnrgEpO1MXJjKrPZaD8AB6jYgOwXr9Hp', '2022-03-14', NULL, '2022-03-14', 'STUDENT', '2022-03-14 08:22:22'),
(104, 'Gonzalo', 'Balay', 'zalo.bl92@gmail.com', '$2a$12$gFUSVPvjw1ekDr9sCNCD5.wR0GsA/uyzRkW78gCVMOsxEijZf4/le', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 1, NULL, 'vuZhyUkNpQt7cS5DiA4lDBzkQFlsF7Vq4zk2xTTFFilHACfbDX4qrgqOIYJY5njk', '2022-03-14', NULL, NULL, 'STUDENT', NULL),
(105, 'Gonzalo', 'Balay', 'zalo_bl92@hotmail.com', '$2a$12$dBg441TAQV93GtAPd170je..IIPc8nLJoFlZxgCBXXtmu31EinWxa', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, '6kb40HzwTwA5MLhdSC6kZQ3fKiRnz8AipnpZi5RUIm4b0SkdhWvaUeiloj0iN3tX', '2022-03-14', NULL, '2022-03-14', 'STUDENT', '2022-03-16 09:56:03'),
(106, 'Pablo', 'Taboas', 'pataboas2001@gmail.com', '$2a$12$YCaGp12SVIYxhzR/fw42I.cLYg1indqB2IWS0LDhrFLqoTeYb.Nk.', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 1, NULL, 'L5lW7zoTLp5ZqVCb7DX1BLnFOXJg6YmO4rkv05oCuEdeucpX2l8lJv82ceFe6Pqr', '2022-03-14', NULL, '2022-03-14', 'STUDENT', '2022-03-14 11:15:07'),
(107, 'Ricardo', 'Mejía', 'io.paradox@gmail.com', '$2a$12$HTEEgnJyRxdxrmGdmaox7OT.i./hLTBKO5gkJSU14O6yH6vPyL2VS', 'https://lh3.googleusercontent.com/a-/AOh14GhCbd3_M5d3SfKwaDUXUvrWIMK5nXz1ldcNXv5wYA=s96-c', NULL, 1, NULL, 'M1pEvqF5thSG1t4Bqyb2W75jPbCIeZTO33HDBjhelGyKmd7ZuIsEXfnO26dqg7fT', '2022-03-28', NULL, '2022-03-28', 'STUDENT', '2022-04-06 18:04:12'),
(108, 'Ricardo', 'Mejia', 'rdesign777@gmail.com', '$2a$12$e4iMoWAkYa/mmdEqgRDu/eIXc7LOgboKbHOY5TAxfy9NDK8UsfmBC', 'https://lh3.googleusercontent.com/a-/AOh14Gg-3pWoYnXGJ3FLHbonfPq_XnLNyiCW16yertLGNg=s96-c', NULL, 1, NULL, 'JcMfoKuTn2u1janQGyYNoEq51WGY4ALoP0ij8I4PXQGseJXQgLb8DU8ReOGawEaX', '2022-03-30', NULL, NULL, 'STUDENT', NULL),
(109, 'Ramon ', 'Canela Guillen', 'Canelaguillen@gmail.com', '$2a$12$DYhbibVmkXH2qffm42/7d.iTyVBXbazSb7dh2TRRviBKNFDixa3fS', 'https://res.cloudinary.com/rayci/image/upload/v1646251811/xt5sm7uuzywetb30umac.jpg', NULL, 0, NULL, 'i6ykKEpq8FribhXtwsEXnPw91YGcpdh5MyhF0u4YdxOKvA3DScuBTMf5RzDe635e', '2022-03-31', NULL, '2022-03-31', 'STUDENT', '2022-03-31 12:30:50'),
(110, 'TestUser', 'TestUser', 'testuser@yopmail.com', '$2a$12$UaAkmMqhs7dg0hv4ZRWiv.zV0ZP52nQyhRC.AS5GH0fdonAEDzfAm', 'https://res.cloudinary.com/rayci/image/upload/v1646251811/xt5sm7uuzywetb30umac.jpg', NULL, 0, NULL, 'NbvQ3D0we0TfYCQvxVlkppK88CSMFjvZNyBuLH9OVDMOA5KpHbrQK8ybGCwzVoLp', '2022-03-31', NULL, '2022-03-31', 'STUDENT', NULL),
(111, 'Richard', 'Perdomo', 'richard.perdomo121@gmail.com', '$2a$12$zXR0XYu2RryRk.B4OFwUjuY5rt20/R3teKPalBWOeBXQIOqMxV.Je', 'https://res.cloudinary.com/rayci/image/upload/v1648812290/yji2fxt0cgqswdfco3fx.jpg', NULL, 1, NULL, 'dXdlilKH20LROwR9US0Nl9JEMtAqlhkHHc1rXJ2Jqskk115AI3Vlb5dzgOKnwSXa', '2022-04-01', '2022-04-01', '2022-04-01', 'STUDENT', '2022-07-04 23:23:30'),
(112, 'Breo', 'Amoedo', 'bramoedo@gmail.com', '$2a$12$GfoqKSdqT43try7mRzNuDepYbmpr9n3yPgk750KlQICXTGQf7ZHTW', 'https://res.cloudinary.com/rayci/image/upload/v1646251811/xt5sm7uuzywetb30umac.jpg', NULL, 0, NULL, 'Fwk0xZ7YAm89cVuDEgciK1ZJtVOzis3yVYRyMPljZPiUyA4cvcrxJkgVh5ONliIe', '2022-04-06', NULL, '2022-04-06', 'STUDENT', '2022-04-06 19:48:41'),
(113, 'Breo', 'Amoedo', 'bramoedo@gmail.com', '$2a$12$sOF9eDUj6tYUkXPwBXdANOSuWvtUPeZGwnfad8k9XlmhClqpm6Vu6', 'https://res.cloudinary.com/rayci/image/upload/v1646251811/xt5sm7uuzywetb30umac.jpg', NULL, 0, NULL, 'pniK4mVFwi7ocT96YQM1CxHFTEsvZgrXYBO5kaC84y9N6XLgpK74cnl3LF3Xyf5D', '2022-04-06', NULL, '2022-04-06', 'STUDENT', NULL),
(114, 'Breo', 'Amoedo', 'bramoedo@gmail.com', '$2a$12$6OwC3QBXuppJHy29jmUP3uKuPtL7vTZD/XXXy3mgM1hKFSJV1g.Iy', 'https://res.cloudinary.com/rayci/image/upload/v1646251811/xt5sm7uuzywetb30umac.jpg', NULL, 0, NULL, 'zThfLgWcxFeO88ASq73UA2YK89f6g1ByAT1ULK1eByDhGCN1e8TWycghAE6QcWJP', '2022-04-06', NULL, '2022-04-06', 'STUDENT', NULL),
(115, 'yiyi', 'orrb', 'proooject@yopmail.com', '$2a$12$h1g.3QyFKfbR1FIayG9H1.Gb4okhsBQpE.BYcm7jGb5bjTeL1gsuK', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, '2aoIbCTwKpqxxdTf1XeyLwyJfV5heQWBIXuDoN4XDBnu4ryja89A1bAtGCCaRvB8', '2022-04-07', NULL, NULL, 'STUDENT', NULL),
(116, 'yiyi', 'yiii', 'prooject@yopmail.com', '$2a$12$N/B7mYtR7PwCWcrMfME/4OvtE3JhOeQDFYuWPanrm5ESnvyQ18dGe', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, '72JGBeeOSB9RgSbbA6ukoojZpCvinIDpBMJPT4yhwcNlaiNzId1gNEb7xn5JL5d9', '2022-04-07', NULL, '2022-04-07', 'STUDENT', NULL),
(117, 'projecto', 'hab', 'projecthab@yopmail.com', '$2a$12$xbp45kPN0jfUxook49cym.09BgNkAlR74hno1xv6sVtt57hHnlNHu', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'PXq0eCAarcxSQCQ8zbUIDIgcVcYDeFyqE67vpQljTWEA3SHzpoXZbBWW4zhtUcXB', '2022-04-07', '2022-04-07', '2022-04-07', 'STUDENT', '2022-04-07 16:14:28'),
(118, 'userTest', 'userTest', 'projecto-test@yopmail.com', '$2a$12$Ep9qvEWV3iw3SE8j//SKy.r5.aqtADyjvLxREpSgHFuN7dSt4Klqe', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'Yp9tTcqOUzuKTOyOpq6U358QzYleRs0vqlVnwBJRRdqkHy2CWYjgkxuUrbvY9bXF', '2022-04-10', NULL, NULL, 'STUDENT', NULL),
(119, 'projectTest', 'projectTest', 'project-test@yopmail.com', '$2a$12$n6hmZTyF9r3162MeIIYWueUT96oCpniHparDIwWRFnGqPJzbd7gG2', 'https://res.cloudinary.com/rayci/image/upload/v1650441644/bhqlmimuosmh0sxlqxov.jpg', NULL, 0, NULL, 'lyRVDtf5diYTfB7EejOM9KEwEmhz2jCIjXXiwEpqf5ZqMFM9EzobdvPY09wsDU88', '2022-04-10', '2022-04-10', '2022-04-10', 'STUDENT', '2022-04-10 16:22:13'),
(120, 'Vedarius', 'Russell', 'topyoutacrs.crypto@gmail.com', '$2a$12$ig0mcm9.MUXCe41Eg/xw0eFIXFKxff/MEdRVAOAv5cDqikPwebJr6', 'https://lh3.googleusercontent.com/a-/AOh14GjyKXYhEG_illnO-xvNnBz6stVCjmT8aR0XOPgO=s96-c', NULL, 1, NULL, 'oyfa0pjx2kvzksqlT1PyyNLT1Juxegl0u9eFQoH20gcfI6LWRfVV38Fz9Dre7wCG', '2022-06-25', NULL, '2022-06-25', 'STUDENT', NULL),
(121, 'Vedarius', 'Russell', 'ytblueyt23@gmail.com', '$2a$12$WLkyeNnt/IXu2Oj23101HuxH.XlEmLlyxxlIlyvUJw7vKdFnamO8m', 'https://res.cloudinary.com/rayci/image/upload/v1646251811/xt5sm7uuzywetb30umac.jpg', NULL, 0, NULL, 'np1Eh5UWWF04gixysDdInwBuDuw4P18mIfTY3L8MFea6LRHyRIXC1vG9DQsJN0aJ', '2022-06-25', NULL, NULL, 'EXPERT', NULL);


--
-- INSERT POSTS DATA
--
-- INSERT INTO posts VALUES 
-- (1,'Test','Esto es un test1',23,5,1,'0000-00-00 00:00:00'),
-- (2,'Test','Esto es un test2',13,2,3,'0000-00-00 00:00:00'),
-- (3,'Test','Esto es un test3',66,1,4,'0000-00-00 00:00:00'),
-- (4,'Test','Esto es un test4',32,6,2,'0000-00-00 00:00:00'),
-- (5,'Test','Esto es un test5',5,2,1,'0000-00-00 00:00:00'),
-- (6,'Post 1','This is the first post',20,4,5,'2021-12-12 16:47:40'),
-- (7,'Post 2','This is the second post',66,3,2,'2021-12-12 16:47:40'),
-- (8,'Post 3','This is the third post',69,5,1,'2021-12-12 16:47:40');

INSERT INTO `posts` (`id`, `title`, `content`, `views`, `technology`, `postedBy`) VALUES
(1, 'What does \"use strict\" do in JavaScript, and what is the reasoning behind it?', 'Doing some searching, I realized that some people add \"use strict\"; into their JavaScript code. Once I added the statement, the error stopped appearing. Unfortunately, Google did not reveal much of the history behind this string statement. Certainly it must have something to do with how the JavaScript is interpreted by the browser, but I have no idea what the effect would be.\n\nSo what is \"use strict\"; all about, what does it imply, and is it still relevant?\n\nDo any of the current browsers respond to the \"use strict\"; string or is it for future use?', 36, 3, 1),
(2, 'What are the differences between a HashMap and a Hashtable in Java?', 'What are the differences between a HashMap and a Hashtable in Java?\n\nWhich is more efficient for non-threaded applications? ', 238, 2, 3),
(3, 'How to round to at most 2 decimal places, if necessary?', '\n\nI\'d like to round at most 2 decimal places, but only if necessary.\n\nInput:\n\n10\n1.7777777\n9.1\n\nOutput:\n\n10\n1.78\n9.1\n\nHow can I do this in JavaScript?\n ', 352, 3, 4),
(4, 'How do you implement a Stack and a Queue in JavaScript?', 'What is the best way to implement a Stack and a Queue in JavaScript?\n\nI\'m looking to do the shunting-yard algorithm and I\'m going to need these data-structures. ', 12, 3, 40),
(5, 'Graph visualization library in JavaScript', 'I have a data structure that represents a directed graph, and I want to render that dynamically on an HTML page. These graphs will usually be just a few nodes, maybe ten at the very upper end, so my guess is that performance isn\'t going to be a big deal. Ideally, I\'d like to be able to hook it in with jQuery so that users can tweak the layout manually by dragging the nodes around.\n\nNote: I\'m not looking for a charting library.', 1, 3, 40),
(7, 'How to check if a map contains a key in Go?', 'I know I can iterate over a map m by,\n\nfor k, v := range m { ... }\n\nand look for a key but is there a more efficient way of testing a key\'s existence in a map?\n\nI couldn\'t find the answer in the language spec. ', 17, 7, 40),
(9, 'How can I get the source directory of a Bash script', 'How do I get the path of the directory in which a Bash script is located, inside that script?\n\nI want to use a Bash script as a launcher for another application. I want to change the working directory to the one where the Bash script is located, so I can operate on the files in that directory, like so:\n\n$ ./application  ', 6, 1, 40),
(10, 'What and where are the stack and heap?', 'Programming language books explain that value types are created on the stack, and reference types are created on the heap, without explaining what these two things are. I haven\'t read a clear explanation of this. I understand what a stack is. But,\n\n    Where and what are they (physically in a real computer\'s memory)?\n    To what extent are they controlled by the OS or language run-time?\n    What is their scope?\n    What determines the size of each of them?\n    What makes one faster?  ', 2, 1, 40),
(11, 'Does functional programming replace GoF design patterns?', 'Since I started learning F# and OCaml last year, I\'ve read a huge number of articles which insist that design patterns (especially in Java) are workarounds for the missing features in imperative languages. One article I found makes a fairly strong claim:\n\n    Most people I\'ve met have read the Design Patterns book by the Gang of Four (GoF). Any self respecting programmer will tell you that the book is language agnostic and the patterns apply to software engineering in general, regardless of which language you use. This is a noble claim. Unfortunately it is far removed from the truth.\n\n    Functional languages are extremely expressive. In a functional language one does not need design patterns because the language is likely so high level, you end up programming in concepts that eliminate design patterns all together.\n\nThe main features of functional programming (FP) include functions as first-class values, currying, immutable values, etc. It doesn\'t seem obvious to me that OO design patterns are approximating any of those features.\n\nAdditionally, in functional languages which support OOP (such as F# and OCaml), it seems obvious to me that programmers using these languages would use the same design patterns found available to every other OOP language. In fact, right now I use F# and OCaml every day, and there are no striking differences between the patterns I use in these languages vs. the patterns I use when I write in Java.\n\nIs there any truth to the claim that functional programming eliminates the need for OOP design patterns? If so, could you post or link to an example of a typical OOP design pattern and its functional equivalent? ', 5, 1, 40),
(12, 'What is \'Context\' on Android?', 'In Android programming, what exactly is a Context class and what is it used for?\n\nI read about it on the developer site, but I am unable to understand it clearly. ', 3, 1, 40),
(13, 'Functional, Declarative, and Imperative Programming', 'What do the terms functional, declarative, and imperative programming mean?', 18, 1, 40),
(14, 'Is functional GUI programming possible?', 'I\'ve recently caught the FP bug (trying to learn Haskell), and I\'ve been really impressed with what I\'ve seen so far (first-class functions, lazy evaluation, and all the other goodies). I\'m no expert yet, but I\'ve already begun to find it easier to reason \"functionally\" than imperatively for basic algorithms (and I\'m having trouble going back where I have to).\n\nThe one area where current FP seems to fall flat, however, is GUI programming. The Haskell approach seems to be to just wrap imperative GUI toolkits (such as GTK+ or wxWidgets) and to use \"do\" blocks to simulate an imperative style. I haven\'t used F#, but my understanding is that it does something similar using OOP with .NET classes. Obviously, there\'s a good reason for this--current GUI programming is all about IO and side effects, so purely functional programming isn\'t possible with most current frameworks.\n\nMy question is, is it possible to have a functional approach to GUI programming? I\'m having trouble imagining what this would look like in practice. Does anyone know of any frameworks, experimental or otherwise, that try this sort of thing (or even any frameworks that are designed from the ground up for a functional language)? Or is the solution to just use a hybrid approach, with OOP for the GUI parts and FP for the logic? (I\'m just asking out of curiosity--I\'d love to think that FP is \"the future,\" but GUI programming seems like a pretty large hole to fill.) ', 115, 1, 40),
(15, 'Clean Architecture vs Onion Architecture', 'I have been reading up on the Onion Architecture and today I found out about Uncle Bob\'s Clean Architecture.\n\nFor the life of me I cannot see any differences between them, they look identical (other than the naming convention).\n\nIs there any differences between the two architectural styles? If yes, can you explain it to me please?\n\nCheers ', 0, 10, 40),
(16, 'Clean code, clean architecture, and clean project structure', 'I have read about clean code and clean architecture by Robert C. Martin (not finished yet), but I don\'t really understand enough. If I have clean code, do I have clean architecture too? If I have clean code and clean architecture, do I have good project structure? So, what is the different between them? The clean code, clean architecture, and good project structure. What is the correlation between them or how they are three related, how can I get good project structure, clean architecture, and clean code? Thank you. ', 1, 10, 40),
(17, 'Clean Architecture and authentication. Correct way?', 'I\'m working on an Android app based on Clean Architecture pattern and I have doubts how to implement user authentication in a clean way. Is the following solution clean in terms of clean architecture?\n\nI would create use cases like below (executed from presentation layer):\n\n    LoginUseCase (for provided login and password fetches api token via remote service and saves in local token source)\n    LogoutUseCase (clears token from LocalTokenSource)\n\n(LocalTokenSource interface would be stored in domain layer and its implementation in data layer - kind of repository)\n\nAnd in order to perform token refresh at each app launch (it\'s not a use case from the user perspective, right?) I would create SessionManager component in domain layer. SessionManager would be responsible for refreshing token and saving it in LocalTokenSource. Each time activity is started, from its presenter I would execute refreshToken() on injected SessionManager. What do you think about the solution?\n\nIf it\'s clean, then how to handle passing token to the remote service to execute other API methods which require token? Lets say I have PostsRepository which fetches posts data from remote service. Should I pass token from a use case to the repository method like repo.getPosts(token)? Or inject LocalTokenSource to the repository, so it could read the token on its own? Wouldn\'t the second option violate Clean Architecture rules, because LocalTokenSource would be used in 2 layers? ', 1, 10, 40),
(18, 'JPA Clean Architecture', 'I\'m refactoring a microservice according to Clean Architecture: Frameworks should be at the utmost layer. So I used the Adapter Pattern and Dependency Inversion to put org.springframework.data.repository.CrudRepository at the utmost layer. But how can I use @Entity (from Java Persistence API) to persist my entities, if entities are in the center and frameworks are at the utmost layer?Frameworks should be at the utmost layer. So I used the Adapter Pattern and Dependency Inversion to put org.springframework.data.repository.CrudRepository at the utmost layer. But how can I use @Entity (from Java Persistence API) to persist my entities, if entities are in the center and frameworks are at the utmost layer?', 1, 10, 40),
(19, 'What are Monolithic Software Architectures other than Clean Architecture', 'Are there any other Software Architectures worth knowing for monolith Softwares other than Clean Architecture (Hexagonal Architecture or Ports and Adapters)?\n\nI couldn\'t find other architectures by simply Googling, and most of the articles in my research are turning around Clean Architecture.\n\nThanks. ', 2, 10, 40),
(20, 'Clean architecture for infrastructure service', 'I have a service A that is essentially doing this:\n\n    Fetches batch of events from external service B.\n    Based on these events, transforms data from the database and persists it back to the database.\n    Sends a confirmation that batch was successfully processed to service B.\n\nI\'m trying to implement this in a \"clean architecture\" manner.\n\nRight now, I\'m having trouble figuring out correct abstraction for the second step. Should this be a use case? How to call the transformation process (is it a Gateway/Adapter/Mapper)? Does clean architecture even apply to an infrastructure service? ', 1, 10, 40),
(21, 'How to understand the VIPER clean architecture?', 'I recently discovered VIPER clean architecture and I started looking for sample tutorials on applying this architecture on the Android platform. However, what I only found was sample projects which were confusing to me that is why I want to follow a simple example to understand the basic principles of VIPER. I am wondering if anyone can share some good tutorials on the above.', 2, 10, 40),
(22, 'Clean Architecture: UseCase Output Port', 'I have a question regarding the \"Use Case Output Port\" in Uncle Bob´s Clean Architecture.\n\nIn the image, Uncle Bob describes the port as an interface. I am wondering if it has to be that way or if the invoked Use Case Interactor could also return a \"simple\" value. In either case the Application and Business Rules Layer would define its interface that the Interface Adapters Layer has to use. So I think for simple invocations just returning a value would not violate the architectural idea.\n\nIs that true?\n\nAdditionally, I think this Output Port Interface implemented by the presenter should work like the Observer pattern. The presenter simply observes the interactor for relevant \"events\". In the case of .NET where events are first-class citizens, I think using one of these is the same idea.\n\nAre these thoughts compatible with the ideas behind Clean Architecture? ', 7, 10, 40),
(23, 'Error: Cannot find module \'../lib/utils/unsupported.js\' while using Ionic', 'I always get this error message when I run \"Ionic start project name\":\nError message\n\nRunning command - failed![ERROR] An error occurred while running npm install (exit code 1):\n\n    module.js:471\n        throw err;\n        ^\n\n    Error: Cannot find module \'../lib/utils/unsupported.js\'\n        at Function.Module._resolveFilename (module.js:469:15)\n        at Function.Module._load (module.js:417:25)\n        at Module.require (module.js:497:17)\n        at require (internal/module.js:20:19)\n        at /usr/local/lib/node_modules/npm/bin/npm-cli.js:19:21\n        at Object. (/usr/local/lib/node_modules/npm/bin/npm-cli.js:79:3)\n        at Module._compile (module.js:570:32)\n        at Object.Module._extensions..js (module.js:579:10)\n        at Module.load (module.js:487:32)\n        at tryModuleLoad (module.js:446:12)  ', 13, 8, 40),
(24, 'Where do I find some good examples for DDD?', 'I\'m learning about Domain Driven Design, however there are some practical issues that are confusing to me that I think seeing some good samples might clear up.\n\nDoes anyone know of some good working code samples that do a good job of modelling basic DDD concepts?\n\nParticularly interested in\n\n    An illustrative Domain Model\n    Repositories\n    Use of Domain/Application Services\n    Value Objects\n    Aggregate Roots ', 20, 11, 40),
(25, 'What is Domain Driven Design (DDD)?', 'I keep seeing DDD (Domain Driven Design) being used a lot in articles - I have read the Wikipedia entry about DDD but still can\'t figure out what it actually is and how I would go about implementing it in creating my sites?', 10, 16, 40),
(26, 'How to assign string to bytes array', '  I want to assign string to bytes array:\n\nvar arr [20]byte\nstr := \"abc\"\nfor k, v := range []byte(str) {\n  arr[k] = byte(v)\n}\n\nHave another method? ', 83, 7, 40),
(27, 'How to iterate over a dictionary?', 'I\'ve seen a few different ways to iterate over a dictionary in C#. Is there a standard way?', 22, 6, 40),
(28, 'Why is processing a sorted array faster than processing an unsorted array?', 'Here is a piece of C++ code that shows some very peculiar behavior. For some strange reason, sorting the data (before the timed region) miraculously makes the loop almost six times faster.\n\n\n    Without std::sort(data, data + arraySize);, the code runs in 11.54 seconds.\n    With the sorted data, the code runs in 1.93 seconds.\n\n(Sorting itself takes more time than this one pass over the array, so it\'s not actually worth doing if we needed to calculate this for an unknown array.)\n\n\nWith a similar but less extreme result.\n\nMy first thought was that sorting brings the data into the cache, but then I thought how silly that was because the array was just generated.\n\n    What is going on?\n    Why is processing a sorted array faster than processing an unsorted array?\n\nThe code is summing up some independent terms, so the order should not matter. ', 30, 5, 56),
(29, 'What is the difference between DAO and Repository patterns?', 'What is the difference between Data Access Objects (DAO) and Repository patterns? I am developing an application using Enterprise Java Beans (EJB3), Hibernate ORM as infrastructure, and Domain-Driven Design (DDD) and Test-Driven Development (TDD) as design techniques.', 115, 11, 61),
(30, 'For-each over an array in JavaScript', '  How can I loop through all the entries in an array using JavaScript?\n\nI thought it was something like this:\n\nforEach(instance in theArray)\n\nWhere theArray is my array, but this seems to be incorrect. ', 23, 3, 70),
(31, 'Efficiency of purely functional programming', '  Does anyone know what is the worst possible asymptotic slowdown that can happen when programming purely functionally as opposed to imperatively (i.e. allowing side-effects)?\n\nClarification from comment by itowlson: is there any problem for which the best known non-destructive algorithm is asymptotically worse than the best known destructive algorithm, and if so by how much? ', 53, 1, 61),
(42, 'Generate random number between two numbers in JavaScript', 'Is there a way to generate a random number in a specified range with JavaScript ?\n\nFor example: a specified range from 1 to 6 where the random number could be either 1, 2, 3, 4, 5, or 6. ', 44, 3, 98),
(43, 'What are fixtures in programming?', 'I have heard of this term many times (in the context of programming) but couldn\'t find any explanation of what it meant. Any good articles or explanations?', 16, 1, 99),
(44, 'En que se diferencia una clase abstracta de una interfaz?', '<p>Recientemente en clase estamos trabajando sobre estos dos conceptos de la POO, pero no termino de entender la diferencia.</p>\n<p>Alguien podr&iacute;a solventar esta duda?&nbsp;</p>\n<p>Gracias de antemano!</p>', 13, 2, 101),
(45, 'Is it OK to leave a channel open?', 'Is it OK to leave a Go channel open forever (never close the channel) if I never check for its state? Will it lead to memory leaks? Is the following code OK?', 12, 7, 40),
(46, 'for', '<p>cual es la sintaxis de un bucle for \"mejorado\"???</p>', 24, 2, 105),
(47, 'como se declara un array en java?', '<p>como se declara un array en java?</p>', 33, 2, 106),
(48, 'What is the scope of variables in JavaScript?', 'What is the scope of variables in javascript? Do they have the same scope inside as opposed to outside a function? Or does it even matter? Also, where are the variables stored if they are defined globally?', 58, 3, 61),
(49, 'Cordova + Ionic framework - How to safely change package name?', '  i would like to change default name of the installation package from default com.ionicframework.starterto com.something.something, how can i do it safely please? What i should to edit?\n\nThanks for any advice. ', 204, 8, 40),
(50, 'What are Monolithic Software Architectures other than Clean Architecture', '<div class=\"s-prose js-post-body\">\n<p>Are there any other Software Architectures worth knowing for monolith Softwares other than Clean Architecture (Hexagonal Architecture or Ports and Adapters)?</p>\n<p>I couldn\'t find other architectures by simply Googling, and most of the articles in my research are turning around Clean Architecture.</p>\n<p>Thanks.</p>\n</div>', 5, 14, 61),
(51, 'What are Monolithic Software Architectures other than Clean Architecture', '<div class=\"s-prose js-post-body\">\n<p>Are there any other Software Architectures worth knowing for monolith Softwares other than Clean Architecture (Hexagonal Architecture or Ports and Adapters)?</p>\n<p>I couldn\'t find other architectures by simply Googling, and most of the articles in my research are turning around Clean Architecture.</p>\n<p>Thanks.</p>\n</div>', 11, 14, 61),
(52, 'TDD concept', '<p>What is it? </p>', 3, 12, 61),
(53, 'Anemic tests', '<p>Can anyone tell me about anemic tests?</p>', 4, 12, 61),
(54, 'Self testing code? ', '<p>What is self testing code?</p>', 4, 1, 61),
(55, 'TDD?', '<p>RED GREEN REFACTOR?</p>', 8, 12, 61),
(56, 'what is ABI', '<p>What is an application binary interface (ABI)?</p>', 9, 5, 117),
(57, 'Can Apache Kafka be used with c++?', '<p>I am new to Apache Kafka. Kafka documentation mentions that it can be used with C++. But i am not sure how to do that. My application continuously generates image files and need to be transferred to another machine. I felt i could use stream api of Kafka but not sure how to stream image files.</p>', 15, 5, 119);


--
-- INSERT ANSWERS DATA
--
-- INSERT INTO answers VALUES 
-- (1,'Esto es una respuesta1',1,'0000-00-00 00:00:00'),
-- (2,'Esto es una respuesta2',3,'0000-00-00 00:00:00'),
-- (3,'Esto es una respuesta3',2,'0000-00-00 00:00:00');

INSERT INTO `answers` (`id`, `content`, `posts_id`, `postedBy`) VALUES
(3, 'Esto es una respuesta3', 2, 40),
(4, 'answers', 2, 40),
(5, 'answerss', 2, 40),
(6, 'answerss', 2, 40),
(7, 'answerss', 2, 40),
(8, 'answerss', 2, 40),
(9, 'answerss', 2, 40),
(10, 'answerss', 2, 40),
(11, 'answerss', 2, 40),
(12, 'hgola como estas', 3, 40),
(13, 'Respuesta al post 3', 3, 40),
(14, '<p>uyyhu</p>', 3, 40),
(15, '<p>uyyhu</p>', 3, 40),
(16, '<p>dsf</p>', 3, 40),
(17, '<p>dd</p>', 3, 40),
(18, '<p>ss</p>', 3, 40),
(19, '<p>sdd</p>', 3, 40),
(20, '<p>s</p>', 3, 40),
(21, '<p>ssdadas</p>', 3, 40),
(22, '<p>ssdadassd</p>', 3, 40),
(23, '<p>d</p>', 3, 40),
(24, '<p>s</p>', 3, 40),
(25, '<p>sasd</p>', 3, 40),
(26, '<p>sasd</p>', 3, 40),
(27, '<p>esto es una respuesta</p>', 3, 40),
(28, '<p>esto es una respuesta</p>', 3, 40),
(29, '<p>Prueba de respuesta</p>', 3, 40),
(30, '<p>Comentario desde perfil de admin</p>', 29, 40),
(31, '<p>Genial</p>', 31, 40),
(32, '<p>Respuesta de prueba</p>', 48, 40),
(33, '  You should make this change in the config.xml found at the root of your project. For example you might have something like this:\n\n\n\nChange the id to whatever you wish your package to be and it will work for the entire project, Android and iOS.\n\nHowever, if you\'ve already submitted to the app store with a package name, you cannot change the package name at this point. Not unless you want to submit a new project. Updates must be made with matching package names.\n\nRegards, ', 49, 40),
(34, '  This is what I did,\n\n        Change the package name in config.xml\n        enter \"ionic repair\"\n\nThat\'s it.\n\nIt removes/adds platform, removes/adds node packages and does other stuff, but everything will be automatic. ', 49, 40),
(35, '<p>Answer my own post</p>', 50, 61),
(37, '<p>Respuesta</p>', 1, 40),
(39, '<p>Answer</p>', 53, 61),
(40, '<p>Application Binary Interface: \"This is how to call a function.\"</p>\n<p><br />The ABI is set of rules that compilers and linkers adhere to in order to compile your program so that will work properly.</p>', 56, 40),
(41, '<p>Yes, you can use Apache Kafka with C/C++.<br />By far the most popular C/C++ client is github.com/edenhill/librdkafka. You can use the client to read data from Kafka and write data back to Kafka.<br />Further documentation on librdkafka is available at http://docs.confluent.io (the author of librdkafka, Magnus Edenill, works at Confluent).</p>', 57, 40);


--
-- INSERT TECHNOLOGIES DATA
--
INSERT INTO technologies VALUES 
(1,'Programming'),
(2,'Java'),
(3,'Javascript'),
(4,'C'),
(5,'C++'),
(6,'C#'),
(7,'GOlang'),
(8,'Ionic'),
(9,'Clean code'),
(10,'Clean architecture'),
(11,'Domain Driven Design'),
(12,'Test Driven Design'),
(13,'Events Driven Design'),
(14,'Hexagonal Architecture'),
(15,'Microservices'),
(16,'NodeJS'),
(17,'React');

--
-- INSERT ANSWER LIKES DATA
--

-- INSERT INTO answer_likes VALUES 
-- (1,1,1,"2023-05-15"),
-- (2,1,2,"2023-05-15"),
-- (3,1,3,"2023-05-15"),
-- (4,2,1,"2023-05-15"),
-- (5,2,2,"2023-05-15"),
-- (6,2,3,"2023-05-15"),
-- (7,3,1,"2023-05-15"),
-- (8,3,2,"2023-05-15"),
-- (9,3,3,"2023-05-15");


INSERT INTO `answers_likes` (`id`, `answer_id`, `user_id`, `date`) VALUES
(20, 3, 1, '2021-12-29'),
(33, 3, 40, '2022-02-02'),
(46, 12, 40, '2022-02-02'),
(50, 5, 101, '2022-03-13'),
(51, 6, 101, '2022-03-13'),
(52, 24, 61, '2022-03-24'),
(62, 29, 61, '2022-03-31'),
(67, 34, 61, '2022-03-31'),
(69, 33, 111, '2022-04-01'),
(77, 33, 40, '2022-04-05'),
(79, 29, 40, '2022-04-05'),
(81, 41, 40, '2022-04-10'),
(82, 13, 111, '2022-07-04');

--
-- INSERT POSTS LIKES DATA
--
-- INSERT INTO posts_likes VALUES
-- (1,1,1,"2023-05-15"),
-- (2,1,2,"2023-05-15"),
-- (3,1,3,"2023-05-15"),
-- (4,2,1,"2023-05-15"),
-- (5,2,5,"2023-05-15"),
-- (6,2,7,"2023-05-15"),
-- (7,3,3,"2023-05-15"),
-- (8,3,6,"2023-05-15"),
-- (9,3,2,"2023-05-15");

INSERT INTO `posts_likes` (`id`, `post_id`, `user_id`, `date`) VALUES
(4, 7, 30, '2022-01-06'),
(5, 7, 1, '2022-01-06'),
(6, 7, 5, '2022-01-06'),
(51, 2, 40, '2022-02-02'),
(54, 3, 40, '2022-02-03'),
(55, 27, 56, '2022-02-18'),
(56, 28, 56, '2022-02-19'),
(58, 30, 61, '2022-03-11'),
(61, 30, 40, '2022-03-13'),
(62, 42, 98, '2022-03-13'),
(63, 44, 101, '2022-03-13'),
(64, 44, 105, '2022-03-14'),
(66, 46, 106, '2022-03-14'),
(69, 48, 61, '2022-03-24'),
(86, 49, 100, '2022-03-31'),
(89, 51, 40, '2022-03-31'),
(90, 3, 61, '2022-03-31'),
(102, 49, 40, '2022-03-31'),
(108, 45, 111, '2022-04-01'),
(109, 4, 40, '2022-04-02'),
(112, 49, 61, '2022-04-05'),
(113, 52, 61, '2022-04-05'),
(114, 1, 40, '2022-04-05'),
(115, 51, 61, '2022-04-05'),
(116, 53, 61, '2022-04-05'),
(120, 54, 61, '2022-04-05'),
(121, 55, 61, '2022-04-05'),
(123, 56, 40, '2022-04-07'),
(124, 57, 119, '2022-04-10'),
(125, 57, 40, '2022-04-10');

---EOF