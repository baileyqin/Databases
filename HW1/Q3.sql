/*I used SQLite*/

CREATE TABLE projects
(ProjectID CHAR(4) NOT NULL,
Step INTEGER NOT NULL,
Status CHAR(1) NOT NULL,
PRIMARY KEY (ProjectID,Step));

INSERT INTO projects (ProjectID, Step, Status)
VALUES
('P100', 0, 'C'),
('P100', 1, 'W'),
('P100', 2, 'W'),
('P201', 0, 'C'),
('P201', 1, 'C'),
('P333', 0, 'W'),
('P333', 1, 'W'),
('P333', 2, 'W'),
('P333', 3, 'W');

SELECT A.ProjectID
FROM 
(SELECT * 
FROM projects
WHERE (Step = 1 AND Status IS 'W')) AS A
,
(SELECT * 
FROM projects	
WHERE (Step = 0 AND Status IS 'C')) AS B
WHERE A.ProjectID=B.ProjectID;