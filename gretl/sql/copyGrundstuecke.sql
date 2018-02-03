SELECT
  g1.nummer AS nummer,
  'Liegenschaft' AS art,
  g1.egris_egrid AS egrid,
  g1.nbident AS nbident,
  g1.gem_bfs AS bfs_nr,
  liegenschaft.geometrie AS geometrie
FROM
  av_avdpool_ng.liegenschaften_liegenschaft AS liegenschaft
  LEFT JOIN
    ( 
      SELECT
        tid,
        nummer,
        nbident,
        egris_egrid,
        gem_bfs
      FROM
        av_avdpool_ng.liegenschaften_grundstueck
      WHERE 
        art_txt = 'Liegenschaft'
        AND
        gueltigkeit_txt = 'rechtskraeftig'
    ) AS g1
  ON liegenschaft.liegenschaft_von = g1.tid
  
UNION ALL

SELECT
  g2.nummer AS nummer,
  'SelbstRecht.Baurecht' AS art,
  g2.egris_egrid AS egrid,
  g2.nbident AS nbident,
  g2.gem_bfs AS bfs_nr,
  selbstrecht.geometrie AS geometrie
FROM
  av_avdpool_ng.liegenschaften_selbstrecht AS selbstrecht
  LEFT JOIN
    ( 
      SELECT
        tid,
        nummer,
        nbident,
        egris_egrid,
        gem_bfs
      FROM
        av_avdpool_ng.liegenschaften_grundstueck
      WHERE 
        art_txt = 'SelbstRecht.Baurecht'
        AND
        gueltigkeit_txt = 'rechtskraeftig'
    ) AS g2
  ON selbstrecht.selbstrecht_von = g2.tid
WHERE nummer IS NOT NULL -- wtf?
;