SELECT
  lfp.nummer,
  lfp.geometrie,
  gemeinde.bfs_nr,
  geometer.nfgeometer
FROM
(
  SELECT
    nummer,
    ST_SnapToGrid(geometrie, 3) AS geometrie
  FROM
    ${dbschema}.grundlagen_lagefixpunkt
  WHERE 
    kategorie = 2

  EXCEPT
  
  SELECT
    nummer,
    ST_SnapToGrid(geometrie, 3) AS geometrie
  FROM
    ${dbschema}.grundlagen_fpds
  WHERE
    fineltra LIKE 'TSP%'

  EXCEPT
  
  SELECT
    nummer,
    ST_SnapToGrid(geometrie, 3) AS geometrie
  FROM
    ${dbschema}.grundlagen_fpds
  WHERE
    zugang = 'nicht_begehbar'
    OR nummer = '11072357' -- Röti
    OR nummer = '10874457' -- Hohe Winde
) AS lfp
LEFT JOIN ${dbschema}.grundlagen_gemeindegrenzen AS gemeinde
ON ST_Intersects(gemeinde.geometrie, lfp.geometrie)
LEFT JOIN ${dbschema}.grundlagen_geometer AS geometer
ON geometer.bfs_nr = gemeinde.bfs_nr
;