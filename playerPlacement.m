function [board_display, finished_matrix] = playerPlacement(obj, board_display, ship_matrix)
%PLAYERPLACEMENT Prompts the player to choose the locations of ships on the board.

%Declaration of ship sprite variables with numerical values.
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;

%build the first ship
vertical = 0;
ship_complete = 0;
finished_matrix = build_ship(obj,5,ship_matrix);
%these nested loops take the function outputted matrix and uses it to change the board matrix to show the ships
for i = 1:10
   for j = 1:10
      if finished_matrix(i,j) == 5
         if i ~= 10
             if finished_matrix(i+1,j) == finished_matrix(i,j)
                 vertical = 1;
             end
         end
         if vertical == 1
             board_display(i,j) = top_ship_sprite;
             board_display(i+1,j) = vert_ship_sprite;
             board_display(i+2,j) = vert_ship_sprite;
             board_display(i+3,j) = vert_ship_sprite;
             board_display(i+4,j) = bot_ship_sprite;
             ship_complete = 1;
         else
             board_display(i,j) = left_ship_sprite;
             board_display(i,j+1) = horiz_ship_sprite;
             board_display(i,j+2) = horiz_ship_sprite;
             board_display(i,j+3) = horiz_ship_sprite;
             board_display(i,j+4) = right_ship_sprite;
             ship_complete = 1;
         end
      end
      if(ship_complete == 1)
          break
      end
   end
   if (ship_complete ==1)
       break
   end
end
drawScene(obj,board_display)

%build ship 2
finished_matrix = build_ship(obj,4,finished_matrix);
vertical = 0;
ship_complete = 0;
for i = 1:10
   for j = 1:10
      if finished_matrix(i,j) == 4
         if i ~= 10
             if finished_matrix(i+1,j) == finished_matrix(i,j)
                 vertical = 1;
             end
         end
         if vertical == 1
             board_display(i,j) = top_ship_sprite;
             board_display(i+1,j) = vert_ship_sprite;
             board_display(i+2,j) = vert_ship_sprite;
             board_display(i+3,j) = bot_ship_sprite;
             ship_complete = 1;
         else
             board_display(i,j) = left_ship_sprite;
             board_display(i,j+1) = horiz_ship_sprite;
             board_display(i,j+2) = horiz_ship_sprite;
             board_display(i,j+3) = right_ship_sprite;
             ship_complete = 1;
         end
      end
      if(ship_complete == 1)
          break
      end
   end
   if (ship_complete ==1)
       break
   end
end
drawScene(obj,board_display)

%build ship 3
vertical = 0;
ship_complete = 0;
finished_matrix = build_ship(obj,3,finished_matrix);
for i = 1:10
   for j = 1:10
      if finished_matrix(i,j) == 3
         if i ~= 10
             if finished_matrix(i+1,j) == finished_matrix(i,j)
                 vertical = 1;
             end
         end
         if vertical == 1
             board_display(i,j) = top_ship_sprite;
             board_display(i+1,j) = vert_ship_sprite;
             board_display(i+2,j) = bot_ship_sprite;
             ship_complete = 1;
         else
             board_display(i,j) = left_ship_sprite;
             board_display(i,j+1) = horiz_ship_sprite;
             board_display(i,j+2) = right_ship_sprite;
             ship_complete = 1;
         end
      end
      if(ship_complete == 1)
          break
      end
   end
   if (ship_complete ==1)
       break
   end
end
drawScene(obj,board_display)

%build ship 4
vertical = 0;
ship_complete = 0;
finished_matrix = build_ship(obj,3,finished_matrix);
for i = 1:10
   for j = 1:10
      if finished_matrix(i,j) == 3
         if i ~= 10
             if finished_matrix(i+1,j) == finished_matrix(i,j)
                 vertical = 1;
             end
         end
         if vertical == 1
             board_display(i,j) = top_ship_sprite;
             board_display(i+1,j) = vert_ship_sprite;
             board_display(i+2,j) = bot_ship_sprite;
             ship_complete = 1;
         else
             board_display(i,j) = left_ship_sprite;
             board_display(i,j+1) = horiz_ship_sprite;
             board_display(i,j+2) = right_ship_sprite;
             ship_complete = 1;
         end
      end
      if(ship_complete == 1)
          break
      end
   end
   if (ship_complete ==1)
       break
   end
end
drawScene(obj,board_display)



vertical = 0;
ship_complete = 0;
finished_matrix = build_ship(obj,2,finished_matrix);
for i = 1:10
   for j = 1:10
      if finished_matrix(i,j) == 2
         if i ~= 10
             if finished_matrix(i+1,j) == finished_matrix(i,j)
                 vertical = 1;
             end
         end
         if vertical == 1
             board_display(i,j) = top_ship_sprite;
             board_display(i+1,j) = bot_ship_sprite;
             ship_complete = 1;
         else
             board_display(i,j) = left_ship_sprite;
             board_display(i,j+1) = right_ship_sprite;
             ship_complete = 1;
         end
      end
      if(ship_complete == 1)
          break
      end
   end
   if (ship_complete ==1)
       break
   end
end

drawScene(obj,board_display)

end %End Function

