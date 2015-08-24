
goverMap
========


Software pro mapování (klientelistických) vazeb ve veřejném sektoru. 


Analýza konkurence
------------------

[NFPK][] využívá [IBM analysts][ibm] napojen na databázi [Bisnode Magnusweb][bisnode].


Technicky
---------

Jádro aplikace bude grafová databáze [neo4j][]. DB běží v [Dockeru][docker] pro snadné nasazení, správu a migraci.

Okolo toho vytvoříme ekosystém drobných aplikací (sktiptů) pro analýzu a zadávání dat.



Ukázky
------

Celkový pohled, de facto ukázka možností DB.
Samozřejmě takto obecný dotaz je již z podstaty věci nepřehledný.

```cypher
MATCH (n) RETURN n LIMIT 150
```

Doraz vrátí všechny uzly, nejvýše však 150.

![ZHMP][zhmpgraf]


Členové RHMP:

```cypher
MATCH (p:Person),(o:Organ {name: "Rada Hl. M. Prahy"}) WHERE p-->o RETURN p,o
```

![RHMP graph][rhmpgraf]

A druhý typ zobrazení:

![ZHMP graph][rhmplist]

Popřípadě najdeme členy *finančního výboru*, kteří jsou zároveň členy *zastupitelstva*:

```
MATCH (p:Person),(v:Organ {name: "Výbor finanční ZHMP"}),(z:Institution {name: "Zastupitelstvo Hl. M. Prahy"}) WHERE p-->v AND p-->z RETURN p,v
```

![členi finančního výboru, kteří jsou zároveň členy zastupitelstva][fv+zhmp]

a členy *finančního výboru*, kteří zároveň **nejsou** členy *zastupitelstva*:

```
MATCH (p:Person),(v:Organ {name: "Výbor finanční ZHMP"}),(z:Institution {name: "Zastupitelstvo Hl. M. Prahy"}) WHERE p-->v AND NOT p-->z RETURN p,v
```

![členi finančního výboru, kteří nejsou členy zastupitelstva][fv-zhmp]

### Skripty

Pro snadnou a rychlou práci vytváříme sadu skriptů, která usnadní běžné use cases:

```
goverm find "DPP a. s."
```

Instalace
---------

Instrukce jsou v [samostatném souboru](install.md).


Roadmap
-------

1. Vytvořit [schéma](schema.md) (ontologii)
2. Ukázková [workflow](workflow.md) (best practise)
3. Uživatelsky přívětivé rozhraní (sada skriptů, návodů, webová rozhraní).
4. Agilně vylepšovat

Vše je evidováno v rámci [issues](https://github.com/pirati-cz/goverMap/issues)


[rhmplist]: files/rhmp-list.png
[rhmpgraf]: files/rhmp-graph.png
[zhmpgraf]: files/zhmp-graph.png
[fv-zhmp]: files/fv-zhmp.png
[fv+zhmp]: files/fv+zhmp.png
[neo4j]: https://github.com/neo4j/neo4j
[docker]: https://www.docker.com/
[bisnode]: http://www.bisnode.cz/produkt/magnusweb/
[nfpk]: http://www.nfpk.cz
[ibm]: http://www-03.ibm.com/software/products/en/analysts-notebook
