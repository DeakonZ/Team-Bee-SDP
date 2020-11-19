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

%--------------Add check if the shot is placed on a shot-----------
%--------------Add check if the ship sank--------------------------

end

