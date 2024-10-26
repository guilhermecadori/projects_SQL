-- Ex 1
/*
    Given a string of digits, you should replace any digit below 5 with '0' and any 
    digit 5 and above with '1'. Return the resulting string.

    Note: input will never be an empty string

    Write your SQL statement here: you are given a table 'fakebin' with column 'x', 
    return a table with column 'x' and your result in a column named 'res'.
*/

SELECT
      x
    , TRANSLATE(x, '0123456789', '0000011111') AS res
FROM fakebin;

-- Ex 2
/*
    You are the owner of the Grocery Store. 
    All your products are in the database, that you have created after CodeWars SQL excercises!:)
    Today you are going to CompanyA warehouse
    You need to check what products are running out of stock, to know which you need buy in a 
    CompanyA warehouse.

    Use SELECT to show id, name, stock from products which are only 2 or less item in the stock and 
    are from CompanyA.
    Order the results by product id
    
    products table schema
        id
        name
        price
        stock
        producent

    results table schema
        id
        name
        stock
*/
SELECT
      id
    , name
    , stock
FROM products
WHERE stock <= 2 AND producent = 'CompanyA'
ORDER BY id ASC

