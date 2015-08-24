
goverMap
========

En: An interactive graph representation of the links in Czech politics. Work in progess.



Cíl
---

Vytvořit software pro mapování (klientelistických) vazeb ve veřejném sektoru. 



Analýza konkurence
------------------

[NFPK][] využívá [IBM analysts][ibm] napojen na databázi [Bisnode Magnusweb][bisnode].

IBM analysts



Technicky
---------

Jádro aplikace bude grafová databáze [neo4j][]. DB běží v [Dockeru][docker] pro snadné nasazení, správu a migraci.

Okolo toho vytvoříme ekosystém drobných aplikací (sktiptů) pro analýzu a zadávání dat.



Ukázky
------

### Celkový pohled

Celkový pohled, de facto ukázka možností DB.
Samozřejmě takto obecný dotaz je již z podstaty věci nepřehledný.

```cypher
MATCH (n) RETURN n LIMIT 150
```

Doraz vrátí všechny uzly, nejvýše však 150.

![ZHMP][zhmpgraf]


### Členové RHMP

```cypher
MATCH (p:Person),(o:Organ {name: "Rada Hl. M. Prahy"}) WHERE p-->o RETURN p,o
```

![RHMP graph][rhmpgraf]

A druhý typ zobrazení:

![ZHMP graph][rhmplist]


### Skripty

Pro snadnou a rychlou práci vytváříme sadu skriptů, která usnadní běžné use cases:

```
goverm find "DPP a. s."
```


Roadmap
-------

1. Vytvořit [schéma](schema.md) (ontologii)
1. Ukázková [workflow](workflow.md)
1. Uživatelsky přívětivé rozhraní (sada skriptů a návodů).


### TODO

- upravit data ohledně městských firem - OP
- časové určení vazby
- sada skriptů v Pythonu na filtraci csv
    - ořezávání titulů - DR
    - doplnění bilých míst - DR
    - vložení uzlu - DR
    - vložení vazby - DR


[rhmplist]: files/rhmp-list.png
[rhmpgraf]: files/rhmp-graph.png
[zhmpgraf]: files/zhmp-graph.png
[neo4j]: https://github.com/neo4j/neo4j
[docker]: https://www.docker.com/
[bisnode]: http://www.bisnode.cz/produkt/magnusweb/
[nfpk]: http://www.nfpk.cz
[ibm]: http://www-03.ibm.com/software/products/en/analysts-notebook
