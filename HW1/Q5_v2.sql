/*I used SQLite*/

CREATE TABLE chefs
(Chef CHAR(20) NOT NULL,
Dish Char(35) NOT NULL,
PRIMARY KEY (Chef, Dish));

INSERT INTO chefs (Chef, Dish)
VALUES
('A','Mint chocolate brownie'),
('B','Upside down pineapple cake'),
('B','Creme brulee'),
('B','Mint chocolate brownie'),
('C','Upside down pineapple cake'),
('C','Creme brulee'),
('D','Apple pie'),
('D','Upside down pineapple cake'),
('D','Creme brulee'),
('E','Apple pie'),
('E','Upside down pineapple cake'),
('E','Creme brulee'),
('E','Bananas Foster');

CREATE TABLE want
(Dish Char(35) NOT NULL,
PRIMARY KEY (Dish));

INSERT INTO want (Dish)
VALUES
('Apple pie'),
('Upside down pineapple cake'),
('Creme brulee');

SELECT DISTINCT Chef
FROM chefs
WHERE NOT EXISTS 
	( SELECT * 
	FROM 
		(SELECT Chef
		FROM 
			(SELECT * 
			FROM 
				(SELECT DISTINCT chefs.Chef, want.Dish
				FROM chefs, want
				)AS A
			WHERE NOT EXISTS 
				(SELECT *
				FROM want, chefs
				WHERE A.Chef = chefs.Chef AND A.Dish = chefs.Dish)
			) AS B
		)AS C
	WHERE C.Chef=chefs.Chef
	)
