SELECT
  nummer AS nummer,
  1 AS kategorie,
  hoehegeom AS hoehe,
  geometrie AS geometrie,
  gem_bfs AS bfs_nr
FROM
  av_avdpool_ng.fixpunktekategorie1_lfp1
  
UNION ALL
  
SELECT
  nummer AS nummer,
  2 AS kategorie,
  hoehegeom AS hoehe,
  geometrie AS geometrie,
  gem_bfs AS bfs_nr
FROM
  av_avdpool_ng.fixpunktekategorie2_lfp2
  
UNION ALL
  
SELECT
  nummer AS nummer,
  3 AS kategorie,
  hoehegeom AS hoehe,
  geometrie AS geometrie,
  gem_bfs AS bfs_nr
FROM
  av_avdpool_ng.fixpunktekategorie3_lfp3
;  
