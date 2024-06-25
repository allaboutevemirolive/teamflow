-- password: admin
INSERT INTO tt_user (id, version, password, first_name, last_name, gender, birthday, email, phone_number, avatar)
VALUES ('7bda2971-65e7-4c57-a376-5651120c6080', 0, '{bcrypt}$2a$12$KjOgo8JwrUs2ZHTShDNiHO6Az8dnxxawRjXZLruxMuLc2J3JeQqJe', 'Admin', 'Admin', 'MALE', '2024-06-25', 'admin@gmail.com', '1234567890', NULL);
INSERT INTO user_roles (user_id, role)
VALUES ('7bda2971-65e7-4c57-a376-5651120c6080', 'ADMIN');

-- password: admin
INSERT INTO tt_user (id, version, password, first_name, last_name, gender, birthday, email, phone_number, avatar)
VALUES ('b6f7e73e-7113-4b46-9635-159b8d775cf3', 0, '{bcrypt}$2a$12$KjOgo8JwrUs2ZHTShDNiHO6Az8dnxxawRjXZLruxMuLc2J3JeQqJe', 'John', 'Doe', 'MALE', '1990-01-01', 'johndoe@example.com', '1234567890', NULL);
INSERT INTO user_roles (user_id, role)
VALUES ('b6f7e73e-7113-4b46-9635-159b8d775cf3', 'USER');

