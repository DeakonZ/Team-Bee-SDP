function [shotDisplay, boardDisplay, numSunk] = randomShot(obj, boardDisplay, shotDisplay, shipMatrix, numSunk)
%RANDOMSHOT Randomly pick a place to shoot.
%   For the computer player.

%Sprite variables.
hit_sprite = 9;
miss_sprite = 10;

%Randomly choose a place to shoot.
shotRow = randi(10);
shotCol = randi(10);

%Loop if the current 'shotRow' and 'shotCol' is equal to a hit or miss sprite.
while (shotDisplay(shotRow, shotCol) == hit_sprite || shotDisplay(shotRow, shotCol) == miss_sprite)
    %Randomly choose a different place to shoot.
    shotRow = randi(10);
    shotCol = randi(10);
end

%Check if the shot location is a ship.
if shipMatrix(shotRow, shotCol) >= 2 && shipMatrix(shotRow, shotCol) <= 5
    %Add the hit sprite to the shotDisplay matrix.
    shotDisplay(shotRow, shotCol) = hit_sprite;
else
    %Add the miss sprite to the shotDisplay matrix.
    shotDisplay(shotRow, shotCol) = miss_sprite;
end

%Loop through each possible ship length
for shipLength = 2: 5
    %Check if the ship has been sunk.
    [boardDisplay, numSunk] = checkSunk(boardDisplay, shotDisplay, shipMatrix, shipLength, numSunk);

    %Redraw the scene.
    drawScene(obj, boardDisplay, shotDisplay)
end

end

