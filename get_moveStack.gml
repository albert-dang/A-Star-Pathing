/*Return a ds_list of ds_maps representing nodes
Each node or ds_map contains two keys (ref. Google "ds_map docs2"):
"moveX" is the calibrated x coordinate for a grid
"moveY" is the calibrated y coordinate for the same grid
The nodes are in chronological order, such that 
the first node (0) is the pawn's current grid
the second node (1) is an adjacent grid, one grid space closer to the destination
and the last node (n) is the destination grid*/
function get_moveStack(pawnCol, pawnRow, moveCol, moveRow, grid, grid_originX, grid_originY, grid_hCells, grid_vCells, grid_cellWidth, grid_cellHeight)
{
	unchecked = ds_priority_create() //Initiate a priority queue to track unchecked nodes based on a value, i.e. fScore
	
	checked = ds_list_create() //Create a ds_list to track checked nodes
	
	current = create_node(pawnCol, pawnRow, moveCol, moveRow, 0, grid, pointer_null) //Initiate current node representing current grid
	i = current[? "fScore"]
	ds_priority_add(unchecked, current, i) //Add current node to priority queue
	
	while !ds_priority_empty(unchecked) //While there are still unchecked nodes, continue the following
	{
		/*Pulls the unchecked node with the lowest fScore
		A lower fScore is desirable because it represents the highest probability of being the most efficient option*/
		current = ds_priority_find_min(unchecked) //Set current to unchecked node with lowest fScore
		ds_priority_delete_min(unchecked) //Remove current node from unchecked
		ds_list_add(checked, current) //Add current node to list of checked nodes
		
		if current[? "col"] == moveCol and current[? "row"] == moveRow //Node is the destination grid
		{
			#region Priority queue cleanup (memory)
			while !ds_priority_empty(unchecked) //While the priority queue is not empty
			{
				ds_priority_delete_min(unchecked) //Delete node (can be any, really)
			}
			ds_priority_destroy(unchecked) //Destroy unnecessary ds_list
			#endregion
			
			//Get list of (moveX, moveY) nodes from inheritance and clean up checked list
			moveStack = get_moveReconstruction(current, checked, grid_originX, grid_originY, grid_cellWidth, grid_cellHeight)
				
			return moveStack
		}
		
		//Generates and places valid neighbouring nodes into unchecked list
		create_neighbours(unchecked, current, moveCol, moveRow, grid)
	}
	show_message("ERROR: FAILED TO FIND A PATH")
	return false //Failed to find a path
}