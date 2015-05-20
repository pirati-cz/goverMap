Examples of workflows:

MATCH - matches a pattern, needs to be followed by RETURN
LIMIT - limits the number of results if there is a large number

Find all relationships of a person:

	MATCH (a:Person)-[r]->(b)
	RETURN a,r


Find all memberships of a person:

	MATCH (a:Person)-[r:MEMBER_OF]->(b)
	RETURN a,r