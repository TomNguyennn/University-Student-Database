SELECT module.module_id, module.module_leader, building_room.faculty, AVG(student_exammark.exam_mark) as average
FROM module
JOIN building_room ON module.building = building_room.building AND module.room = building_room.room
JOIN student_exammark ON module.module_id = student_exammark.module_id
GROUP BY module.module_id, module.module_leader, building_room.faculty
HAVING AVG(student_exammark.exam_mark) = (
    SELECT MAX(average_mark)
    FROM (
        SELECT module.module_id, AVG(student_exammark.exam_mark) AS average_mark
        FROM module 
        JOIN student_exammark ON module.module_id = student_exammark.module_id
        WHERE module.building = building_room.building AND module.room = building_room.room
        GROUP BY module.module_id
    )
);


