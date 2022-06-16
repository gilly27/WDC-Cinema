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
    screening_id INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY(seat_id),
    KEY idx_fk_screening_id (screening_id),
    CONSTRAINT fk_seat_screening FOREIGN KEY(screening_id) REFERENCES screening(screening_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE movie (
    movie_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    movie_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (movie_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

