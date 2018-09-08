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


/* METHOD 1!!!!!*/
SELECT Chef
FROM 
/* chef vs count table for relavent dishes*/
(SELECT Chef, COUNT(*) AS 'ct'
FROM chefs
WHERE chefs.Dish in 
(SELECT DISTINCT Dish
FROM want)
GROUP BY Chef) AS A
,
/* count distinct number of dishes wanted*/
(SELECT COUNT(DISTINCT Dish) AS 'ct'
FROM want
) AS  B
WHERE A.ct=B.ct


/*METHOD 2!!!!!*/
/* making "required" chef's requirement table TABLE A*/
SELECT DISTINCT chefs.Chef, want.Dish
FROM chefs, want

/* making table that shows what in wanted the chefs can't make TABLE B*/
SELECT * 
FROM A
WHERE NOT EXISTS 
(SELECT *
FROM want, chefs
WHERE A.Chef = chefs.Chef AND A.Dish = chefs.Dish)


/*making not qualified chefs table TABLE C*/
SELECT Chef
FROM B

/*making chefs that are qualified table FINAL!!*/
SELECT Chef
FROM chefs
WHERE NOT EXISTS 
( SELECT * 
FROM C
WHERE C.Chef=chefs.Chef
)


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


					 					 
/* METHOD 3!!!!!!!!*/
 	
SELECT DISTINCT Chef FROM chefs AS A
WHERE (SELECT Dish FROM want
        EXCEPT
        SELECT Dish
          FROM chefs AS B
         WHERE A.Chef = B.Chef) IS NULL;
