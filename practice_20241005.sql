-- Ex 1
/*
    Write a function that returns the total surface area and volume of a box as an array: [area, volume] (GC: in SQL?)

    you are given a table 'box' with columns: width (int), height (int), depth (int)
    return a query with columns: width, height, depth, area (int), volume (int)
    sort results by area ascending, then volume ascending, then width ascending, then height ascending
*/
SELECT
       width
    ,  height
    ,  depth
    , ((width * height) + (width * depth) + (height * depth)) * 2 AS area
    , (width * height * depth) as volume
FROM box
ORDER BY
      area ASC
    , volume ASC
    , width ASC
    , height ASC;


-- Ex 2
/*
    Given a demographics table in the following format:
    demographics table schema

        id
        name
        birthday
        race

    return a single column named calculation where the value is the bit length of name, 
    added to the number of characters in race.

*/
-- GC: Using two new functions that I've never used before - BIT_LENGTH() and CHAR_LENGTH()
SELECT
    ( (BIT_LENGTH(name)) + (CHAR_LENGTH(race)) ) AS calculation
FROM demographics;

-- Ex 3
/*
    Write a function that takes a positive integer n, 
    sums all the cubed values from 1 to n (inclusive), and returns that sum.
    Assume that the input n will always be a positive integer.

    Examples: (Input --> output)
        2 --> 9 (sum of the cubes of 1 and 2 is 1 + 8)
        3 --> 36 (sum of the cubes of 1, 2, and 3 is 1 + 8 + 27)

    Wou are given a table 'cubes' with column 'n' (bigint)
    Return a query with column 'n' and your result in a column named 'res' (bigint)
    Sort results by column 'n' ascending
*/
-- GC: This requiered a lot of googling and "GPTying"
SELECT
    n,
    CAST(SUM(res^3) AS BIGINT) AS res
FROM (
    SELECT DISTINCT n
    FROM cubes
) AS distinct_cubes
JOIN LATERAL GENERATE_SERIES(1, distinct_cubes.n) AS res ON TRUE
GROUP BY distinct_cubes.n
ORDER BY distinct_cubes.n ASC;


