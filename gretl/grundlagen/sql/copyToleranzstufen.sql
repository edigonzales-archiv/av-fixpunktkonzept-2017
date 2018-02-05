SELECT
  art_txt AS typ,
  gem_bfs as bfs_nr,
  ST_Multi(geometrie) as geometrie
FROM
  av_avdpool_ng.tseinteilung_toleranzstufe
;