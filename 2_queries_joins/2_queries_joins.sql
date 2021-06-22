SELECT SUM(duration) as total_duration
  FROM students JOIN assignment_submissions ON students.id = student_id
 WHERE students.name = 'Ibrahim Schimmel';



 SELECT SUM(duration) as total_duration
  FROM assignment_submissions JOIN students ON students.id = student_id
  JOIN cohorts on students.cohort_id = cohorts.id
 WHERE cohorts.name = 'FEB12';