SELECT module.module_id, building_capacity.room, building_capacity.building
FROM module
JOIN building_capacity ON module.room = building_capacity.room
JOIN enrolled ON module.module_id = enrolled.module_id
GROUP BY module.module_id, building_capacity.building, building_capacity.room 
HAVING COUNT(enrolled.student_id) > building_capacity.capacity;