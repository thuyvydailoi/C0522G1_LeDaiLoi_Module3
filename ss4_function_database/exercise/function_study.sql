use quan_ly_sinh_vien;

select *, max(credit)
from `subject`;

select sj.sub_name, m.mark, max(m.mark)
from `subject` sj
join mark m on sj.sub_id = m.sub_id;

select *, avg(m.mark)
from student s
join mark m on s.student_id = m.student_id
group by s.student_id
order by m.mark desc;