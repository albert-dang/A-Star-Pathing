/*Creates a node with given settings
A node is simply a ds_map representing a grid space*/
function create_node(col, row, goalCol, goalRow, gScore, grid, parent)
{
	node = ds_map_create() //Initialize current node
	ds_map_add(node, "col", col) //Node's column
	ds_map_add(node, "row", row) //Node's row
	ds_map_add(node, "gScore", gScore) //gScore = distance from start
	//hScore = heuristic distance from goal, i.e. pythagorean theorem which is what the built-in point_distance function does
	h = point_distance(col, row, goalCol, goalRow) //Calculate hScore
	ds_map_add(node, "hScore", h) //Add hScore key to node
	f = node[? "gScore"] + node[? "hScore"] //Calculate fScore = gScore + hScore
	ds_map_add(node, "fScore", f) //Lowest fScore is the best (most efficient) option for algorithm
	isEmpty = mp_grid_get_cell(grid, col, row) //Returns -1 if grid space is occupied, 0 if empty
	ds_map_add(node, "mp_grid", isEmpty) //Add mp_grid key to node
	ds_map_add(node, "parent", parent) //Node that created this node, i.e. null for starting node
	return node
}