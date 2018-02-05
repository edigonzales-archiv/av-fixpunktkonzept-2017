SELECT
  fpds.nummer,
  gemeinde.bfs_nr,
  fpds.geometrie,
  fpds.signatur,
  fpds.ordnung,
  fpds.fineltra,
  fpds.zust_haupt,
  fpds.zustaendig,
  geometer.nfgeometer
FROM
  ${dbschema}.grundlagen_fpds AS fpds
LEFT JOIN ${dbschema}.grundlagen_gemeindegrenzen AS gemeinde
ON ST_Intersects(gemeinde.geometrie, fpds.geometrie)
LEFT JOIN ${dbschema}.grundlagen_geometer AS geometer
ON gemeinde.bfs_nr = geometer.bfs_nr
WHERE
  fpds.zugang = 'nicht_begehbar'
  AND fpds.fineltra = 'kein_TSP'
  AND fpds.nummer != '11072357' -- Röti
  AND fpds.nummer != '10874457' -- Hohe Winde
;
