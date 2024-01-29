create database if not exists netflix_analysis;
use netflix_analysis;
create table movies(
movie_id int primary key,
movie_name varchar(80) not null,
genre varchar(20),
director varchar(50),
release_year int,
duration_in_minutes int,
ratings float
);
select * from movies;

create table series(
series_id int primary key,
series_name varchar(80) not null,
genre varchar(20),
release_year int,
no_of_seasons int,
ratings float
);
create table user(
user_id int primary key,
name varchar(50),
email varchar(80),
signup_date date
);

create table history(
viewing_id int primary key,
user_id int,
movie_id int,
series_id int,
watch_date date,
foreign key (user_id) references user(user_id),
foreign key (movie_id) references movies(movie_id),
foreign key (series_id) references series(series_id)
on update cascade
on delete cascade
);

insert into movies
(movie_id, movie_name, director, release_year, ratings, duration_in_minutes, genre)
values
(1, 'The Shawshank Redemption', 'Frank Darabont', 1994, 9.3, 142, 'Drama'),
(2, 'The Godfather', 'Francis Ford Coppola', 1972, 9.2, 175, 'Crime'),
(3, 'The Dark Knight', 'Christopher Nolan', 2008, 9.0, 152, 'Action'),
(4, 'La La Land', 'Damien Chazelle', 2016, 8.0, 128, 'Romance'),
(5, 'Inception', 'Christopher Nolan', 2010, 8.8, 148, 'Sci-Fi'),
(6, 'The Matrix', 'Lana Wachowski', 1999, 8.7, 136, 'Action'),
(7, 'Bird Box', 'Susanne Bier', 2018, 6.6, 124, 'Drama'),
(8, 'The Irishman', 'Martin Scorsese', 2019, 7.9, 209, 'Crime'),
(9, 'Money Heist: The Return', NULL, 2021, NULL, 120, 'Crime'),
(10, 'Inception 2', 'Christopher Nolan', 2023, NULL, 160, 'Sci-Fi'),
(11, 'The Grand Budapest Hotel', 'Wes Anderson', 2014, 8.1, 99, 'Comedy'),
(12, 'Avengers: Endgame', 'Anthony and Joe Russo', 2019, 8.4, 181, 'Action'),
(13, 'Pulp Fiction', 'Quentin Tarantino', 1994, 8.9, 154, 'Crime'),
(14, 'Forrest Gump', 'Robert Zemeckis', 1994, 8.8, 142, 'Drama'),
(15, 'The Social Network', 'David Fincher', 2010, 7.7, 120, 'Biography'),
(16, 'The Departed', 'Martin Scorsese', 2006, 8.5, 151, 'Crime'),
(17, 'The Avengers', 'Joss Whedon', 2012, 8.0, 143, 'Action'),
(18, 'The Great Gatsby', 'Baz Luhrmann', 2013, 7.2, 143, 'Drama'),
(19, 'The Lion King', 'Roger Allers, Rob Minkoff', 1994, 8.5, 88, 'Animation'),
(20, 'Interstellar', 'Christopher Nolan', 2014, 8.6, 169, 'Sci-Fi');

insert into series
(series_id, series_name, release_year, ratings, no_of_seasons, genre)
values
(101, 'Stranger Things', 2016, 8.7, 4, 'Sci-Fi'),
(102, 'Breaking Bad', 2008, 9.5, 5, 'Drama'),
(103, 'Black Mirror', NULL, 8.8, 6, 'Sci-Fi'),
(104, 'Narcos', NULL, 8.8, 3, 'Crime'),
(105, 'The Witcher', 2019, 8.2, 2, 'Fantasy'),
(106, 'The Crown', 2016, 8.7, 5, 'Drama'),
(107, 'Stranger Things 2', 2017, 8.7, 3, 'Sci-Fi'),
(108, 'Money Heist', 2017, 8.3, 5, 'Crime'),
(109, 'Breaking Bad: The Sequel', 2022, NULL, 130, 'Crime'),
(110, 'Black Mirror: Special Edition', NULL, 8.5, 1, 'Sci-Fi'),
(111, 'The Mandalorian', 2019, 8.8, 3, 'Action'),
(112, 'Westworld', 2016, 8.6, 4, 'Sci-Fi'),
(113, 'Fleabag', 2016, 8.7, 2, 'Comedy'),
(114, 'The Simpsons', 1989, 8.7, 33, 'Animation'),
(115, 'Breaking Bad: The Final Season', NULL, 2013, NULL, 'Crime'),
(116, 'Breaking Bad: The Spinoff', NULL, 2023, NULL, 'Crime'),
(117, 'Friends', 1994, 8.5, 10, 'Comedy'),
(118, 'The Witcher: Blood Origin', NULL, 2022, NULL, 'Fantasy'),
(119, 'Sherlock', 2010, 9.1, 4, 'Crime'),
(120, 'Black Mirror: Future Visions', NULL, 2024, NULL, 'Sci-Fi');

insert into user
(user_id, name, email, signup_date)
values
(1001, 'NetflixFan1', 'fan1@example.com', '2022-01-01'),
(1002, 'MovieBuff2', 'buff2@example.com', '2022-02-15'),
(1003, 'Cinephile3', 'cine3@example.com', '2022-03-10'),
(1004, 'SeriousWatcher4', 'watcher4@example.com', '2022-04-20'),
(1005, 'FilmEnthusiast5', 'film5@example.com', '2022-05-12'),
(1006, 'ShowBinger6', 'binger6@example.com', '2022-06-03'),
(1007, 'FilmAficionado7', 'aficionado7@example.com', '2022-07-15'),
(1008, 'DramaLover8', 'drama8@example.com', '2022-08-01'),
(1009, 'ActionFanatic9', 'action9@example.com', '2022-08-20'),
(1010, 'MysteryWatcher10', 'mystery10@example.com', '2022-09-25'),
(1011, 'ComedyFan11', 'comedy11@example.com', '2022-10-10'),
(1012, 'SciFiExplorer12', 'scifi12@example.com', '2022-10-25');

insert into history
(viewing_id, user_id, movie_id, series_id, watch_date)
values
(2001, 1001, 1, NULL, '2022-02-01'),
(2002, 1002, NULL, 101, '2022-02-10'),
(2003, 1003, 3, NULL, '2022-03-05'),
(2004, 1001, NULL, 104, '2022-03-15'),
(2005, 1004, 2, NULL, '2022-05-05'),
(2006, 1005, NULL, 108, '2022-05-20'),
(2007, 1006, 5, NULL, '2022-06-10'),
(2008, 1004, NULL, 106, '2022-06-25'),
(2009, 1007, 4, NULL, '2022-07-25'),
(2010, 1008, NULL, 112, '2022-08-05'),
(2011, 1009, 3, NULL, '2022-08-25'),
(2012, 1007, NULL, 114, '2022-09-10'),
(2013, 1010, 12, NULL, '2022-10-05'),
(2014, 1011, NULL, 117, '2022-10-15'),
(2015, 1012, 13, NULL, '2022-11-05'),
(2016, 1010, NULL, 120, '2022-11-20');

select * from movies
where ratings > 9.0;

select user.name, movies.movie_name as watched_movie
from user
join history
on user.user_id = history.user_id
join movies
on movies.movie_id = history.movie_id;

select movie_name, duration_in_minutes
from movies
where ratings > 7.0
order by duration_in_minutes;

select series.series_name, COUNT(history.series_id) as WatchCount
from series
LEFT JOIN history ON series.series_id = history.series_id
GROUP BY series.series_id
ORDER BY WatchCount DESC;