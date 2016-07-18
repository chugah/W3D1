Exercise 1:  Fetch ISBN of all book editions published by the publisher "Random House". 
You should have 3 results.

SELECT editions.isbn
FROM editions 
WHERE publishers.name = 'Random House'

Exercise 2: Instead of just their ISBN number, fetch their Book Title as well. 
You should still have the same 3 results but with more information. 
But instead of just one column, we should have 2 columns in the result set.

SELECT editions.isbn, books.title
FROM editions
JOIN books ON books.id = editions.book_id
JOIN publishers ON editions.publisher_id = publishers.id
WHERE publishers.name = 'Random House';

Exercise 3:  Also include their stock information (available stock and retail price 
for each book edition). You should still have the same 3 results but with more 
information. But instead of just 2 columns, we should have 4 columns in the result 
set.

SELECT editions.isbn, books.title, stock.retail, stock.stock
FROM editions
JOIN books ON books.id = editions.book_id
JOIN publishers ON editions.publisher_id = publishers.id
JOIN stock ON editions.isbn = stock.isbn
WHERE publishers.name = 'Random House';

Exercise 4:  Note how one of the of books has 0 stock. Modify the query to only 
return books that are in stock.

SELECT editions.isbn, books.title, stock.retail, stock.stock
FROM editions
JOIN books ON book.id = editions.book_id
JOIN publishers ON editions.publisher_id = publishers.id
JOIN stock ON editions.isbn = stock.isbn
WHERE publishers.name = 'Random House' and stock.stock > 0;

Exercise 5: Hardcover vs Paperback
Editions has a column called "type". Include the print type but instead of just 
displaying "h" or "p" (the values in the column) output the human readable types 
("hardcover" and "paperback" accordingly).  Hint: Use a CASE statement to manipulate 
your result set, as in this example.

SELECT type
  CASE WHEN editions.type = 'h' THEN 'hardcover'
       WHEN editions.type = 'p' THEN 'paperback'
  END
  FROM editions;

Exercise 6: List all book titles along with their publication dates (column on the 
editions dates) That's 2 columns: "title" and "publication".

Important Notes:

Certain books (such as "Learning Python") don't have any editions but we still want 
to see those books in the results. They just shouldn't have a publication date 
associated with them.

Certain other books (such as "Dune") have multiple editions and they will be 
repeated multiple times in the result set.

SELECT books.title, editions.publication
FROM editions
FULL OUTER JOIN books ON books.id = editions.book_id;

Exercise 7: What's the total inventory of books in this library (i.e. how many 
total copies are in stock)?

SELECT sum(stock)
FROM stock;

Exercise 8: What is the overall average cost and retail price for all books 
for sale? Return three columns "Average cost", "Average Retail" and "Average Profit"

SELECT avg(cost) AS "Average Cost"
       avg(retail) AS "Average Retail"
       avg(retail - cost) AS "Average Profit"
FROM stock;

Exercise 9
Which book ID has the most pieces in stock?

Hints:

Use an aggregate function combined with LIMIT and ORDER BY clauses.
No need to join with the books table since we just want the ID which is already 
in the editions table.


SELECT stock.isbn
FROM STOCK
JOIN editions ON stock.isbn = editions.isbn
ORDER BY stock.stock DESC
Limit 1;
