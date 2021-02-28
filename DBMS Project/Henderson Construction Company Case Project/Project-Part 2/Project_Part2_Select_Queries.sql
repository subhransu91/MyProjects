-- EXHIBIT B FORM PART C
select ProjectId as "Project Number", ProjectDescription, trim(Sitename) || ', ' || trim(addressline) || ', ' 
|| trim(city) || ', ' || trim(zip) as ProjectLocation from project p
inner join address a
on p.addressid=a.addressid;

-- EXHIBIT B FORM PART D

-- EXHIBIT C FORM PART C
select jobskillcode as "Code", jobclassification as "Job Classification", statepayrate as "Basic Hourly Rate",
Fringe as "Fringe Benefits Payments", statepayrate + fringe as "Total Compensation" from jobtype;

Exhibit D, Part D
select employeeid, jobskillcode, statepayrate as "Rate", fringe, statepayrate + fringe as "Total", hoursworked as "Hours"
,(statepayrate + fringe) * hoursworked as "Gross"
from timesheet t
inner join jobtype j
on t.jobtypeid=j.jobtypeid;

Exhibit D, Part E
select employeeid, jobskillcode, statepayrate  as "Rate", fringe, (statepayrate * 1.5) + fringe as "Total", hoursovertime as "Hours"
,(statepayrate * 1.5 + fringe) * hoursovertime as "Gross"
from timesheet t
inner join jobtype j
on t.jobtypeid=j.jobtypeid;

Exhibit D, Part F
select jobskillcode, sum(hoursworked) as "Regular", sum(hoursovertime) as "OverTime", sum(hoursworked) + sum(hoursovertime) as "Total"
from timesheet t
inner join jobtype j
on t.jobtypeid=j.jobtypeid
group by jobskillcode;

Exhibit E
-- EXHIBIT E FORM - Select Query to Display all Employee Information
select e.EmployeeID, LastName, FirstName, MiddleInitial, EmailID, phone,
DateOfBirth, Ethnicity, Gender, MartitalStatus, SSN, AddressLine, City, Zip,
MinorityYesNo, EEODescription
 from employee e
inner join address a
on e.addressid=a.addressid
inner join EEOCLASSIFICATION ee
on e.employeeid=ee.employeeid;


Exhibit F, Regular Pay
select a.Employee_Name as Name, sum(a.hours) "Total Regular Pay Hours", sum(a.Gross) as "Total Regular Pay"  from ( 
select t.employeeid, trim(firstname) || ' ' || MiddleInitial || ' ' || trim(lastname) as Employee_Name, jobskillcode, statepayrate  as Rate, fringe, (statepayrate) + fringe as Total
, hoursworked as Hours, (statepayrate + fringe) * hoursworked as Gross
from timesheet t
inner join jobtype j
on t.jobtypeid=j.jobtypeid
inner join employee e
on t.employeeid=e.employeeid ) a
group by a.Employee_Name;

Exhibit F, Overtime Pay
select a.Employee_Name as Name, sum(a.hours) "Total Overtime Pay Hours", sum(a.Gross) as "Total Overtime Pay"  from ( 
select t.employeeid, trim(firstname) || ' ' || MiddleInitial || ' ' || trim(lastname) as Employee_Name, jobskillcode, statepayrate  as Rate, fringe,
(statepayrate * 1.5) + fringe as Total, hoursovertime as Hours, (statepayrate * 1.5 + fringe) * hoursovertime as Gross
from timesheet t
inner join jobtype j
on t.jobtypeid=j.jobtypeid
inner join employee e
on t.employeeid=e.employeeid ) a
group by a.Employee_Name;