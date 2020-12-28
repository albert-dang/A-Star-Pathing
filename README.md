# A-Star-Pathing
A quick and dirty readme to get you integrated.

## get_moveStack()
This function initializes the pathfinding algorithm and returns a stack of waypoints.

- Each waypoint contains two keys/values:  
  - "moveX" is the absolute x coordinate for some grid  
  - "moveY" is the absolute y coordinate for the same grid

- The waypoints are in order, such that:  
  - the top of the stack i = 0 is the pawn's current grid  
  - the next waypoint i + 1 is an adjacent grid space, one column OR row closer to the destination  
  - the bottom of the stack n is the destination grid  

- Arguments:  
  - col = starting column  
  - row = starting row  
  - colGoto = destination column  
  - You can use get_grid(x) and get_grid(y) from this library to convert any x, y coordinate to 
rowGoto = destination row  
grid = ID of some mp_grid  
grid_originX = absolute x coordinate of origin of the grid  
grid_originY = absolute y coordinate of origin of the grid  
grid_cellWidth = width of columns in the grid  
grid_cellHeight = height of rows in the grid  
