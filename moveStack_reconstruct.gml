/*Returns a ds_stack (moveStack) of nodes such that:
the top entry is the node representing the start
the bottom entry is the node representing the destination

Where each node is a ds_map with 2 keys:
moveX = the absolute x of the node
moveY = the absolute y of the node

Arguments:
goto = destination node
checked = all checked nodes
grid_originX = absolute x coordinate of origin of the grid
grid_originY = absolute y coordinate of origin of the grid
grid_cellWidth = width of columns in the grid
grid_cellHeight = height of rows in the grid*/

function moveStack_reconstruct(goto, checked, grid_originX, grid_originY, grid_cellWidth, grid_cellHeight)
{
	#region Initialize runtime structures
	moveStack = ds_stack_create() //Initialize moveStack
	current = ds_map_create() //Initialize current node
	absX = get_gridAbs(goto[? "col"], grid_originX, grid_cellWidth) //Convert column to absolute x
	absY = get_gridAbs(goto[? "row"], grid_originY, grid_cellHeight) //Convert row to absolute y
	parent = goto[? "parent"] //Get destination node's parent
	ds_map_add(current, "moveX", absX) //Add moveX key current node
	ds_map_add(current, "moveY", absY) //Add moveY key for current node
	ds_stack_push(moveStack, current) //Add current node to moveStack
	#endregion
	
	#region Retrace parents
	//While current node is not the pointer (the original node)
	while parent != pointer_null{
		current = parent //Load parent into current
		parent = current[? "parent"] //Load grandparent into parent
		absX = get_gridAbs(current[? "col"], grid_originX, grid_cellWidth) //Convert column to absolute x
		absY = get_gridAbs(current[? "row"], grid_originY, grid_cellHeight) //Convert row to absolute y
		ds_map_add(current, "moveX", absX) //Add moveX key for current node
		ds_map_add(current, "moveY", absY) //Add moveY key for current node
		ds_stack_push(moveStack, current) //Add current node to moveStack
		ds_list_delete(checked, ds_list_find_index(checked, current)) //Remove current node from checked nodes
	}
	#endregion
	
	#region //Checked list garbage collection
	//While there are nodes in checked nodes
	while !ds_list_empty(checked){
		ds_map_destroy(checked[| 0]) //Destroy the first node in checked nodes
		ds_list_delete(checked, 0) //Remove the first entry from checked nodes
	}
	ds_list_destroy(checked) //Destroy checked nodes
	#endregion

	return moveStack //Return reconstructed path
}