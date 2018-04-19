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
where s.ManagerId = 2
and date > getdate() - 28

--Select all shifts for supporters who roll up to Katie within x amount of weeks
select s.*, e.name from Shifts s
join Employees e on e.employeeid = s.employeeid
where s.ManagerId = 1
and date > getdate() - 28

--Select percentage of unplanned days vs. planned days for a supporter within x amount of weeks
with callout_cte (sickdays, employeeid) as
(
select count(*) as sickdays, EmployeeId from shifts
where EmployeeId = 12
and date > getdate() - 33
and Callout = 1
and Planned = 0
group by EmployeeId
),
allshift_cte (allworkdays, employeeid) as
(
select count(*) as allworkdays, EmployeeId from Shifts
where EmployeeId = 12
and date > getdate() - 33
group by EmployeeId
)
select distinct (c.sickdays * 100)/a.allworkdays as unplannedsicktime from shifts s
join callout_cte c on c.employeeid = s.EmployeeId
join allshift_cte a on a.employeeid = s.EmployeeId

--Select all Email days for a certain supporter
select s.*, e.name from Shifts s
join Employees e on e.employeeid = s.employeeid
where date > getdate() - 28
and s.EmployeeId = 12
and Email = 1

--Select all phone days for a certain supporter
select s.*, e.name from Shifts s
join Employees e on e.employeeid = s.employeeid
where date > getdate() - 28
and s.EmployeeId = 12
and Phone = 1

--Report total phone days for a supporter
select count(*) as totalphonedays, e.name from Shifts s
join Employees e on e.employeeid = s.employeeid
where date > getdate() - 28
and s.EmployeeId = 12
and Phone = 1
group by e.Name

--Report total email days for a supporter
select count(*) as totalphonedays, e.name from Shifts s
join Employees e on e.employeeid = s.employeeid
where date > getdate() - 28
and s.EmployeeId = 12
and Email = 1
group by e.Name