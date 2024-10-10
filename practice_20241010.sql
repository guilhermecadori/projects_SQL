-- Ex 1
-- Write a function which converts the input string to uppercase.
/*
    Write your SQL statement here: you are given a table 'makeuppercase' 
    with column 's', return a table with column 's' and your result in a 
    column named 'res'.
*/
SELECT
      s
    , UPPER(s) AS res
FROM makeuppercase


-- Ex 2
/*
    For this challenge you need to create a simple SELECT statement that 
    will return all columns from the people table, and join to the toys 
    table so that you can return the COUNT of the toys.
    
    people table schema
        id
        name

    toys table schema
        id
        name
        people_id

    You should return all people fields as well as the toy count as "toy_count".

        NOTE: Your solution should use pure SQL. Ruby is used within the test 
              cases to do the actual testing.
*/

SELECT 
      p.id
    , p.name
    , CASE
        WHEN COUNT(t.id) IS NULL THEN 0
        ELSE COUNT(t.id) 
      END AS toy_count
FROM people p
LEFT JOIN toys t
ON p.id = t.people_id
GROUP BY p.id
