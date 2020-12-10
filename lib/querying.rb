def select_books_titles_and_years_in_first_series_order_by_year
  <<-SQL
    SELECT title, year
    FROM Books
    WHERE series_id = 1
    ORDER BY year;
  SQL
end

def select_name_and_motto_of_char_with_longest_motto
  <<-SQL
    SELECT name, motto
    FROM Characters
    ORDER BY length(motto) DESC
    LIMIT 1;
  SQL
end


def select_value_and_count_of_most_prolific_species
  <<-SQL
    SELECT species, count(*)
    FROM Characters
    GROUP BY species
    ORDER BY count(*) DESC
    LIMIT 1;
  SQL
end

def select_name_and_series_subgenres_of_authors
  <<-SQL
    SELECT Authors.name AS author_name, Subgenres.name AS subgenre_name FROM Series
    INNER JOIN Authors
    ON Series.author_id = Authors.id
    INNER JOIN Subgenres
    ON Series.subgenre_id = Subgenres.id;
  SQL
end

def select_series_title_with_most_human_characters
  <<-SQL
    SELECT Series.title
    FROM Series
    INNER JOIN character_books, books, characters
    ON Series.id = Books.series_id
    WHERE Books.id = character_books.book_id
    GROUP BY Characters.species HAVING Characters.species = 'human'
    LIMIT 1;
  SQL
end

def select_character_names_and_number_of_books_they_are_in
  <<-SQL
    SELECT Characters.name, COUNT(character_books.book_id)
    FROM Characters
    INNER JOIN character_books
    ON Characters.id = character_books.Character_id
    GROUP BY Characters.name
    ORDER BY COUNT(character_books.book_id) DESC, Characters.name ASC;
  SQL
end
