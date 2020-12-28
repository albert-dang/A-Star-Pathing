/*Create neighbouring nodes for current and add them to unchecked priority queue if not occupied

i = iterator; switches between 1 and -1 to represent offset
gScore = distance from the start = parent node's gScore + 1
col = neighbour's column
row = neighbour's row

Arguments:
unchecked = priority queue of unchecked nodes
current = node to generate neighbours for
colGoto = destination column
rowGoto = destination row
mp_grid = ID of the mp_grid*/

function moveStack_neighbours(unchecked, current, colGoto, rowGoto, mp_grid)
{
	//Initialize iterator
	i = 1
	
	//Do the following twice
	repeat (2){
		//Flip iterator
		i = -i
		
		gScore = current[? "gScore"]
		
		#region Initialize horizontal neighbour
		col = current[? "col"] + i
		row = current[? "row"]
		//Create neighbour
		neighbour = moveStack_createNode(col, row, colGoto, rowGoto, gScore, mp_grid, current)
		
		//If neighbour's grid space is empty
		if neighbour[? "mp_grid"] == 0
			//Add node to list of unchecked nodes
			ds_priority_add(unchecked, neighbour, neighbour[? "fScore"])
		//Destroy the node if it's not empty
		else
			ds_map_destroy(neighbour)
		#endregion
		
		#region Initialize vertical neighbour
		col = current[? "col"]
		row = current[? "row"] + i
		//Create neighbour
		neighbour = moveStack_createNode(col, row, colGoto, rowGoto, gScore, mp_grid, current)
		
		//If the neighbour's grid space is empty
		if neighbour[? "mp_grid"] == 0
			//Add node to list of unchecked nodes
			ds_priority_add(unchecked, neighbour, neighbour[? "fScore"])
		//Destroy the node if it's not empty
		else
			ds_map_destroy(neighbour)
		#endregion
	}
}