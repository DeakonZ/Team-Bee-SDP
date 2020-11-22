clc
clear

%Team Bee Battleship Script
%Written by Parker Stuebs, Caleb Bucher, Varsha Govardhanam, Deakon Ziegler

%%Base Board Creation

%Initialize scene
battleship_scene = simpleGameEngine('Battleship.png', 84, 84);

%Declaration of sprite variables with numerical values.
blank_sprite = 1;
water_sprite = 2;
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;
hit_sprite = 9;
miss_sprite = 10;

%Draw base board.
board_display = water_sprite * ones(10, 21);
board_display(:, 11) = blank_sprite;
drawScene(battleship_scene, board_display)
ship_matrix = ones(10,10);

%build the first ship
vertical = 0;
ship_complete = 0;
finished_matrix = build_ship(battleship_scene,5,ship_matrix);
%these nested loops take the function outputted matrix and uses it to change the board matrix to show the ships
for i = 1:10
   for j = 1:10
      if finished_matrix(i,j) == 5
         if finished_matrix(i+1,j) == finished_matrix(i,j)
             vertical = 1;
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
drawScene(battleship_scene,board_display)

%build ship 2
finished_matrix = build_ship(battleship_scene,4,finished_matrix);
vertical = 0;
ship_complete = 0;
for i = 1:10
   for j = 1:10
      if finished_matrix(i,j) == 4
         if finished_matrix(i+1,j) == finished_matrix(i,j)
             vertical = 1;
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
drawScene(battleship_scene,board_display)

%build ship 3
vertical = 0;
ship_complete = 0;
finished_matrix = build_ship(battleship_scene,3,ship_matrix);
for i = 1:10
   for j = 1:10
      if finished_matrix(i,j) == 3
         if finished_matrix(i+1,j) == finished_matrix(i,j)
             vertical = 1;
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
drawScene(battleship_scene,board_display)

%build ship 4
vertical = 0;
ship_complete = 0;
finished_matrix = build_ship(battleship_scene,3,ship_matrix);
for i = 1:10
   for j = 1:10
      if finished_matrix(i,j) == 3
         if finished_matrix(i+1,j) == finished_matrix(i,j)
             vertical = 1;
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
drawScene(battleship_scene,board_display)



vertical = 0;
ship_complete = 0;
finished_matrix = build_ship(battleship_scene,2,ship_matrix);
for i = 1:10
   for j = 1:10
      if finished_matrix(i,j) == 2
         if finished_matrix(i+1,j) == finished_matrix(i,j)
             vertical = 1;
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
drawScene(battleship_scene,board_display)

