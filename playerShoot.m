function [shotDisplay, boardDisplay, playerSunk] = playerShoot(obj, boardDisplay, shotDisplay, shipMatrix, playerSunk)
%PLAYERSHOOT Prompts the player to pick a location to shoot.

%Sprite variables.
hit_sprite = 9;
miss_sprite = 10;

%Initial prompt for player to choose a tile.
title('Choose a location to shoot')
[shotRow, shotCol, shotButton] = getMouseInput(obj);

%Loop while the mouse button isn't MOUSE 1, or if the value at the shotRow
%and shotCol is less than 1, or if the shotCol is less than 12, or if the
%or if the value at the shotRow and shotCol in 'shotDisplay' is greater than 8.
while shotButton ~= 1 || boardDisplay(shotRow, shotCol) < 2 || shotCol < 12 || shotDisplay(shotRow, shotCol) > 8
    %Prompt the player to choose another tile.
    [shotRow, shotCol, shotButton] = getMouseInput(obj);
end

%Check if the location clicked by the player is a ship.
if shipMatrix(shotRow, shotCol - 11) >= 2 && shipMatrix(shotRow, shotCol - 11) <= 5
    %Add the hit sprite to the shotDisplay matrix.
    shotDisplay(shotRow, shotCol) = hit_sprite;
else
    %Add the miss sprite to the shotDisplay matrix.
    shotDisplay(shotRow, shotCol) = miss_sprite;
end

%Loop through each possible ship length
for shipLength = 2 : 5
    %Check if the ship has been sunk.
    [boardDisplay, playerSunk] = checkSunk(boardDisplay, shotDisplay, shipMatrix, shipLength, playerSunk);

    %Redraw the scene.
    drawScene(obj, boardDisplay, shotDisplay)
end

end

