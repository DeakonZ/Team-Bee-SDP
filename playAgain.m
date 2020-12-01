function [exitGame] = playAgain()
%PLAYAGAIN Prompt the player if they want to play the game again or not.

%Declaration of sprite variables with numerical values.
water_sprite = 2;
left_ship_sprite = 3;
right_ship_sprite = 5;
blank_ship_sprite = 11;
alphabet = (12 : 37);
question_sprite = 38;

%Initalize the scene using the Battleship.png sprites.
promptMenu = simpleGameEngine('Battleship.png', 84, 84);

%Create a prompt of only water sprites.
promptDisplay = water_sprite * ones(5, 13);   

%Create a prompt text overlay of blank sprites.
promptText = ones(5, 13);   

%Display Prompt Text.
promptText(2, 2) = alphabet(16);        %Displays a P.
promptText(2, 3) = alphabet(12);        %Displays a L.
promptText(2, 4) = alphabet(1);         %Displays a A.
promptText(2, 5) = alphabet(25);        %Displays a Y.
promptText(2, 7) = alphabet(1);         %Displays a A.
promptText(2, 8) = alphabet(7);         %Displays a G.
promptText(2, 9) = alphabet(1);         %Displays a A.
promptText(2, 10) = alphabet(9);        %Displays a I.
promptText(2, 11) = alphabet(14);       %Displays a N.
promptText(2, 12) = question_sprite;    %Displays a ?.

%Display the YES button.
promptDisplay(4, 2) = left_ship_sprite;   %Display the left ship sprite.
for index = 3 : 5     %Loop to display blank ship sprites.
    promptDisplay(4, index) = blank_ship_sprite;
end
promptDisplay(4, 6) = right_ship_sprite; %Display the right ship sprite.
promptText(4, 3) = alphabet(25);    %Displays a Y.
promptText(4, 4) = alphabet(5);     %Displays a E.
promptText(4, 5) = alphabet(19);    %Displays a S.

%Display the NO button.
promptDisplay(4, 9) = left_ship_sprite;   %Display the left ship sprite.
for index = 10 : 11     %Loop to display blank ship sprites.
    promptDisplay(4, index) = blank_ship_sprite;
end
promptDisplay(4, 12) = right_ship_sprite; %Display the right ship sprite.
promptText(4, 10) = alphabet(14);    %Displays a N.
promptText(4, 11) = alphabet(15);   %Displays a O.


%Display the play again prompt.
drawScene(promptMenu, promptDisplay, promptText);

%Prompt user for input.
[clickRow, clickCol, clickButton] = getMouseInput(promptMenu);

while (clickButton ~= 1 || promptDisplay(clickRow, clickCol) < 3)
    %Prompt user for input.
    [clickRow, clickCol, clickButton] = getMouseInput(promptMenu); 
end

%Check if the YES button was clicked.
if (clickCol > 1 && clickCol < 7)
    exitGame = 0;
else
    exitGame = 1;
end

end

