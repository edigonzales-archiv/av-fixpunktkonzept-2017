SELECT
  typ,
  ST_Multi(geometrie) as geometrie
FROM
  arp_richtplan_2017.grundnutzung_version
WHERE
  typ IN (1,2)
;