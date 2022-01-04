INSERT INTO `genre` (`id`, `name`) VALUES
(0, 'Horror');

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Calm');

INSERT INTO `genre` (`id`, `name`) VALUES
(2, 'Abstract');

INSERT INTO `genre` (`id`, `name`) VALUES
(3, 'People');

INSERT INTO `genre` (`id`, `name`) VALUES
(4, 'Landscape');

INSERT INTO `genre` (`id`, `name`) VALUES
(5, 'Portrait');

INSERT INTO `genre` (`id`, `name`) VALUES
(6, 'Design');

INSERT INTO `genre` (`id`, `name`) VALUES
(7, 'Red');

INSERT INTO `genre` (`id`, `name`) VALUES
(8, 'Green');INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(0, 'user1', 'password123', '2@mail.com');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(1, 'user2', 'password', 'png@mail.com');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(2, 'user3', 'password1', 'user3@gmail.com');INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(0, 'user1', 'password123', '2@mail.com');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(1, 'user2', 'password', 'png@mail.com');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(2, 'user3', 'password1', 'user3@gmail.com');INSERT INTO `artist` (`id`, `name`, `bio`, `birthday`, `registered_user_id`) VALUES
(0, 'michael', 'he was a good artist', '05/20/1902', 0);
INSERT INTO `artist` () VALUES
();
INSERT INTO `artist` () VALUES
();
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(3, 'username', '123', '23123@masdf');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(4, 'customer1', '324', 'c1@mail.com');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(5, 'customer2', '111', 'c2@mail.sfsu.edu');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(6, 'customer3', '123', 'c3@mail.sfsu.edu');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(7, 'director1', '4141', 'd1@mail.sfsu.edu');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(8, 'director2', '14141', 'd2@mail.sfsu.edu');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(9, 'director3', 'mail', 'd3@mail.sfsu.edu');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(10, 'user4', 'adsf', 'u4@mail.sfsu.edu');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(11, 'user5', 'lsakdf', 'u5@mail.com');
INSERT INTO `registered_user` (`id`, `username`, `password`, `email`) VALUES
(12, 'user6', 'mail', 'fd@mail.sfsu.edu');INSERT INTO `artist` (`id`, `name`, `bio`, `birthday`, `registered_user_id`) VALUES
(0, 'michael', 'he was a good artist', '05/20/1902', 0);
INSERT INTO `artist` (`id`, `name`, `bio`, `birthday`, `registered_user_id`) VALUES
(0, 'michael', 'he was a good artist', '05/20/1902', 0);
UPDATE `ArtGalleryManagementDB`.`artwork` SET `price` = 10 WHERE `id` = 11;
UPDATE `ArtGalleryManagementDB`.`artwork` SET `price` = 5 WHERE `id` = 9;
UPDATE `ArtGalleryManagementDB`.`artwork` SET `price` = 10 WHERE `id` = 11;
UPDATE `ArtGalleryManagementDB`.`artwork` SET `price` = 5 WHERE `id` = 9;
UPDATE `ArtGalleryManagementDB`.`artwork` SET `price` = 10 WHERE `id` = 11;
UPDATE `ArtGalleryManagementDB`.`artwork` SET `price` = 5 WHERE `id` = 9;


INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(2, 1);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(3, 1);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(1, 2);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(3, 2);INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(0, 0);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(2, 1);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(3, 1);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(1, 2);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(3, 2);INSERT INTO `material` (`id`, `name`) VALUES
(0, 'Marble');
INSERT INTO `material` (`id`, `name`) VALUES
(1, 'Clay');
INSERT INTO `material` (`id`, `name`) VALUES
(2, 'Metal');
INSERT INTO `material` (`id`, `name`) VALUES
(3, 'Copper');INSERT INTO `material` (`id`, `name`) VALUES
(0, 'Marble');
INSERT INTO `material` (`id`, `name`) VALUES
(1, 'Clay');
INSERT INTO `material` (`id`, `name`) VALUES
(2, 'Metal');
INSERT INTO `material` (`id`, `name`) VALUES
(3, 'Copper');
INSERT INTO `make` (`artist`, `artwork`) VALUES
(0, 0);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(0, 1);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(0, 2);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(0, 3);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(0, 4);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(0, 5);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(0, 6);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(1, 2);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(1, 3);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(1, 4);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(1, 5);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(1, 6);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(1, 7);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(1, 8);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(2, 2);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(2, 3);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(2, 4);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(2, 5);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(2, 9);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(2, 10);
INSERT INTO `make` (`artist`, `artwork`) VALUES
(2, 11);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(0, 0);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(2, 1);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(3, 1);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(1, 2);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(3, 2);INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(0, 0);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(2, 1);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(3, 1);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(1, 2);
INSERT INTO `material_has_sculpture` (`material_id`, `sculpture_id`) VALUES
(3, 2);INSERT INTO `material` (`id`, `name`) VALUES
(0, 'Marble');
INSERT INTO `material` (`id`, `name`) VALUES
(1, 'Clay');
INSERT INTO `material` (`id`, `name`) VALUES
(2, 'Metal');
INSERT INTO `material` (`id`, `name`) VALUES
(3, 'Copper');INSERT INTO `material` (`id`, `name`) VALUES
(0, 'Marble');
INSERT INTO `material` (`id`, `name`) VALUES
(1, 'Clay');
INSERT INTO `material` (`id`, `name`) VALUES
(2, 'Metal');
INSERT INTO `material` (`id`, `name`) VALUES
(3, 'Copper');INSERT INTO `make` (`artist`, `artwork`) VALUES
(0, 0);

INSERT INTO `material` (`id`, `name`) VALUES
(0, 'Marble');
INSERT INTO `material` (`id`, `name`) VALUES
(1, 'Clay');
INSERT INTO `material` (`id`, `name`) VALUES
(2, 'Metal');
INSERT INTO `material` (`id`, `name`) VALUES
(3, 'Copper');
INSERT INTO `deposit` (`id`, `bank_name`, `acct_num`, `routing_num`, `payment_id`) VALUES
(0, 'Chase', '0000021345625', '1226446313164', 2);
INSERT INTO `deposit` (`id`, `bank_name`, `acct_num`, `routing_num`, `payment_id`) VALUES
(1, 'Bank Of America', '00061646161314', '1212121212121256', 5);