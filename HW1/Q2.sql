/*I used SQLite*/

CREATE TABLE enrollment
(SID INTEGER NOT NULL,
ClassName CHAR(6) NOT NULL,
Grade CHAR(1) NOT NULL,
PRIMARY KEY (SID,ClassName));

INSERT INTO enrollment(SID, ClassName, Grade)
VALUES
(123, 'ART123', 'A'),
(123, 'BUS456', 'B'),
(666, 'REL100', 'D'),
(666, 'ECO966', 'A'),
(666, 'BUS456', 'B'),
(345, 'BUS456', 'A'),
(345, 'ECO966', 'F');

SELECT ClassName, Count(*)
FROM enrollment
GROUP BY ClassName