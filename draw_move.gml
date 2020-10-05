//Work in progress function for drawing path
function draw_move(drawMoveStack)
{
	while !ds_stack_empty(drawMoveStack) //While there are nodes in drawMoveStack
	{
		node = ds_stack_pop(drawMoveStack) //Store first node
		nodeX = node[? "moveX"]
		nodeY = node[? "moveY"]
		if !ds_stack_empty(drawMoveStack)
		{
			nextNode = ds_stack_top(drawMoveStack)
			nextX = nextNode[? "moveX"]
			nextY = nextNode[? "moveY"]
			draw_line_width_color(nodeX+64, nodeY-32, nextX+64, nextY-32, 8, c_aqua, c_olive)
		}
	}
}