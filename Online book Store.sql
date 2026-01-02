create database OnlineBookStore;
use OnlineBookStore;

select * from Customers;
select * from Books;
select * from Orders;

--Basic Questions
--1. 

select * from Books 
where Genre = 'Fiction';

--2 . 

select * from Books 
where Published_Year > 1950;

--3.

select * from Customers 
where Country = 'Canada';

--4. 
select * from Orders 
where Order_Date Between '2023-11-01' and '2023-11-30';

--5.
select sum(Stock )from Books;

--6.
select top 1 * from Books order by Price Desc;
select * from Books where price = (select max(Price) from Books);

--7.
select * from Orders where Quantity >= 2;

--8.
select * from Orders
where Total_Amount > 20;

--9.
select count(distinct genre ) from Books;

--10.
select * from Books 
where Stock = (Select min(Stock) from Books);

select top 1 * from Books 
where Stock = (Select min(Stock) from Books);

--11.
select 
cast(sum(Total_Amount) as decimal(10,2)) as Total_revenue from Orders

--advanced Question--

--1. 
select b1.Genre, sum(o1.Quantity) from Orders o1
join
Books b1 
on  o1.Book_ID = b1.Book_ID
group by Genre;

--2.
select AVG(Price) from Books where genre = 'Fantasy';

--3.
select Customer_ID, COUNT(Order_ID) as order_count from Orders group by Customer_ID
having count(Order_ID) >=2;

--4.
select top 1 Book_ID, COUNT(order_id) as count_order from Orders
group by Book_ID 
order by count_order desc;

select distinct(book_ID) from Orders ;

--5.
select top 3 * from Books where Genre = 'Fantasy'
order by Price desc;

--6.
select  b1.author, sum(o1.Quantity) as QuantityOfBooks from Orders  o1
join Books b1
on o1.Book_ID = b1.Book_ID group by b1.Author;

--7.

/*select c1.city, sum(Price) as total_spent from Customers c1
join Orders o1 
on c1.Customer_ID = o1.Customer_ID
join Books b1
on b1.Book_ID = o1.Book_ID 
group by City
order by total_spent desc;*/

select distinct c1.City, Total_Amount from Orders o1
join Customers c1
on o1.Customer_ID = c1.Customer_ID
where o1.Total_Amount > 30;

--8.
select top 1 c1.Customer_ID, c1.[name], sum(o1.Total_Amount) as tot_amm_cus  from Orders o1
join Customers c1
on o1.Customer_ID = c1.Customer_ID
group by c1.Customer_ID, c1.[Name]
order by tot_amm_cus desc;

--9.

select b1.Book_ID, b1.Title, b1.Stock,
Coalesce(sum(Quantity),0)  AS order_quantity ,
(b1.Stock - Coalesce(sum(Quantity),0)) as remain_quantity
from Books b1
left join Orders  o1
on b1.Book_ID = o1.Book_ID
group by b1.Book_ID, b1.Title, b1.Stock;











