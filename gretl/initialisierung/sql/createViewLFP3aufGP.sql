CREATE VIEW ${dbschema}.v_berechnungen_lfp3_auf_gp_${bfs_nr} AS
SELECT
    *
FROM
    ${dbschema}.berechnungen_lfp3_auf_gp
WHERE
    bfs_nr = ${bfs_nr}
;