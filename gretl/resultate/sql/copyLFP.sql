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

-- LPF3-TSP, die wir zu LFP2 upgraden (waren früher alles LFP2 und sind in LV95 bestimmt worden)
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

UNION ALL

SELECT
  '11072357' AS nummer,
  2 AS kategorie,
  1399.330 AS hoehe,
  ST_PointFromText('POINT(2606757.520 1234122.210)', 2056) AS geometrie,
  2522 AS bfs_nr,
  'LFP2.Ordnung4' AS ordnung,
  'Pyramide_Pfeiler' AS signatur,
  'kein_TSP' AS fineltra,
   'https://data.geo.admin.ch/ch.swisstopo.fixpunkte-lfp1/protokolle/LV03AV/1107/CH0300001107_11072357.pdf' AS protokoll

-- Hohe Winde ist LFP1.Ordnung3
;