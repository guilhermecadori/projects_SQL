-- Ex 1
/*
    For this challenge you need to create a simple query to display each unique clan with their 
    total points and ranked by their total points.
    
    people table schema
        name
        points
        clan

    You should then return a table that resembles below
    
    select on
        rank
        clan
        total_points
        total_people

    The query must rank each clan by their total_points, you must return each unqiue clan and 
    if there is no clan name (i.e. it's an empty string) you must replace it with [no clan specified], 
    you must sum the total_points for each clan and the total_people within that clan.

*/

SELECT 
      ROW_NUMBER() OVER (ORDER BY total_points DESC) AS rank,
      clan,
      total_points,
      total_people
FROM (
    SELECT 
          CASE 
              WHEN clan IS NULL OR clan = '' THEN '[no clan specified]'
              ELSE clan
          END AS clan,
          SUM(points) AS total_points,
          COUNT(name) AS total_people
    FROM people
    GROUP BY CASE 
                WHEN clan IS NULL OR clan = '' THEN '[no clan specified]'
                ELSE clan
             END
) AS ranked_clans
ORDER BY total_points DESC;
