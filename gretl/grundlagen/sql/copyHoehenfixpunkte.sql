SELECT
  nummer AS nummer,
  1 AS kategorie,
  hoehegeom AS hoehe,
  geometrie AS geometrie,
  gem_bfs AS bfs_nr
FROM
  av_avdpool_ng.fixpunktekategorie1_hfp1
  
UNION ALL
  
SELECT
  nummer AS nummer,
  2 AS kategorie,
  hoehegeom AS hoehe,
  geometrie AS geometrie,
  gem_bfs AS bfs_nr
FROM
  av_avdpool_ng.fixpunktekategorie2_hfp2
  
UNION ALL
  
SELECT
  nummer AS nummer,
  3 AS kategorie,
  hoehegeom AS hoehe,
  geometrie AS geometrie,
  gem_bfs AS bfs_nr
FROM
  av_avdpool_ng.fixpunktekategorie3_hfp3
;  
