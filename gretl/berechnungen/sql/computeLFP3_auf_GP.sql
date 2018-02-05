SELECT
  --st_asewkt(lfp.geometrie),
  --st_asewkt(gp.geom),
  --lfp.t_id,
  lfp.nummer,
  lfp.geometrie,
  ${bfs_nr} AS bfs_nr, -- for numerical reasons some bfs_nr will be NULL
  geometer.nfgeometer
FROM
  (
    SELECT
      *
    FROM
      ${dbschema}.grundlagen_lagefixpunkt 
    WHERE 
      bfs_nr = ${bfs_nr}
  ) AS lfp
  INNER JOIN
  (
    SELECT DISTINCT
      geom
    FROM
    (
      SELECT
        (ST_DumpPoints(geometrie)).geom AS geom
      FROM
        ${dbschema}.grundlagen_grundstuecke 
      WHERE 
        bfs_nr = ${bfs_nr}
    ) AS foo
  ) AS gp
  ON ST_Equals(gp.geom, lfp.geometrie)
  LEFT JOIN 
  (
    SELECT
      *
    FROM
      ${dbschema}.grundlagen_gemeindegrenzen
    WHERE
      bfs_nr = ${bfs_nr}
  ) AS gemeinde
  ON ST_Intersects(gemeinde.geometrie, lfp.geometrie)
  RIGHT JOIN
  (
    SELECT
      *
    FROM
      ${dbschema}.grundlagen_toleranzstufen
    WHERE
      bfs_nr = ${bfs_nr}
      AND typ IN ('TS3', 'TS4')
  ) AS ts
  ON ST_Intersects(ts.geometrie, lfp.geometrie)
  LEFT JOIN ${dbschema}.grundlagen_geometer AS geometer
  ON geometer.bfs_nr = gemeinde.bfs_nr
  
;