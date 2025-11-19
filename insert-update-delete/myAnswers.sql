# Ravi Spigner
# 11/18/2025
# Workbook 7-Exercise 6: Insert-Update-Delete -Northwind Traders
# 1. Add a new supplier.
USE northwind;
INSERT INTO Suppliers VALUES(NULL, 'The Ravi Company', 'Ravi Spigner', 'CEO', '111 Cheese Ave', 'Seattle', 'Washington', '98125', 'U.S.A.', '+1 111-111-1111', '+2 222-222-2222', NULL);
# Test
SELECT * FROM Suppliers;
# 2. Add a new product provided by that supplier
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(NULL, 'Cheese', 30, 4, '500g', 10.50, 47, 0, 40, 0); # With first arg as null (which is ProductID, use next available entry which is 78)
# Test
#SELECT * FROM Products WHERE SupplierID = (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'The Ravi Company');
# 3. List all products and their suppliers.
SELECT s.CompanyName, p.*  FROM Products p JOIN Suppliers s ON p.SupplierID = s.SupplierID ORDER BY p.SupplierID DESC;
# 4. Raise the price of your new product by 15%.
UPDATE Products SET UnitPrice = UnitPrice * 1.15 WHERE ProductName = 'Cheese';
# 5. List the products and prices of all products from that supplier.
SELECT * FROM Products WHERE SupplierID = (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'The Ravi Company');
# 6. Delete the new product.
DELETE FROM Products WHERE ProductName = 'Cheese';
# Tests
#SELECT * FROM Products WHERE SupplierID = (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'The Ravi Company');
#SELECT * FROM Products WHERE ProductName = 'Cheese';
# 7. Delete the new supplier.
DELETE FROM Suppliers WHERE CompanyName = 'The Ravi Company';
# Test
#SELECT * FROM Suppliers WHERE CompanyName = 'The Ravi Company';
# 8. List all products.
SELECT * FROM Products;
# 9. List all suppliers.
SELECT * FROM Suppliers;