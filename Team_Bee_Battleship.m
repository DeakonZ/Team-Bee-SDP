%Team Bee Battleship Script
%Written by Parker Stuebs, Caleb Bucher, Varsha Govardhanam, Deakon Ziegler
%Created for the ENGR 1181.01 Software Design Project.

clear
clc

%% Main Menu

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
blank_ship_sprite = 11;
alphabet = (12 : 37);
question_sprite = 38;
bee_sprite = 39;

%Initalize the scene using the Battleship.png sprites.
mainMenu = simpleGameEngine('Battleship.png', 84, 84);

%Create a menu display of only water sprites.
menuDisplay = water_sprite * ones(6, 15);   

%Create a menu text overlay of blank sprites.
menuText = ones(6, 15);                     

%Display the title.
menuText(1, 3) = alphabet(20);   %Displays a T.
menuText(1, 4) = alphabet(5);    %Displays a E.
menuText(1, 5) = alphabet(1);    %Displays a A.
menuText(1, 6) = alphabet(13);   %Displays a M.
menuText(1, 8) = bee_sprite;     %Displays a bee.
menuText(2, 3) = alphabet(2);    %Displays a B.
menuText(2, 4) = alphabet(1);    %Displays a A.
menuText(2, 5) = alphabet(20);   %Displays a T.
menuText(2, 6) = alphabet(20);   %Displays a T.
menuText(2, 7) = alphabet(12);   %Displays a L.
menuText(2, 8) = alphabet(5);    %Displays a E.
menuText(2, 10) = alphabet(19);  %Displays a S.
menuText(2, 11) = alphabet(8);   %Displays a H.
menuText(2, 12) = alphabet(9);   %Displays a I.
menuText(2, 13) = alphabet(16);  %Displays a P.

%Display the PLAY button.
menuDisplay(5, 2) = left_ship_sprite;   %Display the left ship sprite.
for index = 3 : 6       %Loop to display blank ship sprites.
    menuDisplay(5, index) = blank_ship_sprite;
end
menuDisplay(5, 7) = right_ship_sprite;  %Display the right ship sprite.
menuText(5, 3) = alphabet(16);  %Displays a P.
menuText(5, 4) = alphabet(12);  %Displays a L.
menuText(5, 5) = alphabet(1);   %Displays a A.
menuText(5, 6) = alphabet(25);  %Displays a Y.

%Display the EXIT button.
menuDisplay(5, 9) = left_ship_sprite;   %Display the left ship sprite.
for index = 10 : 13     %Loop to display blank ship sprites.
    menuDisplay(5, index) = blank_ship_sprite;
end
menuDisplay(5, 14) = right_ship_sprite; %Display the right ship sprite.
menuText(5, 10) = alphabet(5);   %Displays a E.
menuText(5, 11) = alphabet(24);  %Displays a X.
menuText(5, 12) = alphabet(9);   %Displays a I.
menuText(5, 13) = alphabet(20);  %Displays a T.

%Display the main menu.
drawScene(mainMenu, menuDisplay, menuText);

%Prompt user for input.
[clickRow, clickCol, clickButton] = getMouseInput(mainMenu);

while (clickButton ~= 1 || menuDisplay(clickRow, clickCol) < 3)
    %Prompt user for input.
    [clickRow, clickCol, clickButton] = getMouseInput(mainMenu); 
end

%Check if the PLAY button was clicked.
if (clickCol > 1 && clickCol < 8)
    %Close the current figure.
    close(mainMenu.my_figure);
    
    %Declare a boolean to hold if the user is done playing.
    exitGame = 0;
    
    %Loop while 'exitGame' is false.
    while ~exitGame
        %Call the 'battleShip' function.
        battleShip();
        
        %Call the 'playAgain' function to prompt the player if they want to play again.
        exitGame = playAgain();
        
        %Close all of the figures.
        close all
    end
end

%Close all of the figures.
close all

%Quit running the script.
return
