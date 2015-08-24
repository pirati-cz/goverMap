
# Schema

## Nodes and their properties

- Person
  - name
  - contact
- Institution (including companies)
  - name
  - type: firma, prispevkovka, ver. korporace
  - ico (unique)
  - address
- Organ
  - name

## Edges and their properties

- CONNECTION (Person->Person)
- OWNS (Person->Institution)
  - time period
- MEMBER_OF (Person->Organ)
  - time period
- PART_OF (Organ->Institution)


## Examples of nodes and edges

```
 # Zastupitelstvo hl. m. Prahy
 CREATE (zhmp:Institution {name: "Zastupitelstvo Hl. M. Prahy"})

 # Ondřej Profant jako člen zastupitelstva
 CREATE (op:Person {name: "Ondřej Profant", contact:"ondrej.profant@praha.eu"})
 CREATE (op)-[:MEMBER_OF {role: "člen"}]->(zhmp)

 # jako člen strany
 CREATE (p:Institution {name: "Piráti", type:"strana"})
 CREATE (op)-[:MEMBER_OF {role: "člen"}]->(p)

```



