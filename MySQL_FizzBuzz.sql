-- The code above is a SQL query that generates the FizzBuzz sequence up to 100. 
-- The query uses a recursive common table expression (CTE) to generate a sequence of numbers from 1 to 100. 
-- The CTE is named "numbers" and has two parts: the base case and the recursive case. 
-- The base case selects the number 1 and the recursive case selects the next number in the sequence by adding 1 to the previous number. 
-- The WHERE clause limits the sequence to numbers less than 100.
-- The SELECT statement uses a CASE expression to generate the FizzBuzz sequence. 
-- The CASE expression checks if the number is divisible by 3 and 5, 3 only, 5 only, or neither. If the number is divisible by both 3 and 5, the expression returns "FizzBuzz". If the number is divisible by 3 only, the expression returns "Fizz". If the number is divisible by 5 only, the expression returns "Buzz". If the number is not divisible by either 3 or 5, the expression returns the number as a string.
-- The result of the query is a table with two columns: "num" and "result". 
-- The "num" column contains the sequence of numbers from 1 to 100, and the "result" column contains the corresponding FizzBuzz values.
-- This SQL query is a concise and efficient way to generate the FizzBuzz sequence using a recursive CTE and a CASE expression. It is a good example of how SQL can be used to solve programming problems in a declarative and efficient way. However, it is worth noting that this query may not be the most performant solution for generating the FizzBuzz sequence in SQL, especially for larger sequences. There may be other approaches that are more optimized for performance, such as using a loop or a stored procedure.
-- MySQL FizzBuzz
WITH RECURSIVE numbers AS (
  SELECT 1 AS num
  UNION ALL
  SELECT num + 1
  FROM numbers
  WHERE num < 100
)
SELECT
  CASE
    WHEN num % 3 = 0 AND num % 5 = 0 THEN 'FizzBuzz'
    WHEN num % 3 = 0 THEN 'Fizz'
    WHEN num % 5 = 0 THEN 'Buzz'
    ELSE CAST(num AS CHAR)
  END AS result
FROM numbers;