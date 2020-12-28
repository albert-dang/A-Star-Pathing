# Quickstart
A quick and dirty guide to get you integrated. You'll mostly be concerned with get_moveStack(). Calling this assigns a stack of waypoints to your given instance. This is a full solution for pathfinding so that you only need to figure out:
- When you want to read in the next waypoint
- How you're getting to the x and y stored in that waypoint

Once you're ready to read in a waypoint, simply pop the moveStack assigned to your given instance:  
- `waypoint = ds_stack_pop(moveStack)` 

Then access the x and y keys:  
- `xNext = waypoint[! moveX]`  
- `yNext = waypoint[! moveY]`  

## get_moveStack()
This function initializes the pathfinding algorithm and assigns a stack of waypoints to a given instance.

- Arguments:  
  - col = starting column  
  - row = starting row  
  - colGoto = destination column  
  - rowGoto = destination row  
      - You can use get_grid(x) and get_grid(y) from this library to convert any x, y coordinate to a column and row, respectively
  - grid = ID of some mp_grid  
  - grid_originX = absolute x coordinate of origin of the grid  
  - grid_originY = absolute y coordinate of origin of the grid
      - This allows for dynamic pathfinding and optimizing memory
  - grid_cellWidth = width of columns in the grid  
  - grid_cellHeight = height of rows in the grid  
