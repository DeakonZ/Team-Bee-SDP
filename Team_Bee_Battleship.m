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

%Draw base board.
boardDisplay = water_sprite * ones(10, 21);     %Creates a board display consisting of only water sprites.
boardDisplay(:, 11) = blank_sprite;             %Creates the partition between the two boards.
drawScene(battleshipScene, boardDisplay)        %Displays the scene.   

%Game Variables
shotDisplay = ones(10, 21);     %Matrix Holds the hit/miss sprites for display.
playerShips = ones(10, 10);     %Matrix holds the locations of the player's ships.
computerShips = ones(10, 10);   %Matrix holds the locations of the computer's ships.
playerSunk = 0;                 %Holds the number of player ships sunk.
computerSunk = 0;               %Holds the number of computer ships sunk.

%% playerPlacement and computerPlacement Test Code

[boardDisplay, shipMatrix] = playerPlacement(battleshipScene, boardDisplay, playerShips);

computerShips = computerPlacement(computerShips);

%% playerShoot and checkSunk Test Code

k = 1;
while k <= 100
    %Call the player shoot function and assign the output to the shot display.
    [shotDisplay, boardDisplay] = playerShoot(battleshipScene, boardDisplay, shotDisplay, computerShips);

    %Redraw the scene.
    drawScene(battleshipScene, boardDisplay, shotDisplay)
    
    k = k + 1;
end

%% Game Logic

