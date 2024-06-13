---tabela gradinita
SELECT nume, ST_Area(geom) AS arie
FROM gradinita;

SELECT nume, ST_Perimeter(geom) AS perimetru
FROM gradinita;

---tabela directoare
SELECT ST_GeometryType(geom) AS tip_geometrie
FROM directoare;

SELECT nume, ST_Buffer(geom, 50) AS buffer_50m
FROM directoare;

--- tabela grupa
SELECT ST_Length(geom) AS lungime
FROM grupa;

SELECT tip, ST_AsText(ST_Centroid(geom)) AS centroid
FROM grupa;

--- tabela educatoare
SELECT ST_GeometryType(geom) "Tip geometrie", ST_Area(geom) FROM educatoare
WHERE ST_GeometryType(geom) IN ('ST_Point');

SELECT nume, ST_AsText(geom) AS coordonate
FROM educatoare;

--- tabela ingrijitoare
SELECT nume, ST_GeometryType(geom) AS tip_geometrie
FROM ingrijitoare;

SELECT nume, ST_Buffer(geom, 100) AS buffer_100m
FROM ingrijitoare;
