-- Ex 1
/*
    Write an SQL query to retrieve the top 5 customers who have rented the most movies, 
    excluding customers who have rented at least one movie with an 'NC-17' rating. 
    Subqueries are forbidden to make the task a bit curiouser - you can use select only once
    Notes:
        If two or more customers have the same amount of rentals then sort by last name alphabetically.
    
    customer table:

    Column       | Type     | Modifiers
    ------------ +----------+----------
    customer_id  | integer  | not null
    first_name   | varchar  | not null
    last_name    | varchar  | not null
    email        | varchar  | not null

    inventory table:

    Column       | Type      | Modifiers
    ------------ +-----------+----------
    inventory_id | integer   | not null
    film_id      | smallint  | not null
    store_id     | smallint  | not null

    film table:

    Column           | Type     | Modifiers
    -----------------+----------+----------
    film_id          | integer  | not null
    title            | varchar  | not null
    description      | text     | not null
    rating           | varchar  | not null

    rental table:

    Column       | Type      | Modifiers
    -------------+-----------+----------
    rental_id    | integer   | not null
    customer_id  | integer   | not null
    inventory_id | integer   | not null
    rental_date  | timestamp | not null
    return_date  | timestamp | 

    Desired Outpt
    customer_id  | full_name     | total_rentals |
    -------------+---------------+---------------+
    32           | Jami Hayes    | 22            |
    14           | Hosea Jacobi  | 19            |
    ...
*/

SELECT
      c.customer_id
    , CONCAT(c.first_name, ' ', c.last_name) AS full_name
      -- Nice! "COUNT CASE WHEN __ IS DISTINCT FROM __ THEN __ END"
    , COUNT(CASE WHEN f.rating IS DISTINCT FROM 'NC-17' THEN r.rental_id END) AS total_rentals
FROM customer c
LEFT JOIN rental r ON  c.customer_id = r.customer_id
LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN film f ON i.film_id = f.film_id
GROUP BY c.customer_id
HAVING COUNT(CASE WHEN f.rating = 'NC-17' THEN 1 END) = 0 -- Nice!
ORDER BY total_rentals DESC, c.last_name
LIMIT 5;
