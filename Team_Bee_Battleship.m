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

%Declare and initalize the shot matrix.
shotDisplay = ones(10, 21);

%Draw base board.
boardDisplay = water_sprite * ones(10, 21);
boardDisplay(:, 11) = blank_sprite;
drawScene(battleshipScene, boardDisplay)


playerShips = ones(10,10);

[boardDisplay, shipMatrix] = playerPlacement(battleshipScene, boardDisplay, playerShips);

%% Game Logic



%% playerShoot and checkSunk Test Code

%TEMP SHIPMATRIX
m = ones(10, 10);

m(1,1) = 3;
m(1,2) = 3;
m(1,3) = 3;

m(7,5) = 3;
m(6,5) = 3;
m(5,5) = 3;

m(10,1) = 5;
m(10,2) = 5;
m(10,3) = 5;
m(10,4) = 5;
m(10,5) = 5;
%TEMP SHIPMATRIX

k = 1;
while k <= 15
    %Call the player shoot function and assign the output to the shot display.
    [shotDisplay, boardDisplay] = playerShoot(battleshipScene, boardDisplay, shotDisplay, m);

    %Redraw the scene.
    drawScene(battleshipScene, boardDisplay, shotDisplay)
    
    k = k + 1;
end
