-- Ex 1
SELECT
    UNNEST(genres) as genre
  , COUNT(title) AS count
  , ARRAY_AGG(title ORDER BY title ASC) as books
FROM books
GROUP BY genre
ORDER BY count DESC, genre ASC