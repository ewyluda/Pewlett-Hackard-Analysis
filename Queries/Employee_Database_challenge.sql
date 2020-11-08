-- Deliverable 1 
-- Steps 1 thru 7
SELECT e.emp_no,
 	   e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Provided Starter Code
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;
-- Show created table (unique_titles)
SELECT * FROM unique_titles;

-- Last Part of Deliverable 1...
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;
-- END DELIVERABLE 1
-- ---------------------------------------------------------------------------------------------
-- START DELIVERABLE 2

SELECT DISTINCT ON (e.emp_no) e.emp_no,
 	   e.first_name,
	   e.last_name,
       e.birth_date,
       de.from_date,
       de.to_date,
       t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;