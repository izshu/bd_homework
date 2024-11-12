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