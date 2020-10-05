//Create iing nodes for given node and return them in a ds_list
function create_neighbours(unchecked, current, moveCol, moveRow, mp_grid)
{
	#region Initialize i east of current, i.e. (col, row) = (col + 1, row)
	neighbourCol = current[? "col"] + 1 //Set column to 1 right of given node
	neighbourRow = current[? "row"] //Set row to same as given node
	gScore = current[? "gScore"] + 1 //gScore = distance from start = given node's gScore + 1
	neighbour = create_node(neighbourCol, neighbourRow, moveCol, moveRow, gScore, mp_grid, current) //Initialize temporary i node
	
	if neighbour[? "mp_grid"] == 0 //if the node's grid space is empty
	{
		ds_priority_add(unchecked, neighbour, neighbour[? "fScore"]) //Add node to list of unchecked nodes
	}
	else
	{
		ds_map_destroy(neighbour) //Destroy unnecessary node
	}
	#endregion
	
	#region Initialize i south of current, i.e. (col, row) = (col, row + 1)
	neighbourCol = current[? "col"] //Same col as current node
	neighbourRow = current[? "row"] + 1 //Below current node
	gScore = current[? "gScore"] + 1 //gScore = distance from start = current gScore + 1
	neighbour = create_node(neighbourCol, neighbourRow, moveCol, moveRow, gScore, mp_grid, current) //Initialize temporary i node
	
	if neighbour[? "mp_grid"] == 0 //if the node's grid space is empty
	{
		ds_priority_add(unchecked, neighbour, neighbour[? "fScore"]) //Add node to list of unchecked nodes
	}
	else
	{
		ds_map_destroy(neighbour) //Destroy unnecessary node
	}
	#endregion
	
	#region Initialize i west of current, i.e. (col, row) = (col - 1, row)
	neighbourCol = current[? "col"] - 1 //To the left of current node
	neighbourRow = current[? "row"] //Same row as current node
	gScore = current[? "gScore"] + 1 //gScore = distance from start = current gScore + 1
	neighbour = create_node(neighbourCol, neighbourRow, moveCol, moveRow, gScore, mp_grid, current) //Initialize temporary i node
	
	if neighbour[? "mp_grid"] == 0 //if the node's grid space is empty
	{
		ds_priority_add(unchecked, neighbour, neighbour[? "fScore"]) //Add node to list of unchecked nodes
	}
	else
	{
		ds_map_destroy(neighbour) //Destroy unnecessary node
	}
	#endregion
	
	#region Initialize i north of current, i.e. (col, row) = (col, row - 1)
	neighbourCol = current[? "col"] //Same col as current node
	neighbourRow = current[? "row"] - 1 //Above current row
	gScore = current[? "gScore"] + 1 //gScore = distance from start = current gScore + 1
	neighbour = create_node(neighbourCol, neighbourRow, moveCol, moveRow, gScore, 0, current) //Initialize temporary i node
	
	if neighbour[? "mp_grid"] == 0 //If the node's grid space is empty
	{
		ds_priority_add(unchecked, neighbour, neighbour[? "fScore"]) //Add node to list of unchecked nodes
	}
	else
	{
		ds_map_destroy(neighbour) //Destroy unnecessary node
	}
	#endregion
}