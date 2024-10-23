-- Ex 1
-- You are given a table 'solution' with column 'str',
-- Return a table with column 'str' and your result in a column named 'res'

/*
    Complete the solution so that it reverses the string passed into it.

    Example:
        'world'  =>  'dlrow'
        'word'   =>  'drow'
*/

SELECT
      str
    , REVERSE(str) AS res
FROM solution;


-- Ex 2
/*
    Write a query that returns all rows in the custid, custname, and custstate columns from the customers table.
    Table Description for customers:
        Column 	    Data Type 	Size 	Sample
        custid 	    integer 	8 	    4
        custname 	string  	50 	    Anakin Skywalker
        custstate 	string 	    50 	    Tatooine
        custard 	string 	    50 	    R2-D2
*/
SELECT custid, custname, custstate
FROM customers;