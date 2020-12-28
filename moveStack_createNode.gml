/*Returns a ds_map representing a grid space; this is called a node. The map has the following keys:
col = the column of the node
row = the row of the node
gScore = distance from the initial node in terms of columns and rows moved
hScore = heuristic score based on pixel distance
fScore = estimated path length, gScore + hScore (i.e. smaller is better)
mp_grid = whether the grid is occupied (-1) or not (0)
parent = ID of node that generated this node

Arguments:
col = the column of the grid space
row = the row of the grid space
colGoto = the destination column
rowGoto = the destination row
gScore = gScore of parent; the distance from the initial node in terms of columns and rows moved
mp_grid = ID of mp_grid
parent = ID of node that generated this node*/

function moveStack_createNode(col, row, colGoto, rowGoto, gScore, mp_grid, parent){
	//Initialize current node
	node = ds_map_create()
	
	//Increment gScore from parent
	g = gScore + 1
	
	//Calculate hScore
	h = point_distance(col, row, colGoto, rowGoto)
	
	//Calculate fScore
	f = g + h
	
	//Returns -1 if grid space is occupied or off-grid, 0 if empty
	isEmpty = mp_grid_get_cell(mp_grid, col, row)
	
	//Assign keys
	ds_map_add(node, "col", col)
	ds_map_add(node, "row", row)
	ds_map_add(node, "fScore", f)
	ds_map_add(node, "gScore", g)
	ds_map_add(node, "hScore", h)
	ds_map_add(node, "mp_grid", isEmpty)
	ds_map_add(node, "parent", parent)
	
	return node
}