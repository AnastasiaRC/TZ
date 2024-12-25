-- SQL-команды
SELECT test_id,
  MAX(CASE WHEN test_name='A' THEN val END) AS "A",
  MAX(CASE WHEN test_name='B' THEN val END) AS "B",
  MAX(CASE WHEN test_name='C' THEN val END) AS "C"
FROM test
GROUP BY test_id
ORDER BY test_id;