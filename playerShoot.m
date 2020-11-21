%Prompts the player to pick a location to shoot.
function [shotDisplay, boardDisplay] = playerShoot(obj, boardDisplay, shotDisplay, shipMatrix)

%Initial prompt for player to choose a tile.
[shotRow, shotCol, shotButton] = getMouseInput(obj);

%Loop while the mouse button isn't MOUSE 1, or if the value at the shotRow
%and shotCol is less than 1, or if the shotCol is less than 12, or if the
%or if the value at the shotRow and shotCol in 'shotDisplay' is greater than 8.
while shotButton ~= 1 || shipMatrix(shotRow, shotCol - 11) < 1 || shotCol < 12 || shotDisplay(shotRow, shotCol) > 8
    %Prompt the player to choose another tile.
    [shotRow, shotCol, shotButton] = getMouseInput(obj);
end

%Check if the location clicked by the player is a ship.
if shipMatrix(shotRow, shotCol - 11) >= 2 && shipMatrix(shotRow, shotCol - 11) <= 5
    %Add the hit sprite to the shotDisplay matrix.
    shotDisplay(shotRow, shotCol) = 9;
else
    %Add the miss sprite to the shotDisplay matrix.
    shotDisplay(shotRow, shotCol) = 10;
end

%Loop through each possible ship length
for shipLength = 2: 5
    %Check if the 3 long ship has been sunk.
    boardDisplay = checkSunk(boardDisplay, shotDisplay, shipMatrix, shipLength);

    %Redraw the scene.
    drawScene(obj, boardDisplay, shotDisplay)
end

end

