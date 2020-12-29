# Quickstart
The algorithm is designed for a 2-dimensional grid where obstacles are mapped to rectangular cells. Your smallest collidable object will occupy one cell. Movement is 4-directional for quick implementation but is easily converted to 8-directional by expanding on `moveStack_neighbours()`. The purpose of this format is to allow us to respect the orthogonal (graphic) representation of the game while facilitating movement and dynamic pathfinding on a different 2-dimensional plane.

With `get_moveStack()`, we can assign a stack of waypoints to a given instance. We only need to figure out:  
- When we want to read in the next waypoint  
- How we're getting to the x and y stored in that waypoint  
  
Once we're ready to read in a waypoint, simply pop the moveStack assigned to a given instance:  
- `waypoint = ds_stack_pop(moveStack)`  

Then access the x and y keys:  
- `xNext = waypoint[? moveX]`  
- `yNext = waypoint[? moveY]`  

## `get_moveStack()`  
Initializes the pathfinding algorithm and assigns a stack of waypoints to a given instance.  
  
### Arguments:  
- col (int)  
  - The relative starting column of the instance we're moving. `col = 0` would mean starting in the leftmost column of our moving grid. We can use `get_grid(instance.x)` to quickly get a relative column.
  
- row (int)  
  - The relative starting row of the instance we're moving. `row = 0` would mean starting in the topmost row of our moving grid. We can use `get_grid(instance.y)` to quickly get a relative row.  
  
- colGoto (int)  
  - The relative row of the distination. `colGoto = 0` would be the leftmost column considered by the pathfinder. We can use `get_grid(x)` from this library to convert any x to a relative column. For example, we can easily assign a column with the mouse simply using `get_grid(mouse_x)` to figure out the relative column for us.  
  
- rowGoto (int)  
   - The relative row of the distination. `rowGoto = 0` would be the topmost row considered by the pathfinder. We can use `get_grid(y)` from this library to convert any y to a relative row. For example, we can easily assign a row for following another instance simply using `get_grid(ally.y)` to figure out the relative row for us.  
  
- grid (mp_grid)  
  - ID of some mp_grid  
    
- grid_originX = absolute x coordinate of origin of the grid  
- grid_originY = absolute y coordinate of origin of the grid  
    - Allows for dynamic pathfinding and optimizing memory  
- grid_cellWidth = width of columns in the grid  
- grid_cellHeight = height of rows in the grid  
