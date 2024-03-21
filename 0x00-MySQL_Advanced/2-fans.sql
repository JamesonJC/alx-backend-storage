-- SQL script to rank country origins of bands
-- Ordered by the number of (non-unique) fans
-- Columns: origin, nb_fans

SELECT origin, SUM(fans) AS nb_fans 
FROM metal_bands
GROUP BY origin 
ORDER BY nb_fans DESC;
