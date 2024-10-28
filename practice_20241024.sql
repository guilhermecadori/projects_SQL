-- Ex 1
SELECT
    UNNEST(genres) AS genre -- Cool new function
  , COUNT(title) AS count
  , ARRAY_AGG(title ORDER BY title ASC) AS books -- Cool new function
FROM books
GROUP BY genre
ORDER BY count DESC, genre ASC