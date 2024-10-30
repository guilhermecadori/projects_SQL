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
