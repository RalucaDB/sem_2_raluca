create extension postgis;
select * from uat where region='Vest';
select * from judete;
select * from judete where pop2011 > 400000;

---unire poligoane
create table regiuni_2 as
select region, count (*) nr_judete,ST_Union(geom) geom from judete group by region;

alter table judete add column area DECIMAL;
update judete set area=ST_Area(geom)/10000;

select region, SUM(pop2011) populatie_2011, ST_Union(geom) geom from judete group by region;
select MIN(area), Max(area), SUm(area) from judete;					