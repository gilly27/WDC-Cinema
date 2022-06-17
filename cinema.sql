/* Template for database from sakila.sql */

SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS cinema;
CREATE SCHEMA cinema;
USE cinema;

CREATE TABLE customer (
    customer_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) DEFAULT NULL,
    password_hash VARCHAR(25) NOT NULL,
    PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE booking (
    booking_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id INTEGER UNSIGNED NOT NULL,
    screening_id INTEGER UNSIGNED NOT NULL,
    seat_id TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (booking_id),
    KEY idx_fk_customer_id (customer_id),
    KEY idx_fk_screening_id (screening_id),
    KEY idx_fk_seat_id (seat_id),
    CONSTRAINT fk_booking_customer FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_booking_screening FOREIGN KEY(screening_id) REFERENCES screening(screening_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_booking_seat FOREIGN KEY(seat_id) REFERENCES seat(seat_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE screening (
    screening_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    movie_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(screening_id),
    KEY idx_fk_movie_id (movie_id),
    CONSTRAINT fk_screening_movie FOREIGN KEY(movie_id) REFERENCES movie(movie_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE seat (
    seat_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    seat_row VARCHAR(1) NOT NULL,
    seat_number TINYINT UNSIGNED NOT NULL,
    taken TINYINT UNSIGNED NOT NULL,
    screening_id INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY(seat_id),
    KEY idx_fk_screening_id (screening_id),
    CONSTRAINT fk_seat_screening FOREIGN KEY(screening_id) REFERENCES screening(screening_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE movie (
    movie_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    movie_name VARCHAR(255) NOT NULL,
    image_url VARCHAR(512) NOT NULL,
    PRIMARY KEY (movie_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO movie (movie_name, image_url) VALUES
('Lightyear', 'https://www-s3.hoyts.com.au/movies/AU/HO00006927/large.jpg'),
('Jurassic World Dominion', 'https://www-s3.hoyts.com.au/movies/AU/HO00006430/large.jpg'),
('Top Gun: Maverick', 'https://www-s3.hoyts.com.au/movies/AU/HO00003807/large.jpg');

INSERT INTO screening (start_time, end_time, movie_id) VALUES
('2022-06-16 11:00:00', '2022-06-16 13:00:00', 1),
('2022-06-17 12:00:00', '2022-06-17 14:00:00', 1),
('2022-06-18 13:00:00', '2022-06-18 15:00:00', 1),
('2022-06-16 14:00:00', '2022-06-16 16:00:00', 2),
('2022-06-17 15:00:00', '2022-06-17 17:00:00', 2),
('2022-06-18 16:00:00', '2022-06-18 18:00:00', 2),
('2022-06-16 17:00:00', '2022-06-16 19:00:00', 3),
('2022-06-17 18:00:00', '2022-06-17 20:00:00', 3),
('2022-06-18 19:00:00', '2022-06-18 21:00:00', 3);

INSERT INTO seat (seat_row, seat_number, taken, screening_id) VALUES
('A', 1, 0, 1),
('A', 2, 1, 1),
('A', 3, 0, 1),
('A', 4, 1, 1),
('A', 5, 0, 1),
('B', 1, 0, 1),
('B', 2, 1, 1),
('B', 3, 0, 1),
('B', 4, 1, 1),
('B', 5, 0, 1),

('A', 1, 1, 2),
('A', 2, 0, 2),
('A', 3, 0, 2),
('A', 4, 0, 2),
('A', 5, 0, 2),
('B', 1, 1, 2),
('B', 2, 1, 2),
('B', 3, 0, 2),
('B', 4, 0, 2),
('B', 5, 1, 2),

('A', 1, 0, 3),
('A', 2, 0, 3),
('A', 3, 1, 3),
('A', 4, 0, 3),
('A', 5, 0, 3),
('B', 1, 0, 3),
('B', 2, 0, 3),
('B', 3, 1, 3),
('B', 4, 0, 3),
('B', 5, 1, 3),

('A', 1, 0, 4),
('A', 2, 1, 4),
('A', 3, 1, 4),
('A', 4, 0, 4),
('A', 5, 0, 4),
('B', 1, 1, 4),
('B', 2, 1, 4),
('B', 3, 1, 4),
('B', 4, 0, 4),
('B', 5, 1, 4),

('A', 1, 0, 5),
('A', 2, 0, 5),
('A', 3, 0, 5),
('A', 4, 0, 5),
('A', 5, 0, 5),
('B', 1, 0, 5),
('B', 2, 0, 5),
('B', 3, 0, 5),
('B', 4, 0, 5),
('B', 5, 1, 5),

('A', 1, 1, 6),
('A', 2, 0, 6),
('A', 3, 0, 6),
('A', 4, 1, 6),
('A', 5, 1, 6),
('B', 1, 1, 6),
('B', 2, 1, 6),
('B', 3, 0, 6),
('B', 4, 0, 6),
('B', 5, 0, 6),

('A', 1, 1, 7),
('A', 2, 1, 7),
('A', 3, 1, 7),
('A', 4, 1, 7),
('A', 5, 1, 7),
('B', 1, 1, 7),
('B', 2, 1, 7),
('B', 3, 0, 7),
('B', 4, 0, 7),
('B', 5, 1, 7),

('A', 1, 1, 8),
('A', 2, 0, 8),
('A', 3, 1, 8),
('A', 4, 0, 8),
('A', 5, 0, 8),
('B', 1, 1, 8),
('B', 2, 1, 8),
('B', 3, 0, 8),
('B', 4, 1, 8),
('B', 5, 1, 8),

('A', 1, 0, 9),
('A', 2, 0, 9),
('A', 3, 1, 9),
('A', 4, 0, 9),
('A', 5, 1, 9),
('B', 1, 1, 9),
('B', 2, 1, 9),
('B', 3, 1, 9),
('B', 4, 1, 9),
('B', 5, 1, 9);