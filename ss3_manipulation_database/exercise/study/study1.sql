use quan_ly_sinh_vien;

select *
from student
where student_name like 'H%';

select *
from class
where month(start_date) = 12;

select *
from `subject`
where credit between 3 and 5;

SET SQL_SAFE_UPDATES = 0;
update student
set class_id = '2'
where student_name = 'Hung';
select * from student;

select student.student_name, `subject`.sub_name, mark.mark
from student
left join  `subject` on student.`status` = `subject`.`status`
left join mark on student.student_id = mark.student_id
order by mark desc, student_name; 