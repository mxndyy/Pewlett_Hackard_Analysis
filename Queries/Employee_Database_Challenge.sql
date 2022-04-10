--Del. 1
--The Number of Retiring Employees by Title.
SELECT e.emp_no,
	e.first_name, 
	e.last_name, 
	ti.titles, 
	ti.from_date, 
	ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- The Number of Retiring Employees by Title (No Duplicates).
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.titles
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- The number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.titles), ut.titles
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.titles
ORDER BY count DESC;

--Del. 2 
--Employees Eligible for the Mentorship Program.
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	t.titles
INTO mentorship_eligibilty
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles as t
		ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC, de.from_date DESC;