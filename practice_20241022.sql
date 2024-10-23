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
