--i used postgis
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;

CREATE TABLE points 
(name varchar PRIMARY KEY,
point geometry NOT NULL);

INSERT INTO points(point,name)
VALUES
(ST_GeomFromText('POINT(-118.291147 34.025348)', 4326),'NWUSC'),
(ST_GeomFromText('POINT(-118.289234 34.02116)', 4326), 'SGM'),
(ST_GeomFromText('POINT(-118.288105 34.024325)', 4326), 'LyonCenter'),
(ST_GeomFromText('POINT(-118.280273 34.022058)', 4326), 'NEUSC'),
(ST_GeomFromText('POINT(-118.282333 34.018536)', 4326), 'SEUSC'),
(ST_GeomFromText('POINT(-118.286313 34.020217)', 4326), 'TutorHall'),
(ST_GeomFromText('POINT(-118.282966 34.021791)', 4326), 'Leavy'),
(ST_GeomFromText('POINT(-118.291302 34.018456)', 4326), 'SWUSC'),
(ST_GeomFromText('POINT(-118.285182 34.020061)', 4326), 'Traveler');

--query for convexhull
SELECT ST_AsEWKT(ST_ConvexHull(ST_Collect(point))) As hull_geom
FROM points;

--query for nearest neighbors SGM is my home
SELECT g2.name
FROM points AS g1, points AS g2
WHERE g1.name='SGM' and g1.name <> g2.name
ORDER BY ST_Distance(g1.point, g2.point)
LIMIT 3;
