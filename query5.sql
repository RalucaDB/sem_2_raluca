select ST_GeometryType(geom) from geometries;

create table toponimii
(
	fid SERIAL PRIMARY KEY,
	nume VARCHAR(50) NOT NULL,
	geom GEOMETRY(POINT, 4326)  --GEOMETRIE DE TIP PUNCT IN SISTEM DE PROIECTIE WGS84
);

create table ax_drum
(
	fid SERIAL PRIMARY KEY,
	indicativ VARCHAR(50) NOT NULL,
	lungime DECIMAL NULL,
	geom GEOMETRY(LINESTRING, 4326)  --GEOMETRIE DE TIP LINIE IN SISTEM DE PROIECTIE WGS84
);

create table constructii
(
	fid SERIAL PRIMARY KEY,
	nume VARCHAR(50) NOT NULL,
	nr_postal VARCHAR(50) NOT NULL,
	suprafta_sol DECIMAL NULL,
	geom GEOMETRY(POLYGON, 4326)  --GEOMETRIE DE TIP POLIGON IN SISTEM DE PROIECTIE WGS84
);

create table stalpi
(
	fid SERIAL PRIMARY KEY,
	nr_inventar VARCHAR(50) NOT NULL,
	geom GEOMETRY(MultiPoint, 4326) 
);

select * from stalpi;

create table retea_electrica
(
	fid SERIAL PRIMARY KEY,
	voltaj VARCHAR(50) NOT NULL,
	lungime DECIMAL NULL,
	geom GEOMETRY(MULTILINESTRING, 4326)  
);

create table drumuri
(
	fid SERIAL PRIMARY KEY,
	indicativ VARCHAR(50) NOT NULL,
	area DECIMAL NULL,
	geom GEOMETRY(MULTIPOLYGON, 4326)  
);

create table poduri
(
	fid SERIAL PRIMARY KEY,
	nr_postal VARCHAR(10) NOT NULL,
	geom GEOMETRY(GEOMETRYCOLLECTION, 4326)  
);

select ST_GeometryType(geom) from poduri;
select ST_AsText(geom) from stalpi;
select ST_LineFromMultiPoint('MultiPoint(1 2,3 4,4 5,6 7)')
select ST_StartPoint(geom) from ax_drum;
select ST_EndPoint(geom) from ax_drum;

select ST_Points(geom) geom from retea_electrica
union
select geom from retea_electrica
union
select ST_Centroid(geom) geom from retea_electrica;


select * from ax_drum;
