SELECT building, SUM(capacity) AS total_capacity
FROM building_capacity
GROUP BY building;
