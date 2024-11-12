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