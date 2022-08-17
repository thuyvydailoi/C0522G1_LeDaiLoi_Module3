
SELECT *
FROM student;

SELECT *
FROM student
WHERE `status` = true;

SELECT *
FROM `subject`
WHERE credit < 10;

SELECT s.student_id, s.student_name, c.class_name
FROM student s join class c on s.class_id = c.class_id
WHERE c.class_name = 'A1';

SELECT s.student_id, s.student_name, sub.sub_name, m.mark
FROM student s join mark m on s.student_id = m.student_id join `subject` sub on m.Sub_id = sub.sub_id
WHERE sub.sub_name = 'CF';