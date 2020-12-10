/* All tables must have a PRIMARY KEY on the id
The Series table should have a title and belong to an author and a sub-genre
The Sub-Genres table has a name
The Authors table has a name
The Books table has a title and year and belong to a series
The Characters table has a name, motto and species and belongs to an author
The Books table has many characters and characters are in many books in a series. How do we accomplish this complex association? With a join table between Characters and Books. This join table (let's call it character_books) will just have -in addition to its primary key- two foreign key columns for the character and book ids. Each row in this join table acts as a relation between a book and a character. */

CREATE TABLE Series (
    id INTEGER PRIMARY KEY,
    title TEXT,
    author_id INTEGER,
    subgenre_id INTEGER
);

CREATE TABLE SubGenres (
    id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE Authors (
    id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE Books (
    id INTEGER PRIMARY KEY,
    title TEXT,
    year INTEGER,
    series_id
);

CREATE TABLE Characters(
    id INTEGER PRIMARY KEY,
    name TEXT,
    motto TEXT,
    species TEXT,
    author_id
);

CREATE TABLE Character_Books(
    id INTEGER PRIMARY KEY,
    character_id,
    book_id
);