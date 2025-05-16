CREATE VIEW Marks_Statement AS
SELECT 
    sr.SemesterID AS Semester,
    10 AS "Total Grade Point",  -- Total grade point constant
    sr.SGPA AS "SPI/SGPA Obtained",
    sr.CGPA AS "CPI/CGPA Obtained"  -- Fixed column name (GGPA → CGPA)
FROM 
    SemesterResults sr
JOIN 
    Students s ON sr.StudentID = s.StudentID  -- Removed semicolon here
WHERE
    s.EnrollmentNo = '21UCH005';  -- Fixed semicolon → single quote