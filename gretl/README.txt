gradle -I init.gradle initialisierung:dropSchema_Fixpunktkonzept initialisierung:createSchema_Fixpunktkonzept grundlagen:copy_Grundlagedaten grundlagen:importShapefile_Dreiecksvermaschung grundlagen:importShapefile_FPDS grundlagen:importShapefile_SpannungsarmeGebiete

gradle -I init.gradle berechnungen:compute_Hochzielpunkte berechnungen:compute_LFP2_degradieren berechnungen:deleteData_compute_LFP3_auf_GP berechnungen:compute_LFP3_auf_GP berechnungen:insertData_Gemeinde_lfp3_ohne_hoehe berechnungen:insertData_Gemeinde_mit_HFP3 berechnungen:insertData_TSP_ungleich_LFP2


gradle -I init.gradle berechnungen:compute_Hochzielpunkte berechnungen:compute_LFP2_degradieren berechnungen:insertData_Gemeinde_lfp3_ohne_hoehe berechnungen:insertData_Gemeinde_mit_HFP3 berechnungen:insertData_TSP_ungleich_LFP2

gradle -I init.gradle resultate:copy_Resultate

gradle -I init.gradle export:exportXTF_Fixpunktkonzept



java -jar ~/apps/ili2pg-3.10.7/ili2pg.jar --dbhost 192.168.50.5 --dbusr ddluser --dbpwd ddluser --dbdatabase sogis --dbschema av_fixpunktstrategie_2017_fubar --disableValidation --nameByTopic --createEnumTabs --strokeArcs --createBasketCol --defaultSrsCode 2056 --coalesceMultiSurface --modeldir "http://models.geo.admin.ch;../../ili/" --models SO_AV_Fixpunktkonzept_2017_20180203 --import av-fixpunktkonzept-2017.xtf


# Nur Resultate importieren
java -jar ~/apps/ili2pg-3.10.7/ili2pg.jar --dbhost 192.168.50.5 --dbusr ddluser --dbpwd ddluser --dbdatabase sogis --dbschema av_fixpunktstrategie_2017_Resultate --disableValidation --nameByTopic --createEnumTabs --strokeArcs --createBasketCol --defaultSrsCode 2056 --coalesceMultiSurface --modeldir "http://models.geo.admin.ch;../../ili/" --topics SO_AV_Fixpunktkonzept_2017_20180203.Resultate --import av-fixpunktkonzept-2017.xtf