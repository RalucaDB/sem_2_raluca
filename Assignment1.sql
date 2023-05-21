create table proprietate
(
	fid SERIAL PRIMARY KEY,
	nume VARCHAR(50) NOT NULL,
	nr_postal VARCHAR(50) NOT NULL,
	suprafta_sol DECIMAL NULL,
	geom GEOMETRY(POLYGON, 4326) 
);

create table parcele
(
	fid SERIAL PRIMARY KEY,
	indicativ VARCHAR(50) NOT NULL,
	suprafata DECIMAL NULL,
	proprietate_id INTEGER NOT NULL,
	geom GEOMETRY(MULTIPOLYGON, 4326),
	FOREIGN KEY(proprietate_id) REFERENCES proprietate(fid)
);

create table constructii_domeniu
(
	fid SERIAL PRIMARY KEY,
	nume VARCHAR(50) NOT NULL,
	suprafta_sol DECIMAL NULL,
	parcela_id INTEGER NOT NULL,
	geom GEOMETRY(MULTIPOLYGON, 4326),
	FOREIGN KEY(parcela_id) REFERENCES parcele
);

create table alei
(
	fid SERIAL PRIMARY KEY,
	indicativ VARCHAR(50) NOT NULL,
	area DECIMAL NULL,
	proprietate_id INTEGER NOT NULL,
	geom GEOMETRY(MULTIPOLYGON, 4326),
	FOREIGN KEY(proprietate_id) REFERENCES proprietate
);

create table copaci
(
	fid SERIAL PRIMARY KEY,
	nr_inventar VARCHAR(50) NOT NULL,
	parcela_id INTEGER NOT NULL,
	geom GEOMETRY(MultiPoint, 4326), 
	FOREIGN KEY(parcela_id) REFERENCES parcele
);

create table vita_vie
(
	fid SERIAL PRIMARY KEY,
	soi VARCHAR(50) NOT NULL,
	lungime DECIMAL NULL,
	parcela_id INTEGER NOT NULL,
	geom GEOMETRY(MULTILINESTRING, 4326), 
	FOREIGN KEY(parcela_id) REFERENCES parcele
);

select * from vita_vie;

update vita_vie set lungime=ST_Length(geom);
select p.fid, Count(c.fid) nr_constructii from parcele as p
inner join 

create table domeniu
(
	fid SERIAL PRIMARY KEY,
	nr_postal VARCHAR(10) NOT NULL,
	geom GEOMETRY(GEOMETRYCOLLECTION, 4326)  
);

select ST_GeometryType(geom) from vita_vie;
select ST_AsText(geom) from alei;
select ST_LineFromMultiPoint('MultiPoint(1 2,3 4,4 5,6 7)') from copaci;
select ST_StartPoint(geom) from vita_vie;
select ST_EndPoint(geom) from vita_vie;

select ST_Points(geom) geom from retea_electrica
union
select geom from retea_electrica
union
select ST_Centroid(geom) geom from retea_electrica;





