//Returns the leftmost x of the given column
function getGridRealX(col, grid_originX, grid_cellWidth)
{
	realX = grid_originX + col*grid_cellWidth
	return realX
}