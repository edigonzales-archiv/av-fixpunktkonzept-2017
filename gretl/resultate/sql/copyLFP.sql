SELECT
  nummer,
  CASE
    WHEN ordnung LIKE 'LFP2%' THEN 2
    WHEN ordnung LIKE 'LFP1%' THEN 1
    ELSE 0
  END AS kategorie,
  h02::numeric AS hoehe,
  lfp.geometrie,
  bfs_nr,
  ordnung,
  signatur,
  fineltra,
  proto_url AS protokoll
FROM
  ${dbschema}.grundlagen_fpds AS lfp
  LEFT JOIN ${dbschema}.grundlagen_gemeindegrenzen AS gemeinde
  ON ST_Intersects(gemeinde.geometrie, lfp.geometrie)
WHERE
  fineltra IN ('TSP1', 'TSP2')
  OR ordnung LIKE 'LFP1%'

UNION ALL
  
SELECT
  lfp.aname AS nummer,
  2 AS kategorie,
  lfp.hoehe,
  lfp.geometrie,
  gemeinde.bfs_nr,
  NULL::varchar AS ordnung,
  NULL::varchar AS signatur,
  NULL::varchar AS fineltra,
  NULL::varchar AS protokoll
FROM
  ${dbschema}.berechnungen_tsp_ungleich_lfp2 AS lfp
  LEFT JOIN ${dbschema}.grundlagen_gemeindegrenzen AS gemeinde
  ON ST_Intersects(gemeinde.geometrie, lfp.geometrie)
WHERE
  lfp.upgrade = true
;