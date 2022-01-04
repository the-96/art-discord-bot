-- Script name: 	inserts.sql
-- Author:      	Thomas He
-- Purpose:     	to insert sample data to test database integrity
   
-- The database data is inserted into
USE ArtGalleryManagementDB;

-- general user table insert
INSERT INTO general_user (general_user_id)
VALUES (1) , (2) , (3);

-- unregistered user table insert
INSERT INTO unregistered_user(unregistered_user_id,general_user_general_user_id)
VALUES (1,7),(1,8),(1,9);

-- registered user table insert
INSERT INTO registered_user (registered_user_id, username, password, name, email, general_user_id) 
VALUES (1, 'user1', 'pass1','Jerome', '12@gmail.com',4) , (2, 'user2', 'pass2','Joanne', '13@gmail.com',5) , (3, 'user3', 'pass2','Abi', '14@gmail.com',6);

-- customer user table insert
INSERT INTO customer (customer_id, customer_name, registered_user_id) 
VALUES (1,'Smalls',4) , (2,'Harold',5),(3,'Tina',6);

-- role table insert
INSERT INTO role (role_id, role_name)
VALUES (1,'Admin'), (2,'Customer'), (3,'Artist'), (4,'Gallery');

-- role assignment table insert
INSERT INTO assigned (id, registered_user_id, role_id)
VALUES (1,2,2), (2,1,2), (3,3,4);


-- gallery user table insert
INSERT INTO gallery (gallery_id, gallery_name,registered_user_id)
VALUES (1,'arts gallery',10), (2,'major gallery',11), (3,'New York gallery',12);


-- artist user table insert
INSERT INTO artist (artist_id, birthday, biography, registered_user_id)
VALUES (1,'May 15, 1960','',13), (2,'October 15, 2000', 'He was really talented for his age with pastels',14), (3,'June 3, 1990','No biography written...',15);


-- artwork table insert
INSERT INTO artwork ( artwork_id, name, price, availability, description, customer_id, gallery_id)
VALUES (1,'The bridge', 67, 1, 'A photo of London bridge',NULL, 1 ), (2,'Home', 1000, 0, 'multiple artists drew this',  2, NULL), (3,'Photo of Jesus', 10, 1, 'A photo of someone dressed as Jesus', NULL, 2);


-- artist to artwork table insert
INSERT INTO creates (artist_artist_id, artwork_category_id)
VALUES (1,1), (2,3), (3,3);


-- painting artwork table insert
INSERT INTO painting (painting_id, artwork_id)
VALUES (1,1), (2,2), (3,6);
 
 
 -- architecture artwork table insert
INSERT INTO architecture (architecture_id, artwork_id)
VALUES (1,3), (2,4), (3,5);


-- sculpture artwork table insert
INSERT INTO sculpture (sculpture_id, artwork_id)
VALUES (1,7), (2,8), (3,9);


-- photograph artwork table insert
INSERT INTO photograph (photograph_id, artwork_id)
VALUES (1,10), (2,11), (3,12);


-- music artwork table insert
INSERT INTO music (music_id, artwork_id)
VALUES (1,13), (2,14), (3,15);


-- graphic design artwork table insert
INSERT INTO graphic_design (graphic_design_id, artwork_id)
VALUES (1,16), (2,17), (3,18);


-- artwork image link table insert
INSERT INTO image (image_id, image_url, artwork_id)
VALUES (1,'file.png',1), (2,'google.com/thisimage.png',14), (3,'imgur.com/art.png',15);


-- genre table insert
INSERT INTO genre (genre_id, genre_name)
VALUES (1,'abstract'), (2,'fruits'), (3,'portrait');


-- artwork to genre table insert
INSERT INTO artwork_has_genre(genre_id,artwork_id)
VALUES (1,2),(2,3),(3,5);


-- customer address table insert
INSERT INTO address( address_id, street_name, street_num, zip_code, state, country, customer_id)
VALUES (1, 'Berry St.', 512, 90210, 'CA', 'United States',1), (2, 'Holiday Avenue', 121212 , 84923, 'WA', 'United States',2), (3, 'Hooligan Dr.', 1600 , 2313, NULL, 'United Kingdom',3);


-- gallery director table insert
INSERT INTO director( director_id,name)
VALUES (1, 'Elon Mask'), (2, 'Charles Adamberg'), (3, 'Sophie Lee');


-- gallery to director table insert
INSERT INTO director_has_gallery(directory_id,gallery_id)
VALUES (1,2), (1,1), (2,1);


-- painting artstyle table insert
INSERT INTO artstyle(artstyle_id, style_name)
VALUES (1,'charcoal'), (2,'watercolor'),(3,'acrylic');


-- painting to artstyle relationship table insert
INSERT INTO painting_has_artstyle(painting_id,artstyle_id)
VALUES (1,1),(2,1),(3,3);


-- sculpture material table insert
INSERT INTO material(material_id,material_name)
VALUES (1,'Clay'), (2,'Copper'), (3,'Marble');


-- sculpture to material relationship table insert
INSERT INTO material_has_sculpture(material_id,sculpture_id)
VALUES(1,1),(1,2),(3,3);


-- payment method table insert
INSERT INTO payment_method(payment_id,name)
VALUES(1,'dads card'), (2,'checking acct'), (3,'credit');


-- customer to payment method table insert
INSERT INTO customer_has_payment_method( customer_customer_id, payment_method_category_id)
VALUES (1,1), (2,2), (3,3);


-- credit card payment info table insert
INSERT INTO credit_card(credit_card_id, full_name, exp_date, security_code, card_number, payment_method_payment_id)
VALUES (1,'Harrison P Ivanov','09/25',111,1234123412341234, 3), (2,'Harry D Potter','06/22', 935 , 161645458585946, 1), (3,'Tommy Le','02/30', 150, 6189491652316666, 4);


-- bank deposit payment info table insert
INSERT INTO bank_deposit(bank_acct_id, bank_name, acct_num, routing_num, payment_method_payment_id)
VALUES (1,'Bank of America', 12301931, 100003131, 2), (2,'Chase', 123123333, 4141414141, 5), (3,'Bank of the West', 111111113, 123113313, 6);