/* Четвертое задание */

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select distinct album.title 
from album
join album_artist on album.album_id = album_artist.album_id 
join artist on album_artist.artist_id = artist.artist_id 
join artist_genre on artist.artist_id = artist_genre.artist_id
group by album.album_id 
having count(distinct artist_genre.genre_id) > 1;

--Наименования треков, которые не входят в сборники
select track.title 
from track
left join compilation_track on track.track_id = compilation_track.track_id 
where compilation_track.compilation_id is null;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
select artist.name 
from artist
join album_artist on artist.artist_id = album_artist.artist_id 
join album on album_artist.album_id = album.album_id 
join track on album.album_id = track.album_id 
where track.duration = (
	select min(duration)
	from track
)
group by artist.name 

--Названия альбомов, содержащих наименьшее количество треков.
with AlbumTrackCount as (
	select album.album_id, count(track.track_id) as track_count
	from album
	left join track on album.album_id = track.album_id 
	group by album.album_id 
)
select album.title 
from album
join AlbumTrackCount on album.album_id = AlbumTrackCount.album_id
where AlbumTrackCount.track_count = (select min(track_count) from AlbumTrackCount)
