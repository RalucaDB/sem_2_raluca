create table romania_wgs as
select county_id,county_code,region,mnemonic, ST_Transform(geom,4326) as geom from judete;

select * from judete where mnemonic='TM';
select * from romania_wgs where mnemonic='SB';

select mnemonic from romania_wgs where
ST_Touches((select geom from romania_wgs where mnemonic='BV'), geom);

select * from romania_wgs where
ST_Touches((select geom from romania_wgs where mnemonic='TM'), geom);

--cel mai mare judet vecin
select mnemonic,MAX(ST_AREA(geom)) area, geom from romania_wgs where 
ST_Touches((select geom from romania_wgs where mnemonic='AB'),geom)
group by mnemonic, geom
order by area DESC limit 1;


--cel mai mare judet care nu se invecineaza
select mnemonic,MAX(ST_AREA(geom)) area, geom from romania_wgs where 
ST_Touches((select geom from romania_wgs where mnemonic='AB'),geom) is fals
group by mnemonic, geom
order by area DESC limit 1;

--toate judetele care nu se invecineaza
select mnemonic,MAX(ST_AREA(geom)) area, geom from romania_wgs where 
ST_Touches((select geom from romania_wgs where mnemonic='AB'),geom) is fals
group by mnemonic, geom

---sau
--tote judetele vecine cu ....
select mnemonic,MAX(ST_AREA(geom)) area, geom from romania_wgs where 
ST_Touches((select geom from romania_wgs where mnemonic='SB'),geom)
group by mnemonic, geom;

--toate judetele care nu se invecineaza cu .....
select mnemonic,MAX(ST_AREA(geom)) area, geom from romania_wgs where 
ST_Touches((select geom from romania_wgs

select mnemonic, ST_GeometryType(geom) as type, ST_NDims(geom) dimension, ST_SRID(geom) from judete;

select  county_id, county_code, region,mnemonic, ST_AsGeoJSON(geom) from judete;
select ST_AsGeoJSON(geom) from judete;
			
select ST_AsEWKT(geom) from judete;
			
select ST_AsKML(geom) from romania_wgs;
