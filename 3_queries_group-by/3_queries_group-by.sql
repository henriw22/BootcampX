SELECT day, COUNT(*) AS total_assignments
  FROM assignments
 GROUP BY day
HAVING COUNT(*) >= 10
 ORDER BY day;



SELECT cohorts.name as cohort_name, COUNT(students.*) as student_count
  FROM cohorts JOIN students ON cohorts.id = students.cohort_id
 GROUP BY cohorts.name
HAVING COUNT(students.*) >= 18
 ORDER BY COUNT(students.*);



SELECT cohorts.name as cohort_name, COUNT(assignment_submissions.*) as total_submissions
  FROM cohorts 
  JOIN students ON cohorts.id = students.cohort_id
  JOIN assignment_submissions ON assignment_submissions.student_id = students.id
 GROUP BY cohorts.name
 ORDER BY total_submissions DESC;



SELECT students.name as student, SUM(assignment_submissions.duration)/COUNT(assignment_submissions.*) as average_assignment_duration
  FROM assignment_submissions
  JOIN students ON assignment_submissions.student_id = students.id
 WHERE students.end_date IS NULL
 GROUP BY students.name
 ORDER BY average_assignment_duration DESC;



 SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration, AVG(assignments.duration) as average_estimated_duration
   FROM students
   JOIN assignment_submissions ON assignment_submissions.student_id = students.id
   JOIN assignments ON assignment_submissions.assignment_id = assignments.id
  WHERE students.end_date IS NULL
  GROUP BY student
 HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
  ORDER BY average_assignment_duration;