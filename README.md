# A-Star-Pathing
A quick and dirty readme to get you integrated.

## get_moveStack()
This function initializes the algorithm to find a path to a given x, y. The function returns a ds_stack of ds_maps (nodes).  

Each node contains two keys:  
"moveX" is the absolute x coordinate for some grid  
"moveY" is the absolute y coordinate for the same grid  

The nodes are in order, such that:  
the first node i = 0 is the pawn's current grid  
the next node i + 1 is an adjacent grid space, one column OR row closer to the destination  
the last node n is the destination grid  

Arguments:  
col = starting column  
row = starting row  
colGoto = destination column  
rowGoto = destination row  
grid = ID of some mp_grid  
grid_originX = absolute x coordinate of origin of the grid  
grid_originY = absolute y coordinate of origin of the grid  
grid_cellWidth = width of columns in the grid  
grid_cellHeight = height of rows in the grid  
