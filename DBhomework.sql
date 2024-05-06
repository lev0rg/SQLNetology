CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer (
	id SERIAL PRIMARY KEY,
	singer_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre_Singer (
	genre_id INTEGER REFERENCES Genre(id),
	singer_id INTEGER REFERENCES Singer(id),
	CONSTRAINT genre_singer_pk PRIMARY KEY(genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	album_name VARCHAR(60) NOT NULL,
	album_year_release INTEGER CHECK (album_year_release >= 1990)
);

CREATE TABLE IF NOT EXISTS Album_Singer (
	singer_id INTEGER REFERENCES Singer(id),
	album_id INTEGER REFERENCES Album(id),
	CONSTRAINT album_singer_pk PRIMARY KEY(singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	track_name VARCHAR(60) NOT NULL,
	track_duration INTEGER CHECK (track_duration between 1 and 7),
	album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	collection_name VARCHAR(60) NOT NULL,
	collection_year_release INTEGER CHECK (collection_year_release >= 1990)
);

CREATE TABLE IF NOT EXISTS Collection_Track (
	collection_id INTEGER REFERENCES Collection(id),
	track_id INTEGER REFERENCES Track(id),
	CONSTRAINT collection_track_pk PRIMARY KEY(collection_id, track_id)
);