-- Ex 1

/*
    For this challenge you need to create a simple SELECT statement that 
    will return all columns from the products table, and join to the companies 
    table so that you can return the company name.
    
    products table schema
        id
        name
        isbn
        company_id
        price

    companies table schema
        id
        name

    You should return all product fields as well as the company name as "company_name".
*/

SELECT
      p.id
    , p.name
    , p.isbn
    , p.company_id
    , p.price
    , c.name AS company_name
FROM products p
LEFT JOIN companies c
ON p.company_id = c.id;


-- Ex 2
/*
    For this challenge you need to create a basic Increment function 
    which Increments on the age field of the peoples table.

    The function should be called increment, it needs to take 1 integer 
    and increment that number by 1.

    You may query the people table while testing but the query must only 
    contain the function on your final submit.
    
    Important: you must remove all comments when submitting the kata.
    
    people table schema
        id
        name
        age
*/
CREATE FUNCTION increment(age INT)
RETURNS INT
LANGUAGE sql
AS $$
    SELECT age + 1;
$$;
