function [shotDisplay, boardDisplay, shipMatrix, previousHit, numSunk] = smartShoot(obj, boardDisplay, shotDisplay, shipMatrix, previousHit, numSunk)
%SMARTSHOOT Shoots the rest of a ship's parts if it had been hit previously.
%   For the computer player.

%Sprite variables.
hit_sprite = 9;
miss_sprite = 10;

%Initalize the shotRow and shotCol variables.
shotRow = 0;
shotCol = 0;

%Check if the pervious hit is equal to zero.
if (previousHit == 0)
    %Randomly choose a place to shoot.
    shotRow = randi(10);
    shotCol = randi(10);

    %Loop if the current 'shotRow' and 'shotCol' is equal to a hit or miss sprite.
    while (shotDisplay(shotRow, shotCol) == hit_sprite || shotDisplay(shotRow, shotCol) == miss_sprite)
        %Randomly choose a different place to shoot.
        shotRow = randi(10);
        shotCol = randi(10);
    end
else
    %Isolate the hit locations.
    isolatedHits = shotDisplay(:, 1:10) == hit_sprite;
    
    %Isolate the locations of all hits that have not sunk a ship.
    remainingHits = isolatedHits .* shipMatrix;
    
    %Find the coordinates of all hits that have not sunk a ship.
    [remainingRow, remainingCol] = find(remainingHits);

    %Loop though each index in the 'remainingRow' matrix.
    for index = 1 : size(remainingRow)
        if (shipMatrix(remainingRow(index), remainingCol(index)) == shipMatrix(previousHit(1), previousHit(2)))
            %Find the locations the ship length at the last hit location.
            isolatedLocation = shipMatrix == shipMatrix(previousHit(1), previousHit(2));

            %Find the coordinates of the ship parts in the matrix.
            [shipRow, shipCol] = find(isolatedLocation);

            %Loop from 1 to the ship length.
            for shipIndex = 1 : shipMatrix(previousHit(1), previousHit(2))
                %Check if there is already a hit at this location.
                if (shotDisplay(shipRow(shipIndex), shipCol(shipIndex)) ~= hit_sprite)
                    %Asign the shotRow to the current value in shipRow.
                    shotRow = shipRow(shipIndex);

                    %Assign the shotCol to the current value in shipCol.
                    shotCol = shipCol(shipIndex);

                    %Exit the loop.
                    break;
                end
            end    
        end
    end
end

%Check if the shot location is a ship.
if shipMatrix(shotRow, shotCol) >= 2 && shipMatrix(shotRow, shotCol) <= 5
    %Add the hit sprite to the shotDisplay matrix.
    shotDisplay(shotRow, shotCol) = hit_sprite;
    
    previousHit = [shotRow, shotCol];
else
    %Add the miss sprite to the shotDisplay matrix.
    shotDisplay(shotRow, shotCol) = miss_sprite;
end

%Store the initial value in num sunk.
previousSunk = numSunk;

%Loop through each possible ship length
for shipLength = 2: 5
    %Check if the ship has been sunk.
    [boardDisplay, shipMatrix, numSunk] = checkSunk(boardDisplay, shotDisplay, shipMatrix, shipLength, numSunk, 0);

    %Redraw the scene.
    drawScene(obj, boardDisplay, shotDisplay)
end

%Check if a ship has been sunk.
if (previousSunk < numSunk)
    %Reset 'previousHit'.
    previousHit = [0, 0];
end

end

