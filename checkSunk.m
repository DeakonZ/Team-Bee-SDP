function [boardDisplay, shipMatrix, numSunk] = checkSunk(boardDisplay, shotDisplay, shipMatrix, shipLength, numSunk, isPlayer)
%CHECKSUNK Checks if all of the tiles of a ship have been hit, if so returns the boardDisplay with the sunk ship displayed.

%Ship Sprite Variables
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;

%Declare a variable to hold the number of ship parts hit.
partsHit = 0;

%Check if this was called for the player.
if (isPlayer)
    %Set the offset.
    offset = 11;
else
    %Set the offset.
    offset = 0;
end

%Find the locations the shipLength
isolatedLocation = shipMatrix == shipLength;
    
%Find the coordinates of the ship parts in the matrix.
[shipRow, shipCol] = find(isolatedLocation);

%Check if the 'isolatedLocation' matrix is not empty.
if (size(shipRow) > 0 & size(shipCol) > 0)
    %Check if the ship length is equal to 3.
    if (shipLength == 3)
        %Loop over each index until the 'shipLength' for the location of the first ship.
        for index = 1: shipLength
            %Check if the current value at the coordinates in 'shotDisplay'
            if (shotDisplay(shipRow(index), shipCol(index) + offset) > 8)
                %Increment the number of parts hit.
                partsHit = partsHit + 1;
            end
        end

        %Check if all of the parts of the ship have been hit.
        if (partsHit == 3)
            %Check if the ship is horizontal.
            if (shipRow(1) == shipRow(2))
                %Set the left ship sprite location.
                boardDisplay(shipRow(1), shipCol(1) + offset) = left_ship_sprite;

                %Set the horizontal ship sprite location.
                boardDisplay(shipRow(2), shipCol(2) + offset) = horiz_ship_sprite;

                %Set the right ship sprite location.
                boardDisplay(shipRow(3), shipCol(3) + offset) = right_ship_sprite;
            else
                %Set the top ship sprite location.
                boardDisplay(shipRow(1), shipCol(1) + offset) = top_ship_sprite;

                %Set the vertical ship sprite location.
                boardDisplay(shipRow(2), shipCol(2) + offset) = vert_ship_sprite;

                %Set the bottom ship sprite location.
                boardDisplay(shipRow(3), shipCol(3) + offset) = bot_ship_sprite;
            end

            %Increment the 'numSunk' variable.
            numSunk = numSunk + 1;

            %Remove the ship from the 'shipMatrix'.
            for index = 1: 3
                shipMatrix(shipRow(index), shipCol(index)) = 0;
            end
        end

        %Reset the 'partsHit' variable.
        partsHit = 0;

        %Starting at 4, loop over each index in 'shipRow' for the location of the second ship.
        for index = 4: size(shipRow)
            %Check if the current value at the coordinates in 'shotDisplay'
            if (shotDisplay(shipRow(index), shipCol(index) + offset) > 8)
                %Increment the number of parts hit.
                partsHit = partsHit + 1;
            end
        end

        %Check if all of the parts of the ship have been hit.
        if (partsHit == 3)
            %Check if the ship is horizontal.
            if (shipRow(4) == shipRow(5))
                %Set the left ship sprite location.
                boardDisplay(shipRow(4), shipCol(4) + offset) = left_ship_sprite;

                %Set the horizontal ship sprite location.
                boardDisplay(shipRow(5), shipCol(5) + offset) = horiz_ship_sprite;

                %Set the right ship sprite location.
                boardDisplay(shipRow(6), shipCol(6) + offset) = right_ship_sprite;
            else
                %Set the top ship sprite location.
                boardDisplay(shipRow(4), shipCol(4) + offset) = top_ship_sprite;

                %Set the vertical ship sprite location.
                boardDisplay(shipRow(5), shipCol(5) + offset) = vert_ship_sprite;

                %Set the bottom ship sprite location.
                boardDisplay(shipRow(6), shipCol(6) + offset) = bot_ship_sprite;
            end

            %Increment the 'numSunk' variable.
            numSunk = numSunk + 1;

            %Remove the ship from the 'shipMatrix'.
            for index = 4: 6
                shipMatrix(shipRow(index), shipCol(index)) = 0;
            end
        end
    else %If the 'shipLength' isn't equal to 3.
        %Loop over each index in 'shipRow'
        for index = 1: size(shipRow)
            %Check if the current value at the coordinates in 'shotDisplay'
            if (shotDisplay(shipRow(index), shipCol(index) + offset) > 8)
                %Increment the number of parts hit.
                partsHit = partsHit + 1;
            end
        end

        %Check if the number of parts hit is equal to the ship length.
        if (partsHit == shipLength)
            %Check if the ship is horizontal.
            if (shipRow(1) == shipRow(2))
                %Set the left ship sprite location.
                boardDisplay(shipRow(1), shipCol(1) + offset) = left_ship_sprite;

                %Starting at 2 loop until ship length minus 1.
                for index = 2: shipLength - 1
                    %Set the horizontal ship sprite location.
                    boardDisplay(shipRow(index), shipCol(index) + offset) = horiz_ship_sprite;
                end

                %Set the right ship sprite location.
                boardDisplay(shipRow(shipLength), shipCol(shipLength) + offset) = right_ship_sprite;
            else
                %Set the top ship sprite location.
                boardDisplay(shipRow(1), shipCol(1) + offset) = top_ship_sprite;

                %Starting at 2 loop until ship length minus 1.
                for index = 2: shipLength - 1
                    %Set the vertical ship sprite location.
                    boardDisplay(shipRow(index), shipCol(index) + offset) = vert_ship_sprite;
                end

                %Set the bottom ship sprite location.
                boardDisplay(shipRow(shipLength), shipCol(shipLength) + offset) = bot_ship_sprite;
            end

            %Increment the 'numSunk' variable.
            numSunk = numSunk + 1;

            %Remove the ship from the 'shipMatrix'.
            for index = 1: shipLength
                shipMatrix(shipRow(index), shipCol(index)) = 0;
            end
        end
    end
end

end