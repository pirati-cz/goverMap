# goverMap

## Cíl

Vytvořit software pro mapování (klientelistických) vazeb ve veřejném sektoru.

## Analýza konkurence

[NFPK](http://www.nfpk.cz) využívá [IBM analysts]() napojen na [Bisnode Magnusweb](http://www.bisnode.cz/produkt/magnusweb/).

IBM analysts

## Technicky

Jádro aplikace bude grafová databáze [neo4j](https://github.com/neo4j/neo4j).
Okolo toho vytvoříme ekosystém drobných aplikací pro analýzu a zadávání dat.

## Roadmap

1. Vytvořit [schéma](schema.md) (ontologii)
1. Ukázková [workflow](workflow.md)
1. Uživatelsky přívětivé rozhraní

### TODO

- nasadit na server - OP
- upravit data ohledně městských firem - OP
- sada skriptů v Pythonu na filtraci csv
  - ořezávání titulů - DR
  - doplnění bilých míst - DR
- workflows - DR
- schema - DR 
- docker na Macu - DR

An interactive graph representation of the links in Czech politics. Work in progess.

