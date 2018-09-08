/*I used SQLite*/

CREATE TABLE spam
(Name CHAR(20) NOT NULL,
Address Char(20) NOT NULL,
ID INT NOT NULL,
SameFam INT,
PRIMARY KEY (ID));

INSERT INTO spam (Name, Address, ID, SameFam)
VALUES
('Alice','A',10,NULL),
('Bob','B',15,NULL),
('Carmen','C',22,NULL),
('Diego','A',9,10),
('Ella','B',3,15),
('Farkhad','D',11,NULL);

DELETE
FROM spam
WHERE ID in (SELECT DISTINCT SameFam
FROM spam
WHERE SameFam IS NOT NULL)
AND SameFam IS NULL