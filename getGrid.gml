//Returns grid column/row given x/y
function getGrid(pos, origin, cellSize){
	colrow = floor((pos - origin)/cellSize)
	return colrow
}
