CREATE DATABASE IF NOT EXISTS sample;
USE sample;

CREATE TABLE IF NOT EXISTS sample_table
(
  `id`         int(11) NOT NULL AUTO_INCREMENT,
  `sample`     text,
  PRIMARY KEY (`id`)
);

INSERT INTO sample_table (sample) VALUES ("sample1");
INSERT INTO sample_table (sample) VALUES ("sample2");
