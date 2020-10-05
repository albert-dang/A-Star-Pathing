/*Constructs a path by retracing node parents
Returns the path in the form of a list of nodes in chronological order, such that
the first entry is the first node that was created, i.e. representing the pawn's grid
and the last entry is the node representing destination grid
Where each node is a ds_map with (2) keys:
"moveX" which tells the pawn the next x coordinate
"moveY" which tells the pawn the next y coordinate*/
function get_moveReconstruction(current, checked, grid_originX, grid_originY, grid_cellWidth, grid_cellHeight)
{
	#region Initialize runtime structures
	moveStack = ds_stack_create() //Initialize ds_stack to hold ds_maps

	node = ds_map_create() //Initialize ds_map as temporary node
	col = current[? "col"] //Get current (destination) node's grid column
	row = current[? "row"] //Get current  (destination) node's grid row
	realX = getGridRealX(col, grid_originX, grid_cellWidth) //Convert column to x value
	realY = getGridRealY(row, grid_originY, grid_cellHeight) //Convert row to y value
	parent = current[? "parent"] //Get current (destination) node's parent
	ds_map_add(node, "moveX", realX) //Add moveX key for temp (destination) node
	ds_map_add(node, "moveY", realY) //Add moveY key for temp (destination) node
	ds_stack_push(moveStack, node) //Add temp node to moveList
	
	i = ds_list_find_index(checked, current) //Find node's entry in checked nodes
	ds_map_destroy(current) //Destroy unnecessary node
	ds_list_delete(checked, i) //Remove entry from checked nodes
	#endregion
	
	#region //Populate moveStack
	while parent != pointer_null //While node is not the Root node
	{
		i = parent //Temporarily store parent
		col = i[? "col"] //Get stored node's grid column
		row = i[? "row"] //Get stored node's grid row
		parent = i[? "parent"] //Get stored node's parent
		j = ds_list_find_index(checked, i) //Find unnecessary node's entry in checked nodes
		ds_map_destroy(i) //Destroy unnecessary node
		ds_list_delete(checked, j) //Remove entry from checked nodes
		
		node = ds_map_create() //Initialize ds_map as temporary node
		realX = getGridRealX(col, grid_originX, grid_cellWidth) //Convert column to x value
		realY = getGridRealY(row, grid_originY, grid_cellHeight) //Convert row to y value
		ds_map_add(node, "moveX", realX) //Add moveX key for temp node
		ds_map_add(node, "moveY", realY) //Add moveY key for temp node
		ds_map_add(node, "parent", parent) //Add parent key for temp node
		ds_stack_push(moveStack, node) //Add temp node to moveList
	}
	#endregion
	
	#region //Clean up ds_list checked
	while !ds_list_empty(checked) //While there are nodes in checked nodes
	{
		ds_map_destroy(checked[| 0]) //Destroy the first node in checked nodes
		ds_list_delete(checked, 0) //Remove entry from checked nodes
	}
	ds_list_destroy(checked) //Destroy ds_list checked
	#endregion
	
	return moveStack //Return reconstructed path
}