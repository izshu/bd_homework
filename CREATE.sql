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
