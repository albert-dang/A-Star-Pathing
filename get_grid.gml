/*Returns grid column/row given x/y

Arguments:
abs = absolute x or y
grid_origin = the leftmost absolute x or topmost absolute y of the grid
grid_size = the width or height of each cell*/

function get_grid(abs, grid_origin, grid_size){
	return floor((abs - grid_origin)/grid_size)
}