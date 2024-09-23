create database couriermanagement;
use couriermanagement;

-- task 1
create table users (
    userid int primary key auto_increment,
    name varchar(255) not null,
    email varchar(255) unique not null,
    password varchar(255) not null,
    contactnumber varchar(20),
    address text
);

create table couriers (
    courierid int primary key auto_increment,
    sendername varchar(255) not null,
    senderaddress text not null,
    receivername varchar(255) not null,
    receiveraddress text not null,
    weight decimal(5, 2) not null,
    status varchar(50) not null,
    trackingnumber varchar(20) unique not null,
    deliverydate date
);

create table courierservices (
    serviceid int primary key auto_increment,
    servicename varchar(100) not null,
    cost decimal(8, 2) not null
);

create table employees (
    employeeid int primary key auto_increment,
    name varchar(255) not null,
    email varchar(255) unique not null,
    contactnumber varchar(20),
    role varchar(50),
    salary decimal(10, 2)
);

create table locations (
    locationid int primary key auto_increment,
    locationname varchar(100),
    address text
);

create table payments (
    paymentid int primary key auto_increment,
    courierid int,
    locationid int,
    amount decimal(10, 2),
    paymentdate date,
    foreign key (courierid) references couriers(courierid),
    foreign key (locationid) references locations(locationid)
);

insert into users (name, email, password, contactnumber, address)
values 
('rahul kumar', 'rahul@example.com', 'password123', '9876543210', 'bhopal, india'),
('sita patel', 'sita@example.com', 'password456', '9123456780', 'mumbai, india');

insert into couriers (sendername, senderaddress, receivername, receiveraddress, weight, status, trackingnumber, deliverydate) 
values 
('rahul kumar', 'bhopal, india', 'sita patel', 'mumbai, india', 5.50, 'in transit', 'tn12345', '2024-09-19'),
('amit verma', 'delhi, india', 'rahul kumar', 'bhopal, india', 10.00, 'delivered', 'tn67890', '2024-09-18');

insert into employees (name, email, contactnumber, role, salary)
values 
('vikram rao', 'vikram@courier.com', '9876541230', 'courier manager', 50000.00),
('meera sharma', 'meera@courier.com', '9123456781', 'delivery person', 25000.00);

insert into courierservices (servicename, cost) 
values 
('standard delivery', 100.00),
('express delivery', 250.00),
('same-day delivery', 500.00);

insert into locations (locationname, address) 
values 
('bhopal office', 'bhopal, mp, india'),
('mumbai office', 'mumbai, mh, india'),
('delhi office', 'delhi, dl, india');

insert into payments (courierid, locationid, amount, paymentdate)
values
(1, 1, 150.00, '2024-09-19'),  
(2, 2, 200.00, '2024-09-18'), 
(1, 3, 300.00, '2024-09-20');  

-- task 2
select * from users;
select * from couriers where sendername = 'rahul kumar'; 
select * from couriers;
select * from couriers where trackingnumber = 'tn12345';
select * from couriers where status = 'delivered' and weight =  10.00; 
select * from couriers where status != 'delivered';
select * from couriers where deliverydate = curdate();
select * from couriers where status = 'in transit';
select courierid, count(*) as totalpackages from couriers group by courierid;
select courierid, avg(datediff(deliverydate, '2024-09-01')) as averagedeliverytime 
from couriers 
where deliverydate is not null
group by courierid;

select * from couriers where weight between 2.00 and 10.00;
select * from employees where name like '%ra%';
select c.* 
from couriers c
join payments p on c.courierid = p.courierid
where p.amount > 50;


-- task 3
-- 3.1
select e.employeeid, e.name, count(c.courierid) as totalcouriershandled
from employees e
join couriers c on e.employeeid = c.courierid
group by e.employeeid, e.name;

-- 3.2
select l.locationid, l.locationname, sum(p.amount) as totalrevenue
from locations l
join payments p on l.locationid = p.locationid
group by l.locationid, l.locationname;

-- 3.3
select l.locationid, l.locationname, count(c.courierid) as totalcouriersdelivered
from locations l
join couriers c on l.locationid = c.courierid
where c.status = 'delivered'
group by l.locationid, l.locationname;

-- 3.4
select courierid, avg(datediff(deliverydate, '2024-09-01')) as avgdeliverytime
from couriers
where deliverydate is not null
group by courierid
order by avgdeliverytime desc
limit 1;

-- 3.5
select l.locationid, l.locationname, sum(p.amount) as totalpayments
from locations l
join payments p on l.locationid = p.locationid
group by l.locationid, l.locationname
having totalpayments < 500;

-- 3.6
select l.locationid, l.locationname, sum(p.amount) as totalpayments
from locations l
join payments p on l.locationid = p.locationid
group by l.locationid, l.locationname;

-- 3.7
select c.courierid, sum(p.amount) as totalpayments
from couriers c
join payments p on c.courierid = p.courierid
where p.locationid = 1
group by c.courierid
having totalpayments > 1000;

-- 3.8
select c.courierid, sum(p.amount) as totalpayments
from couriers c
join payments p on c.courierid = p.courierid
where p.paymentdate > '2024-09-19'
group by c.courierid
having totalpayments > 1000;

-- 3.9
select l.locationid, l.locationname, sum(p.amount) as totalpayments
from locations l
join payments p on l.locationid = p.locationid
where p.paymentdate < '2024-09-20'
group by l.locationid, l.locationname
having totalpayments > 5000;

-- task 4
-- 4.1
select p.paymentid, p.amount, p.paymentdate, c.courierid, c.sendername, c.receivername, c.trackingnumber
from payments p
inner join couriers c on p.courierid = c.courierid;

-- 4.2
select p.paymentid, p.amount, p.paymentdate, l.locationid, l.locationname, l.address
from payments p
inner join locations l on p.locationid = l.locationid;

-- 4.3
select p.paymentid, p.amount, p.paymentdate, c.courierid, c.sendername, c.trackingnumber, 
l.locationid, l.locationname, l.address
from payments p
inner join couriers c on p.courierid = c.courierid
inner join locations l on p.locationid = l.locationid;

-- 4.4
select p.paymentid, p.amount, p.paymentdate, c.courierid, c.sendername, c.receivername, c.trackingnumber
from payments p
left join couriers c on p.courierid = c.courierid;

-- 4.5
select c.courierid, c.trackingnumber, sum(p.amount) as totalpayments
from payments p
inner join couriers c on p.courierid = c.courierid
group by c.courierid, c.trackingnumber;

-- 4.6
select p.paymentid, p.amount, p.paymentdate, c.courierid, c.trackingnumber
from payments p
inner join couriers c on p.courierid = c.courierid
where p.paymentdate = '2024-09-20';

-- 4.7
select courierid, sendername, receivername, weight
from couriers
where weight > (select avg(weight) from couriers);

-- 4.8
select name, salary
from employees
where salary > (select avg(salary) from employees);

-- 4.9
select sum(cost) as totalcost
from courierservices
where cost < (select max(cost) from courierservices);

-- 4.10
select c.courierid, c.sendername, c.receivername, c.weight, c.trackingnumber
from couriers c
where exists (select 1 from payments p where p.courierid = c.courierid);

-- 4.11
select locationname, address
from locations
where locationid in (
    select locationid 
    from payments 
    where amount = (select max(amount) from payments)
);

-- 4.12
select courierid, sendername, receivername, weight
from couriers
where weight > all (
    select weight 
    from couriers 
    where sendername = 'rahul kumar'
);




