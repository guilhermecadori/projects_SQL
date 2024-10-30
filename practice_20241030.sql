-- Ex 1
/*
    Given a table of random numbers as follows:
    ** numbers table schema **
        id
        number1
        number2
        number3
        number4
        number5

    Your job is to return a table in the following format, where each value 
    is the number of bytes in the string representation of the number.
    ** output table schema **
        octnum1
        octnum2
        octnum3
        octnum4
        octnum5
*/

SELECT
      OCTET_LENGTH(CAST(number1 AS TEXT)) AS octnum1
    , OCTET_LENGTH(CAST(number2 AS TEXT)) AS octnum2
    , OCTET_LENGTH(CAST(number3 AS TEXT)) AS octnum3
    , OCTET_LENGTH(CAST(number4 AS TEXT)) AS octnum4
    , OCTET_LENGTH(CAST(number5 AS TEXT)) AS octnum5
FROM numbers


-- Ex 2
/*
    You are the owner of the Grocery Store. All your products are in the database, 
    that you have created after CodeWars SQL excercises!
    You have reached a conclusion that you waste too much time because you have too 
    many different warehouse to visit each week.
    You have to find out how many different type of products you buy from each producer. 
    If you take only a few items from some of them you will stop going there to save gasoline.
    
    In the results show producer and count_products_types which you buy from him.

    Order the result by count_products_types (DESC) then by producer (ASC) in case there are duplicate amounts,

    products table schema
        id
        name
        price
        stock
        producer

    results table schema
        count_products_types
        producer
*/
SELECT
      producer
    , COUNT(id) AS count_products_types
FROM products
GROUP BY producer
ORDER BY 
      count_products_types DESC
    , producer ASC


-- Ex 3
/*
    Deoxyribonucleic acid (DNA) is a chemical found in the nucleus of cells 
    and carries the "instructions" for the development and functioning of living organisms.

    In DNA strings, symbols "A" and "T" are complements of each other, as "C" and "G". 
    Your function receives one side of the DNA (string, except for Haskell); you need to 
    return the other complementary side. 
    DNA strand is never empty or there is no DNA at all (again, except for Haskell).

    Example: (input --> output)
        "ATTGC" --> "TAACG"
        "GTAT" --> "CATA"
    
    You are given a table 'dnastrand' with column 'dna'.
    Return a table with column 'dna' and your result in a column named 'res'.

*/

SELECT
      dna
    , TRANSLATE(dna, 'ATTACGGC', 'TAATGCCG') AS res -- TRANSLATE(): Cool and pretty useful little function 
FROM dnastrand
