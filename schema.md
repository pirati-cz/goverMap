
# Schema

## Nodes

- Institution (including companies)
- Organ
- Person

## Edges

- CONNECTION (Person->Person)
- OWNS (Person->Institution)
- MEMBER_OF (Person->Organ)
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

## Properties

### Person
- name
- contact

### Institution

- type: firma, prispevkovka, ver. korporace
- ico (unique)
- address


