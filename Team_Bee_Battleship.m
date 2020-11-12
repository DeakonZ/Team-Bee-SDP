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