# A-Star-Pathing
By: Albert Dang

Code last updated: 4 OCT 2020

## Intro
This algorithm, written in GameMaker Language (GML) for GameMaker Studio 2, is a grid-based pathing solution for n*m rectangular grids. 
The GameMaker built-in motion planning functions are inadequate when working with complex geometry such as with a 2.5D game.
These scripts effectively replace the built-in mp_path functions. 
However, the algorithm ultimately outputs several sets of coordinates which represent grid spaces between two points.
Thus, the algorithm can be used for many purposes, i.e. drawing

## Variables
The following are variables as they appear in the base resource and what those variables do.

### Arguments

#### pawn
This is the ID of the object which we are moving. That object must have 3 readable variables:
1. Its x position
2. Its y position
3. A ds_stack, - "first in, last out" (FILO) data structure

#### moveX
This is the x coordinate where we are moving the object.
Note that this coordinate will be corrected such that it is not important to know the exact coordinate of our intended grid.
We are effectively inputting the same value for any moveX, where
>columnFirst_x <= moveX <= columnLast_x

#### moveY
This is the y coordinate where we are moving the object.
Note that this coordinate will be corrected such that it is not important to know the exact coordinate of our intended grid.
We are effectively inputting the same value for any moveY, where
>rowFirst_y <= moveY <= rowLast_y
