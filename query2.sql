select ST_centroid(geom) from romania;

---sau select ST_centroid(geom) from "Romania";

create table centroid_romania as
select 'Romania' as nume_tara, ST_centroid(geom) as centroid from romania;

create table centroid_judete AS
select ST_Centroid(geom) as centorid from judete;

create table centroid_uat AS
select ST_Centroid(geom) as centorid from uat;

select * from centroid_regiune2;
select * from regiuni;

create table regiuni as
select region,ST_Union(geom) geom from judete group by region;

create table centroid_regiune AS
select region as nume_regiune, ST_Centroid(geom) as centorid from regiuni;
----sau 
create table centroid_regiuni AS
select region,ST_Centroid(st_union) as geom from regiuni;

alter table regiuni add column area DECIMAL;
update regiuni set area=ST_Area(geom)/10000;

select * from regiuni;

alter table uat add column area DECIMAL;
update uat set area=ST_Area(geom)/10000;

alter table romania add column perimetru DECIMAL;
update romania set perimetru= ST_Perimeter(geom)/1000 ;

alter table judete add column perimetru DECIMAL;
update judete set perimetru= ST_Perimeter(geom)/1000 ;

----polygon to line
create table regiuni_linii as 
select regiuni, ST_Boundary(geom) as geom from regiuni;

create table judete_linii as 
select judete, ST_Boundary(geom) as geom from judete;

create table judete_poligon as 
select judete_linii, ST_MakePolygon(geom) as geom from judete_linii;

create table judete_poligon_2 as 
select ST_Dump(ST_Polygonize(geom)) as geom from judete_linii;

select * from judete_poligon_2;

alter table judete add column romania_fid INTEGER NOT NULL Default 1;

alter table judete add constraint romania_id_fk foreign key(romania_fid) references romania(fid);

alter table judete add unique(county_id);

alter table uat add constraint judete_county_id_fk foreign key("countyId") references judete(county_id);

select * from judete order by romania_fid desc limit 10;

select fid, country from romania;
