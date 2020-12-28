/*Returns the absolute x/y for the middle of a given col/row

Arguments:
grid = the column or row
grid_origin = the leftmost absolute x or topmost absolute y of the grid
grid_size = the width or height of each cell*/

function get_gridAbs(grid, grid_origin, grid_size){
	return grid_origin + (grid + 0.5)*grid_size
}