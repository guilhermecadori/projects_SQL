-- Ex 1
/*
    You are a border guard sitting on the Canadian border. You were given a list of travelers who have arrived 
    at your gate today. You know that American, Mexican, and Canadian citizens don't need visas, so they can 
    just continue their trips. You don't need to check their passports for visas! You only need to check the 
    passports of citizens of all other countries!
    
    Select names, and countries of origin of all the travelers, excluding anyone from Canada, Mexico, or The US.

    travelers table schema
        name
        country

    NOTE: The United States is written as 'USA' in the table.
    NOTE: Your solution should use pure SQL. Ruby is used within the test cases just to validate your answer.
*/
SELECT name, country
FROM travelers
WHERE country NOT IN ('USA', 'Mexico', 'Canada');


-- Ex 2
/*
    You have access to a table of monsters as follows:
    
    monsters table schema
        id
        name
        legs
        arms
        characteristics

    Your task is to turn the numeric columns (arms, legs) into equivalent hexadecimal values.
    output table schema
        legs
        arms
*/
-- Used TO_HEX() since we are deling with PostgresSQL
SELECT 
    TO_HEX(arms) AS arms, 
    TO_HEX(legs) AS legs    
FROM monsters;


--Ex 3
/*
    Given the following table 'decimals':
    ** decimals table schema **
        id
        number1
        number2

    Return a table with two columns (number1, number2), the value in number1 
    should be rounded down and the value in number2 should be rounded up.
*/

SELECT FLOOR(number1) AS number1, CEIL(number2) AS number2
FROM decimals;


-- Ex 4
/*
    Description:

    This function should test if the factor is a factor of base.
    Return true if it is a factor or false if it is not.
    
    About factors
    Factors are numbers you can multiply together to get another number.

    2 and 3 are factors of 6 because: 2 * 3 = 6

        You can find a factor by dividing numbers. If the remainder is 0 then the number is a factor.
        You can use the mod operator (%) in most languages to check for a remainder

    For example 2 is not a factor of 7 because: 7 % 2 = 1

    Note: base is a non-negative number, factor is a positive number.

    you will be given a table 'kata' with columns 'id', 'base', and 'factor'. 
    return the 'id' and your result in a column named 'res'.
    
    SELECT * FROM kata

*/

SELECT
      id 
    , CASE
        WHEN base % factor = 0 THEN true
        ELSE false
      END AS res
FROM kata;