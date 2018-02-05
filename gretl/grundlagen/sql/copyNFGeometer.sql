SELECT
  DISTINCT ON (gem_bfs)
  gem_bfs AS bfs_nr,
  nfgeometer
FROM
  av_nfgeometer.qgis_printcomposer_info_v
;