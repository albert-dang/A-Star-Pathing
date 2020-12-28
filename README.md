# Quickstart
A quick and dirty guide to get you integrated.  
You'll mostly be concerned with get_moveStack(). Calling this with a handful of arguments assigns a stack of waypoints to your given instance. This is full solution for pathfinding so that you only need to figure out:
- When you want to read in the next waypoint
- How you're getting to the x and y stored in that waypoint

Once you're ready to read in a waypoint, simply pop the stack and store that waypoint: 
`var = ds_stack_pop(moveStack)` 

## get_moveStack()
This function initializes the pathfinding algorithm and assigns a stack of waypoints to a given instance.

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
  - rowGoto = destination row  
      - You can use get_grid(x) and get_grid(y) from this library to convert any x, y coordinate to a column and row, respectively
  - grid = ID of some mp_grid  
  - grid_originX = absolute x coordinate of origin of the grid  
  - grid_originY = absolute y coordinate of origin of the grid  
  - grid_cellWidth = width of columns in the grid  
  - grid_cellHeight = height of rows in the grid  
