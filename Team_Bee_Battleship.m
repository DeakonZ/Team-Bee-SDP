%Team Bee Battleship Script
%Written by Parker Stuebs, Caleb Bucher, Varsha Govardhanam, Deakon Ziegler
%Created for the ENGR 1181.01 Software Design Project.

clear
clc

%% Base Board Creation

%Initialize scene using the Battleship.png sprites.
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
boardDisplay = water_sprite * ones(10, 21);                     %Creates a board display consisting of only water sprites.
boardDisplay(:, 11) = blank_sprite;                             %Creates the partition between the two boards.
drawScene(battleshipScene, boardDisplay)                        %Displays the scene.
set(battleshipScene.my_figure, 'Position', [286 258 1350 708])  %Resize the display to better fit the scoreboard.

%Game Variables
shotDisplay = ones(10, 21);     %Matrix Holds the hit/miss sprites for display.
playerShips = ones(10, 10);     %Matrix holds the locations of the player's ships.
computerShips = ones(10, 10);   %Matrix holds the locations of the computer's ships.
playerSunk = 0;                 %Holds the number of player ships sunk.
computerSunk = 0;               %Holds the number of computer ships sunk.

%% Game Logic

%Display the starting score.
xlabel({'Score', [['Player: ' num2str(playerSunk)], '                                                    ', ['Computer: ' num2str(computerSunk)]]})

%Prompt the player to place their ships.
[boardDisplay, playerShips] = playerPlacement(battleshipScene, boardDisplay, playerShips);
    
%Call the 'computerPlacement' function.
computerShips = computerPlacement(computerShips);

while playerSunk ~= 5 && computerSunk ~= 5
    %Prompt the player to pick a location to shoot.
    [shotDisplay, boardDisplay, computerShips, playerSunk] = playerShoot(battleshipScene, boardDisplay, shotDisplay, computerShips, playerSunk);
    
    %Redraw the scene.
    drawScene(battleshipScene, boardDisplay, shotDisplay)
    
    %Call the 'randomShot' function.
    [shotDisplay, boardDisplay, playerShips, computerSunk] = randomShot(battleshipScene, boardDisplay, shotDisplay, playerShips, computerSunk);
    
    %Check if either the player or computer has sunk all of the ships.
    if playerSunk == 5
        title('The Player has sunk all of the Computers ships!')
    elseif computerSunk == 5
        title('The Computer has sunk all of the Players ships!')
    end 
    
    %Update the current score.
    xlabel({'Score', [['Player: ' num2str(playerSunk)], '                                                    ', ['Computer: ' num2str(computerSunk)]]})
end
