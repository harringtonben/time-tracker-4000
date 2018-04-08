/**************************************
TT4K reporting queries and view queries
**************************************/


--Select all shifts within x weeks for a supporter
select s.*, e.name from Shifts s
join Employees e on e.employeeid = s.employeeid
where s.EmployeeId = 2
and date > getdate() - 28

--Select all shifts within x weeks where a supporter worked from home
select s.*, e.name from Shifts s
join Employees e on e.employeeid = s.employeeid
where s.EmployeeId = 2
and date > getdate() - 28
and WorkFromHome = 1

--Select all shifts within x weeks where a supporter had called out and it was unplanned
select s.*, e.name from Shifts s
join Employees e on e.employeeid = s.employeeid
where s.EmployeeId = 12
and date > getdate() - 28
and Callout = 1
and Planned = 0

--Select all shifts within x weeks where someone called out, regardless of the supporter
select s.*, e.name from Shifts s
join Employees e on e.employeeid = s.employeeid
where date > getdate() - 28
and Callout = 1
and Planned = 0

--Select all shifts for supporters who roll up to Grey within x amount of weeks
select s.*, e.name from Shifts s
join Employees e on e.employeeid = s.employeeid
where s.MangerId = 2
and date > getdate() - 28

--Select all shifts for supporters who roll up to Katie within x amount of weeks
select s.*, e.name from Shifts s
join Employees e on e.employeeid = s.employeeid
where s.MangerId = 1
and date > getdate() - 28

--Select percentage of unplanned days vs. planned days for a supporter within x amount of weeks

--Select all Email days for a certain supporter

--Select all phone days for a certain supporter

--Report total phone and email days for a supporter