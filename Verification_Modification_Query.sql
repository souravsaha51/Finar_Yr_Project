-- DROP table marks;
DROP TABLE courses;
DROP TABLE departments;
DROP TABLE marks;
DROP TABLE semesterresults;
DROP TABLE semesters;
DROP TABLE students;

-- DROP table departments;

UPDATE departments
SET DepartmentName = 'Electronics and Instrumentation Engineering'
WHERE DepartmentID = 3;

UPDATE Students
SET  Address = 'Udaipur, Tripura'
WHERE StudentID = 1;


UPDATE Students
SET  Address = 'Bakura, Purulia, West Bengal'
WHERE StudentID = 2;


UPDATE Students
SET  Address = 'Agartala, Tripura'
WHERE StudentID = 3;


UPDATE Students
SET  Address = 'Delhi, India'
WHERE StudentID = 4;


UPDATE Students
SET  Address = 'Udaipur, Tripura'
WHERE StudentID = 1;






UPDATE Students
SET Email = 'chiranjitchakraborty@example.com' 
WHERE StudentID = 5;




