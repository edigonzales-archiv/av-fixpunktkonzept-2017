SELECT 
  nummer,
  kategorie,
  hoehe,
  bfs_nr,
  geometrie
FROM
  ${dbschema}.grundlagen_hoehenfixpunkt
WHERE
  kategorie IN (1, 2)

UNION ALL
  
SELECT 
  hfp.nummer,
  hfp.kategorie,
  hfp.hoehe,
  hfp.bfs_nr,
  hfp.geometrie
FROM
  ${dbschema}.grundlagen_hoehenfixpunkt AS hfp
  LEFT JOIN ${dbschema}.berechnungen_gemeinde_mit_hfp3 AS gemeinde
  ON ST_Intersects(gemeinde.geometrie, hfp.geometrie)
WHERE
  hfp.kategorie = 3
  AND gemeinde.finanzierung_gesichert = true
;