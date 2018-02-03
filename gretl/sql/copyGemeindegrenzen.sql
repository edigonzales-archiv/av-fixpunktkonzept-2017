SELECT
  gemeindename AS aname,
  bfs_gemeindenummer AS bfs_nr,
  geometrie AS geometrie
FROM
  agi_hoheitsgrenzen_pub.hoheitsgrenzen_gemeindegrenze
;