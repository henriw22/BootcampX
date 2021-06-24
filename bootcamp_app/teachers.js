const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort = process.argv[2] || 'JUL02';
pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohorts
  FROM assistance_requests
  JOIN students on assistance_requests.student_id = students.id
  JOIN teachers on assistance_requests.teacher_id = teachers.id
  JOIN cohorts on students.cohort_id = cohorts.id
  WHERE cohorts.name = $1
 ORDER BY teachers.name;
`, [cohort])
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohorts}: ${row.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));