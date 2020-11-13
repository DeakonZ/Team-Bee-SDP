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

drawScene(battleshipScene,boardDisplay)

shotDisplay = playerShoot(battleshipScene, boardDisplay, shotDisplay);

drawScene(battleshipScene, boardDisplay, shotDisplay)

%% Functions

%Prompts the player to pick a location to shoot.
function shotDisplay = playerShoot(obj, boardDisplay, shotDisplay)

%Initial prompt for player to choose a tile.
[shotRow, shotCol, shotButton] = getMouseInput(obj);

%Loop while the mouse button isn't MOUSE 1, or if the value at the shotRow
%and shotCol is less than 2, or if the shotCol is less than 12.
while shotButton ~= 1 || boardDisplay(shotRow, shotCol) < 2 || shotCol < 12
    %Prompt the player to choose another tile.
    [shotRow, shotCol, shotButton] = getMouseInput(obj);
    
end

%Check if the location clicked by the player is a ship sprite.
if boardDisplay(shotRow, shotCol) > 2 && boardDisplay(shotRow, shotCol) < 9
    %Add the hit sprite to the shotDisplay matrix.
    shotDisplay(shotRow, shotCol) = 9;
else
    %Add the miss sprite to the shotDisplay matrix.
    shotDisplay(shotRow, shotCol) = 10;
end

end
