create extension postgis;

--points
--POINT(LAT,LONG)
select POINT(45,25);

--linestring
--LINESTRING(LAT LONG, LAT LONG, LAT LONG, LAT LONG ... )
select LINESTRING(20 40, 25 45, 26 46, 56 65);

--polygon
--POLYGON(LAT LONG, LAT LONG, LAT LONG, LAT LONG ... )
select POLYGON(20 40, 25 45, 26 46, 20 40);

--polygon with holes
--POLYGON(polygon1, holes....)
--POLYGON((20 40, 25 45, 26 46, 20 40), (hole1), (hole2));
select POLYGON((20 40, 25 45, 26 46, 20 40),(25 45, 26 46, 27 47, 25 45));

--geometry collections
--GEOMETRYCOLLECTION(GEOM1, GEOM2, GEOM3)
select GEOMETRYCOLLECTION(POINT(45,25),LINESTRING(20 40, 25 45, 26 46, 56 65),POLYGON(20 40, 25 45, 26 46, 20 40));

CREATE TABLE geometries
	(
		fid SERIAL PRIMARY KEY,
		name VARCHAR(30) NULL,
		geom geometry
);

INSERT INTO geometries(name, geom) VALUES
('point',ST_GeometryFromText('POINT(45 25)')),
('linestring',ST_GeometryFromText('LINESTRING(20 40, 25 45, 26 46, 56 65)'));
--('polygon', ST_GeometryFromText('POLYGON(20 40, 25 45, 26 46, 20 40)')),
--('polygon with holes',ST_GeometryFromText('POLYGON((20 40, 25 45, 26 46, 20 40),(25 45, 26 46, 27 47, 25 45))')),
--('geometrycollection',ST_GeometryFromText('GEOMETRYCOLLECTION(POINT(45,25),LINESTRING(20 40, 25 45, 26 46, 56 65),POLYGON(20 40, 25 45, 26 46, 20 40))'));

select * from geometries;

INSERT INTO geometries(name, geom) VALUES
  ('Point', 'POINT(0 0)'),
  ('Linestring', 'LINESTRING(0 0, 1 1, 2 1, 2 2)'),
  ('Polygon', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
  ('PolygonWithHole', 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1))'),
  ('Collection', 'GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))');


UPDATE geometries SET geom=ST_SetSRID(geom, 4326);
UPDATE geometries SET geom=ST_SetSRID(geom, 3844);


select * from geometries;

select * from geometries where name='point';
select * from geometries where name='linestring';
select ST_AsText(geom) from geometries;
select ST_Area(geom) from geometries where name in('Polygon','PolygonWithHole');
select ST_Length(geom) from geometries where name in('linestring','Linestring');
select ST_Perimeter(geom) from geometries;
select ST_Perimeter(geom) from geometries where name in('Polygon','PolygonWithHole');

select ST_Centroid(geom) from geometries
UNION
select geom from geometries;

select ST_Y(ST_Centroid(geom)),ST_X(ST_Centroid(geom)) from geometries;

select ST_Y(geom) as latitude, ST_X(geom) as longitude from geometries where name in ('Point', 'point')

select name, ST_Transform(geom,4326) as geom from geometries;