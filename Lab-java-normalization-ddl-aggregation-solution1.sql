CREATE DATABASE lab_java_normalization_ddl1;

USE lab_java_normalization_ddl1;


create table lab_ddl1(id int AUTO_INCREMENT,
                      title_id int,
                      author_id int not null,
                      word_count int not null,
                      views int not null,
                      primary key (id),
                      FOREIGN KEY (author_id) REFERENCES author(author_id),
                      FOREIGN KEY (title_id) REFERENCES title(title_id)

);

create table author (
                        author_id int primary key,
                        author_name varchar(20) not null
);

create table title(
                      title_id int primary key,
                      title_name varchar(50),
                      word_count int,
                      views int
);

INSERT INTO lab_ddl1 VALUES
                         (1,1,1, 814, 14),
                         (2,2,1, 986, 105),
                         (3,3, 1, 765, 22),
                         (4,4, 1,1002, 14),
                         (5,5, 2,1146, 221),
                         (6,6, 2, 814, 307),
                         (7,7, 3, 1571, 14);

INSERT INTO author VALUES (1, 'Maria Charlotte'),
                          (2, 'Juan Perez'),
                          (3, 'Gemma Alcocer');

INSERT INTO title VALUES (1, 'Best Paint Colors', 814, 14),
                         (2, 'Hot Accessories', 986, 105),
                         (3, 'Mixing Textures', 765, 22),
                         (4, 'Homemade Art Hacks', 1002, 14),
                         (5, 'Small Space Decorating Tips', 1146, 221),
                         (6, 'Kitchen Refresh', 814, 307),
                         (7, 'Refinishing Wood Floors', 1571, 14);

SELECT * from lab_ddl1;
SELECT * from author;
SELECT * from title;
#
# SELECT author_name from lab_ddl1;
#
# UPDATE lab_ddl1
    # SET author_name = 'Maria Charlotte'
      # WHERE title_id = 1;
# DROP TABLE lab_ddl1;
#
# DROP TABLE author;
#
# DROP TABLE title;


