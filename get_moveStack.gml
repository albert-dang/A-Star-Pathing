/*Returns a ds_stack (moveStack) of ds_maps (nodes)

Each node contains two keys:
"moveX" is the absolute x coordinate for some grid
"moveY" is the absolute y coordinate for the same grid

The nodes are in order, such that:
the first node [i = 0] is the pawn's current grid
the next node [i + 1] is an adjacent grid space, one column OR row closer to the destination
the last node [n] is the destination grid

Arguments:
col = starting column
row = starting row
colGoto = destination column
rowGoto = destination row
grid = ID of some mp_grid
grid_originX = absolute x coordinate of origin of the grid
grid_originY = absolute y coordinate of origin of the grid
grid_cellWidth = width of columns in the grid
grid_cellHeight = height of rows in the grid*/

function get_moveStack(col, row, colGoto, rowGoto, mp_grid, grid_originX, grid_originY, grid_cellWidth, grid_cellHeight)
{
	//Initialize priority queue for unchecked nodes
	unchecked = ds_priority_create() 
	
	//Initialize list of checked nodes
	checked = ds_list_create()
	
	//Initialize current node and assign starting node
	current = moveStack_createNode(col, row, colGoto, rowGoto, 0, mp_grid, pointer_null)
	
	//Add current node to unchecked nodes
	ds_priority_add(unchecked, current, current[? "fScore"])
	
	//While there are still unchecked nodes
	while !ds_priority_empty(unchecked){
		
		//Set current to unchecked node with the lowest fScore
		current = ds_priority_find_min(unchecked)
		
		//Remove current node from unchecked nodes
		ds_priority_delete_min(unchecked)
		
		//Add current node to checked nodes
		ds_list_add(checked, current)
		
		//If current node is the destination node
		if current[? "col"] == colGoto and current[? "row"] == rowGoto{
			
			
			#region Unchecked priority queue garbage collection
			//While the priority queue is not empty
			while !ds_priority_empty(unchecked) {
				//Delete node with the lowest priority
				ds_priority_delete_min(unchecked)
			}
			//Destroy the priority queue
			ds_priority_destroy(unchecked)
			#endregion
			
			//Return a moveStack from reconstruction
			return moveStack_reconstruct(current, checked, grid_originX, grid_originY, grid_cellWidth, grid_cellHeight)
		}
		
		//Generates and places neighbouring nodes into unchecked list
		moveStack_neighbours(unchecked, current, colGoto, rowGoto, mp_grid)
	}
	//There is no path to your destination (complete obstruction)
	show_message("ERROR: FAILED TO FIND A PATH")
	return false
}