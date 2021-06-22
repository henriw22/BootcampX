SELECT COUNT(assistance_requests.*) as total_assistance, teachers.name
  FROM assistance_requests JOIN teachers on assistance_requests.teacher_id = teachers.id
 GROUP BY teachers.name
HAVING teachers.name = 'Waylon Boehm';



SELECT COUNT(assistance_requests.*) as total_assistance, students.name
  FROM assistance_requests JOIN students on assistance_requests.student_id = students.id
 WHERE students.name = 'Elliot Dickinson'
 GROUP BY students.name;



 SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at - started_at) as duration
   FROM assistance_requests 
   JOIN students on assistance_requests.student_id = students.id
   JOIN teachers on assistance_requests.teacher_id = teachers.id
   JOIN assignments on assistance_requests.assignment_id = assignments.id
  ORDER BY duration;



SELECT AVG(completed_at - started_at) as average_assistance_request_duration
  FROM assistance_requests;



SELECT cohorts.name, AVG(completed_at - started_at) as average_assistance_time
  FROM assistance_requests
  JOIN students on assistance_requests.student_id = students.id
  JOIN cohorts on students.cohort_id = cohorts.id
 GROUP BY cohorts.name
 ORDER BY average_assistance_time;



 SELECT cohorts.name, AVG(completed_at - started_at) as average_assistance_time
  FROM assistance_requests
  JOIN students on assistance_requests.student_id = students.id
  JOIN cohorts on students.cohort_id = cohorts.id
 GROUP BY cohorts.name
 ORDER BY average_assistance_time DESC
 LIMIT 1;



SELECT AVG(started_at - created_at) as average_wait_time
  FROM assistance_requests;



SELECT cohorts.name, SUM(completed_at - started_at) as total_duration
  FROM assistance_requests
  JOIN students on assistance_requests.student_id = students.id
  JOIN cohorts on students.cohort_id = cohorts.id
 GROUP BY cohorts.name
 ORDER BY total_duration;



SELECT AVG(total_duration) as average_total_duration
  FROM (SELECT cohorts.name, SUM(completed_at - started_at) as total_duration
FROM assistance_requests
JOIN students on assistance_requests.student_id = students.id
JOIN cohorts on students.cohort_id = cohorts.id
GROUP BY cohorts.name) as total_duration_table;



SELECT assignments.id, assignments.name, assignments.day, assignments.chapter, COUNT (assistance_requests.*) as total_requests
  FROM assistance_requests
  JOIN assignments on assistance_requests.assignment_id = assignments.id
 GROUP BY assignments.id
 ORDER BY total_requests DESC;



SELECT day, COUNT(assignments.*) as number_of_assignments, SUM(duration)
  FROM assignments
 GROUP BY day
 ORDER BY day;



SELECT DISTINCT teachers.name as teacher, cohorts.name as cohorts
  FROM assistance_requests
  JOIN students on assistance_requests.student_id = students.id
  JOIN teachers on assistance_requests.teacher_id = teachers.id
  JOIN cohorts on students.cohort_id = cohorts.id
 WHERE cohorts.name = 'JUL02'
 ORDER BY teachers.name;



SELECT teachers.name as teacher, cohorts.name as cohorts, COUNT(assistance_requests.*) as total_assistances
  FROM assistance_requests
  JOIN students on assistance_requests.student_id = students.id
  JOIN teachers on assistance_requests.teacher_id = teachers.id
  JOIN cohorts on students.cohort_id = cohorts.id
 WHERE cohorts.name = 'JUL02'
 GROUP BY teacher, cohorts.name
 ORDER BY teacher;