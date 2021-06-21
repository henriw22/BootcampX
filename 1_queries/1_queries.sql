SELECT id, name
  FROM students
 WHERE cohort_id = 1
 ORDER BY name;



 SELECT COUNT(id)
   FROM students
  WHERE cohort_id < 4;



SELECT name, id, cohort_id
  FROM students
 WHERE email IS NULL OR phone IS NULL;



SELECT name, email, id, cohort_id
  FROM students
 WHERE email <> '%@gmail.com' AND phone IS NULL;



SELECT name, id, cohort_id
  FROM students
 WHERE end_date IS NULL
 ORDER BY cohort_id;



SELECT name, email, phone
  FROM students
 WHERE github IS NULL AND end_date IS NOT NULL;