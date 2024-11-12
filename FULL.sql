DROP TABLE IF EXISTS Artist_Genre;
DROP TABLE IF EXISTS Album_Artist;
DROP TABLE IF EXISTS Compilation_Track;
DROP TABLE IF EXISTS Compilation;
DROP TABLE IF EXISTS Track;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Artist;

CREATE TABLE Genre (
    genre_id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Artist (
    artist_id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Artist_Genre (
    artist_id int REFERENCES Artist(artist_id),
    genre_id int REFERENCES Genre(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE Album (
    album_id serial PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year smallint NOT null CHECK (release_year >= 2000 AND release_year <= EXTRACT(YEAR FROM CURRENT_DATE))
);

CREATE TABLE Album_Artist (
    album_id int REFERENCES Album(album_id),
    artist_id int REFERENCES Artist(artist_id),
    PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE Track (
    track_id serial PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration smallint NOT NULL,
    album_id int REFERENCES Album(album_id)
);

CREATE TABLE Compilation (
    compilation_id serial PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year smallint NOT null CHECK (release_year >= 2000 AND release_year <= EXTRACT(YEAR FROM CURRENT_DATE))
);

CREATE TABLE Compilation_Track (
    compilation_id int REFERENCES Compilation(compilation_id),
    track_id int REFERENCES Track(track_id),
    PRIMARY KEY (compilation_id, track_id)
);




/* Первое задание */

/* Заполнение таблицы Genre */
INSERT INTO Genre (name) VALUES
('Rock'),
('Pop'),
('Jazz'),
('Hip-Hop');

/* Заполнение таблицы Artist */
INSERT INTO Artist (name) VALUES
('Artist One'),
('Artist Two'),
('Artist Three'),
('Solo'),
('Artist Five'),
('Artist Six'),
('Artist Seven'),
('Artist Eight'),
('Artist Nine'),
('Artist Ten'),
('Artist Eleven'),
('Artist Twelve');

/* Заполнение таблицы Album */
INSERT INTO Album (title, release_year) VALUES
('First Album', 2020),
('Second Album', 2021),
('Third Album', 2022),
('Fourth Album', 2023);

/* Заполнение таблицы Track */
INSERT INTO Track (title, duration, album_id) VALUES
('Track One', 210, 1),
('Track Two', 180, 1),
('Track Three', 240, 2),
('Track Four', 200, 2),
('My Special track', 220, 3),
('Track Five', 195, 4);

/* Заполнение таблицы Compilation */
INSERT INTO Compilation (title, release_year) VALUES
('Best of 2020', 2020),
('Hits of 2021', 2021),
('Top Tracks 2022', 2022),
('Greatest Hits 2023', 2023);

/* Заполнение таблицы Artist_Genre */
INSERT INTO Artist_Genre (artist_id, genre_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(4, 4),
(5, 3),
(6, 1),
(7, 2),
(8, 4),
(9, 3),
(10, 1),
(11, 2),
(12, 4);

/* Заполнение таблицы Album_Artist */
INSERT INTO Album_Artist (album_id, artist_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8);

/* Заполнение таблицы Compilation_Track */
INSERT INTO Compilation_Track (compilation_id, track_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 6);

/* Второе задание */

select title, duration
FROM track
order by duration desc 
limit 1;

select title, duration 
from track
where duration > 210; -- Указанно в секундах (3.5 мин)

select title, release_year 
from compilation 
where release_year between 2018 and 2020;

select name
from artist
where name not like '% %';

select title
from Track
where title ~* '\mmy\M'or title ~* '\мой\M';

/* Третье задание */

--Количество исполнителей в каждом жанре.
select genre_id, count(artist_id)
FROM artist_genre
group by genre_id 
order by count(artist_id) desc;
 --
select name, count(artist_id)
from genre
join artist_genre on genre.genre_id = artist_genre.genre_id
group by name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
select count(track_id) 
from track
join album on track.album_id = album.album_id
where release_year between 2019 and 2020;

--Средняя продолжительность треков по каждому альбому.
select album.title, avg(duration) 
from track
join album on track.album_id = album.album_id
group by album.title;

--Все исполнители, которые не выпустили альбомы в 2020 году.
select name
from artist
left join album_artist on artist.artist_id = album_artist.artist_id 
left join album on album_artist.album_id = album.album_id and album.release_year = 2020
where album.album_id is null;

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select distinct compilation.title
from compilation
join compilation_track on compilation.compilation_id = compilation_track.compilation_id 
join track on compilation_track.track_id = track.track_id 
join album on track.album_id = album.album_id 
join album_artist on album.album_id = album_artist.album_id 
join artist on album_artist.artist_id = artist.artist_id 
where artist.name = 'Solo';

