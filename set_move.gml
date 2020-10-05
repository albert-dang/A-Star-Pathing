/*Reads grid column and row from current location and destination coordinates
Uses column and row pairs as inputs to return a path generated using the A* algorithm (ref. Google "A* pathing")*/
function set_move(pawn, moveX, moveY, grid, grid_originX, grid_originY, grid_hCells, grid_vCells, grid_cellWidth, grid_cellHeight)
{
	#region Get calibrated inputs
	/*This is an efficient method to ensure consistent alignment with the grid
	For example, regardless of where the player right-clicks precisely within a grid space,
	the pawn will be sent to the middle (or otherwise "exact coordinate") of the grid space*/
	pawnCol = getGrid(pawn.x, grid_originX, grid_cellWidth) //Get pawn's column
	pawnRow = getGrid(pawn.y - 1, grid_originY, grid_cellHeight) //Get pawn's row (offsetting by 1 pixel north)
	moveCol = getGrid(moveX, grid_originX, grid_cellWidth) //Get corrected destination column
	moveRow = getGrid(moveY, grid_originY, grid_cellHeight) //Get corrected destination row
	#endregion
	
	#region Clean up old moveStack (memory patch)
	/*If we just trash the reference to each data structure, 
	i.e. by creating a new node on the same reference or clearing this stack,
	the node(s) will continue to exist until the game is closed
	In a long enough runtime, the game may run out of memory and crash*/
	if !ds_stack_empty(pawn.moveStack) //If moveStack still contains nodes
	{
		i = ds_stack_pop(pawn.moveStack) //Pop the stack
		ds_map_destroy(i) //Destroy unnecessary node
	}
	ds_stack_destroy(pawn.moveStack) //Destroy old moveStack
	#endregion
	
	//Get a ds_list of ds_maps representing nodes
	pawn.moveStack = get_moveStack(pawnCol, pawnRow, moveCol, moveRow, grid, grid_originX, grid_originY, grid_hCells, grid_vCells, grid_cellWidth, grid_cellHeight)
}