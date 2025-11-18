# Ravi Spigner
# 11/17/2025
# Workbook 7-Exercise 4-Northwind Traders
# 1. What is the product name(s) of the most expensive products?
# HINT: Find the max price in a subquery and then use that value to find products whose
# price equals that value.
USE northwind;
SELECT ProductName, UnitPrice, UnitsInStock FROM products WHERE UnitPrice >= (SELECT MAX(UnitPrice) FROM products);
# 2. What is the order id, shipping name and shipping address of all orders
# shipped via "Federal Shipping"?
# HINT: Find the shipper id of "Federal Shipping" in a subquery and then use that value
# to find the orders that used that shipper.
#SELECT OrderID, ShipName, ShipAddress FROM orders WHERE ShipVia = (SELECT ShipperID FROM shippers WHERE CompanyName = 'Federal Shipping');
SELECT o.OrderID, o.ShipName, o.ShipAddress, s.CompanyName FROM orders o JOIN shippers s ON o.ShipVia = s.ShipperID WHERE s.CompanyName = 'Federal Shipping';
# 3. What are the order ids of the orders that ordered "Sasquatch Ale"?
# HINT: Find the product id of "Sasquatch Ale" in a subquery and then use that
# value to find the matching orders from the `order details` table.
# Because the `order details` table has a space in its name, you will need to surround
# it with back ticks in the FROM clause.
#SELECT OrderID FROM orders WHERE OrderID IN (SELECT OrderID FROM `order details` WHERE ProductID = (SELECT ProductID FROM products WHERE ProductName = 'Sasquatch Ale'));
SELECT OrderID FROM `order details` WHERE ProductID = (SELECT ProductID FROM products WHERE ProductName = 'Sasquatch Ale');
# 4. What is the name of the employee that sold order 10266?
SELECT e.FirstName, e.LastName, o.OrderID FROM employees e JOIN orders o ON e.EmployeeID = o.EmployeeID WHERE o.OrderID = 10266;
# 5. What is the name of the customer that bought order 10266?
SELECT c.CompanyName, c.ContactName, o.OrderID FROM customers c JOIN orders o ON c.CustomerID = o.CustomerID WHERE o.OrderID = 10266;
