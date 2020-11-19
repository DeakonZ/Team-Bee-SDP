clear
clc

%Team Bee Battleship Script
%Written by Parker Stuebs, Caleb Bucher, Varsha Govardhanam, Deakon Ziegler

%% Base Board Creation

%Initialize scene
battleshipScene = simpleGameEngine('Battleship.png', 84, 84);

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

%Declare and initalize the shot display.
shotDisplay = ones(10, 21);

%Draw base board.
boardDisplay = water_sprite * ones(10, 21);
boardDisplay(:, 11) = blank_sprite;
drawScene(battleshipScene, boardDisplay)

%% Game Logic

% Place a ship
% Place the left pointing end of the ship at position (2,3)
boardDisplay(2,3) = left_ship_sprite;

%Redraw the scene.
drawScene(battleshipScene,boardDisplay)

%Call the player shoot function and assign the output to the shot display.
shotDisplay = playerShoot(battleshipScene, boardDisplay, shotDisplay);

%Redraw the scene.
drawScene(battleshipScene, boardDisplay, shotDisplay)

m = ones(10, 10)

s = checkSunk(battleshipScene, shotDisplay, m)