function [difficulty] = pickDifficulty()
%PICKDIFFICULTY Prompt the user to choose a difficulty.

%Declaration of sprite variables with numerical values.
water_sprite = 2;
left_ship_sprite = 3;
right_ship_sprite = 5;
blank_ship_sprite = 11;
alphabet = (12 : 37);

%Initalize the scene using the Battleship.png sprites.
difficultyMenu = simpleGameEngine('Battleship.png', 84, 84);

%Create a prompt of only water sprites.
difficultyDisplay = water_sprite * ones(5, 15);   

%Create a prompt text overlay of blank sprites.
difficultyText = ones(5, 15);   

%Display Prompt Text.
difficultyText(2, 4) = alphabet(4);     %Displays a D.
difficultyText(2, 5) = alphabet(9);     %Displays a I.
difficultyText(2, 6) = alphabet(6);     %Displays a F.
difficultyText(2, 7) = alphabet(6);     %Displays a F.
difficultyText(2, 8) = alphabet(9);     %Displays a I.
difficultyText(2, 9) = alphabet(3);     %Displays a C.
difficultyText(2, 10) = alphabet(21);   %Displays a U.
difficultyText(2, 11) = alphabet(12);   %Displays a L.
difficultyText(2, 12) = alphabet(20);   %Displays a T.
difficultyText(2, 13) = alphabet(25);   %Displays a Y.

%Display the EASY button.
difficultyDisplay(4, 2) = left_ship_sprite;   %Display the left ship sprite.
for index = 3 : 6     %Loop to display blank ship sprites.
    difficultyDisplay(4, index) = blank_ship_sprite;
end
difficultyDisplay(4, 7) = right_ship_sprite; %Display the right ship sprite.
difficultyText(4, 3) = alphabet(5);     %Displays a E.
difficultyText(4, 4) = alphabet(1);     %Displays a A.
difficultyText(4, 5) = alphabet(19);    %Displays a S.
difficultyText(4, 6) = alphabet(25);    %Displays a Y.

%Display the HARD button.
difficultyDisplay(4, 9) = left_ship_sprite;   %Display the left ship sprite.
for index = 10 : 13     %Loop to display blank ship sprites.
    difficultyDisplay(4, index) = blank_ship_sprite;
end
difficultyDisplay(4, 14) = right_ship_sprite; %Display the right ship sprite.
difficultyText(4, 10) = alphabet(8);    %Displays a H.
difficultyText(4, 11) = alphabet(1);    %Displays a A.
difficultyText(4, 12) = alphabet(18);   %Displays a R.
difficultyText(4, 13) = alphabet(4);    %Displays a D.

%Display the play again prompt.
drawScene(difficultyMenu, difficultyDisplay, difficultyText);

%Prompt user for input.
[clickRow, clickCol, clickButton] = getMouseInput(difficultyMenu);

while (clickButton ~= 1 || difficultyDisplay(clickRow, clickCol) < 3)
    %Prompt user for input.
    [clickRow, clickCol, clickButton] = getMouseInput(difficultyMenu); 
end

%Check if the EASY button was clicked.
if (clickCol > 1 && clickCol < 8)
    difficulty = 0;
else
    difficulty = 1;
end

%Close the figure.
close (difficultyMenu.my_figure)

end

