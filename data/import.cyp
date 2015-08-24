// require unique nodes
CREATE CONSTRAINT ON (p:Party) ASSERT p.name IS UNIQUE
CREATE CONSTRAINT ON (p:Person) ASSERT p.name IS UNIQUE
CREATE CONSTRAINT ON (p:Institution) ASSERT p.name IS UNIQUE

// Zastupitelstvo
CREATE (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/pirati-cz/goverMap/master/data/zastupitele_praha.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (u:Person { name: line.Jméno, contact: line.Kontakt})-[:MEMBER_OF {role: "zastupitel"}]->(zhmp)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/pirati-cz/goverMap/master/data/zastupitele_praha.csv" AS line
MATCH (u:Person { name: line.Jméno})
MERGE (p:Party {name:line.Strana})
MERGE (u)-[:MEMBER_OF {role: "člen"}]->(p)
// could have used `Strana/Klub`


LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_financni.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor finanční ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_kontrolni.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor kontrolní ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_pro_bezpecnost.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor pro bezpečnost ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_pro_dopravu_a _evropske_fondy.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor pro dopravu a evropské fondy ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_pro_kulturu_pamatkovou_peci_vystavnictvi_cestovni_ruch_a _zahranicni_vztahy.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor pro kulturu, památkovou péči, výstavnictví, cestovní ruch a zahraniční vztahy ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_pro_legislativu_verejnou_spravu_protikorupcni_opratreni_a_informatiku.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor pro legislativu, veřejnou správu, protikorupční opatření a informatiku ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_pro_sport_a_volny_cas.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor pro sport a volný čas ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_pro_spravu_majetku_a_majetkove_podily.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor pro správu majetku a majetkové podíly ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_pro_uzemni_rozvoj_a_uzemni_plan.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor pro územní rozvoj a územní plán ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_pro_vychovu_a_vzdelavani.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor pro výchovu a vzdělávání ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_pro_zdravotnictvi_a_bydleni.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor pro zdravotnictví a bydlení ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/vybory/vybor_pro_zivotni_prostredi_infrastrukturu_a_technickou_vybavenost.csv" AS line
MATCH (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})
MERGE (v:Organ {name: "Výbor pro životní prostředí, infrastrukturu a technickou vybavenost ZHMP"})-[:PART_OF]->(zhmp)
MERGE (p:Person { name: line.Jméno})
MERGE (p)-[:MEMBER_OF {role: line.Funkce}]->(v)

// comment
LOAD CSV WITH HEADERS FROM "file:///Users/Daneeq/Dropbox/pirati/personalni_mapa/data/rada_praha.csv" AS line
MATCH (u:Person { name: line.Jméno})
MERGE (u)-[:MEMBER_OF {role: line.Funkce}]->(p)

