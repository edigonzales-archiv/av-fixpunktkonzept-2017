DELETE FROM ${dbschema}.berechnungen_tsp_ungleich_lfp2;

INSERT INTO ${dbschema}.berechnungen_tsp_ungleich_lfp2 
  (aname, bfs_nr, nfgeometer, lfp3, upgrade, geometrie, bemerkung, hoehe)
VALUES
  ('24033833', 2403, 'Urs Schor', 't', 't', ST_PointFromText('POINT(2623027.057 1236241.113)', 2056), 'LV95-Gesamtausgleich: 1108.121.0 / 623027.0570 / 236241.1133 / 451.3900 | Kontrollmessung 2018: 11081210,2623027.050,1236241.113,451.352', 451.39); 

INSERT INTO ${dbschema}.berechnungen_tsp_ungleich_lfp2 
  (aname, bfs_nr, nfgeometer, lfp3, upgrade, geometrie, bemerkung, hoehe)
VALUES
  ('8005215', 2575, 'Armin Weber', 't', 'f', ST_PointFromText('POINT(2630118.219 1237151.199)', 2056), '2018: Versicherung nicht mehr vorhanden. Neuer Belag/Strasse. LV95-Gesamtausgleich: 1108.422.0 / 630118.2194 / 237151.1995 / 427.8200', 427.82); 

INSERT INTO ${dbschema}.berechnungen_tsp_ungleich_lfp2 
  (aname, bfs_nr, nfgeometer, lfp3, upgrade, geometrie, bemerkung, hoehe)
VALUES
  ('5005535', 2580, 'Armin Weber', 't', 't', ST_PointFromText('POINT(2632452.176 1240216.935)', 2056), 'LV95-Gesamtausgleich: 1108.603.0 / 632452.1761 / 240216.9345 / 420.5400 | Kontrollmessung 2018: 11086030,2632452.167,1240216.917,420.503', 420.54); 

INSERT INTO ${dbschema}.berechnungen_tsp_ungleich_lfp2 
  (aname, bfs_nr, nfgeometer, lfp3, upgrade, geometrie, bemerkung, hoehe)
VALUES
  ('24224957', 2422, 'Urs Schor', 't', 't', ST_PointFromText('POINT(2619847.180 1241384.290)', 2056), 'LV95-Gesamtausgleich: 1107.801.0 / 619847.1798 241384.2898 / 733.9500 | Kontrollmessung 2018: 11078010,2619847.169,1241384.284,733.885', 733.95); 

INSERT INTO ${dbschema}.berechnungen_tsp_ungleich_lfp2 
  (aname, bfs_nr, nfgeometer, lfp3, upgrade, geometrie, bemerkung, hoehe)
VALUES
  ('11080080', 2422, 'Urs Schor', 'f', 'f', ST_PointFromText('POINT(2620891.139 1240644.545)', 2056), 'Punkt gelöscht und Materialisierung entfernt (2003). In LV95-Ausgleichung jedoch berücksichtig.', 594.99); 