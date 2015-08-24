# Instalace neo4j serveru lokálně (Mac)

## Docker

V první řadě je potřeba zprovoznit Docker, který umožňuje spustit Neo4j v kontrolovaném, izolovaném prostředí.
Návod k instalace je [zde](https://docs.docker.com/installation/mac/). Otestuje všechny skripty, včetně Exercises - klíčový je především poznatek, že pro přístup přes prohlížeč potřebujete zadat IP adresu boot2dockeru, nikoli localhost, jak je to mu u Linuxové verze.

## Neo4j

Funguje-li Docker podle plánu, je načase spustit container s neo4j. Stačí k tomu pár příkazů v terminálu, návod je [tady](https://github.com/tpires/neo4j). Databáze je následně k dipozici v prohlížeči na adrese http://(ip_boot2docker):7474, kde místo závorky doplníte IP adresu boot2dockeru, zjistitelnou pomocí `boot2docker ip` v terminálu.