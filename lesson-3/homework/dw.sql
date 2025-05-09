
-- FOREIGN KEY бошқа жадвал билан боғланишни таъминлайди.
-- Бу маълумотлар ўртасида боғлиқлик ва яхлитликни сақлашга ёрдам беради.


-- Price NULL бўлса, 0 кўрсатилади
SELECT ProductName, ISNULL(Price, 0) AS Price
FROM Products
]
-- Агар катак NULL бўлса, 0 билан алмаштиради
SELECT ProductID, ISNULL(Price, 0) AS Price
FROM Products;


ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;


ALTER TABLE Products
ADD CONSTRAINT chk_Price CHECK (Price > 0);


ALTER TABLE Products
ADD CONSTRAINT fk_CategoryID
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

-- PRIMARY KEY: Уникал ва NOT NULL бўлиши шарт. Жадвалда фақат битта бўлиши мумкин.
-- UNIQUE: Уникал, лекин NULL қийматлар қабул қилиши мумкин. Бир нечта UNIQUE бўлиши мумкин.


-- Файл йўлини ўзингизга мос равишда ўзгартиришингиз керак
BULK INSERT Products
FROM 'C:\data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

-- Бу сўров барча маҳсулотларни Products жадвалидан олади
SELECT * FROM Products;


ALTER TABLE Products
ADD CONSTRAINT uq_ProductName UNIQUE (ProductName);


-- NULL маълумот йўқлигини билдирувчи қиймат. 
-- NOT NULL эса маълумот албатта бўлиши кераклигини белгилайди.
