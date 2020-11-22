function boardDisplay = checkSunk(boardDisplay, shotDisplay, shipMatrix, shipLength)
%Ship Sprite Variables
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;

%Declare a variable to hold the number of ship parts hit.
partsHit = 0;

%Find the coordinates the shipLength
isolatedLocation = shipMatrix == shipLength;
    
%Find the locations of the ship parts in the matrix.
[shipX, shipY] = find(isolatedLocation);

%Check if the 'isolatedLocation' matrix is not empty.
if (size(shipX) > 0 & size(shipY) > 0)
    %Check if the ship length is equal to 3.
    if (shipLength == 3)
        %Loop over each index until the 'shipLength' for the location of the first ship.
        for index = 1: shipLength
            %Check if the current value at the coordinates in 'shotDisplay'
            if (shotDisplay(shipX(index), shipY(index) + 11) > 8)
                %Increment the number of parts hit.
                partsHit = partsHit + 1;
            end
        end

        %Check if all of the parts of the ship have been hit.
        if (partsHit == 3)
            %Check if the ship is horizontal.
            if (shipX(1) == shipX(2))
                %Set the left ship sprite location.
                boardDisplay(shipX(1), shipY(1) + 11) = left_ship_sprite;

                %Set the horizontal ship sprite location.
                boardDisplay(shipX(2), shipY(2) + 11) = horiz_ship_sprite;

                %Set the right ship sprite location.
                boardDisplay(shipX(3), shipY(3) + 11) = right_ship_sprite;
            else
                %Set the top ship sprite location.
                boardDisplay(shipX(1), shipY(1) + 11) = top_ship_sprite;

                %Set the vertical ship sprite location.
                boardDisplay(shipX(2), shipY(2) + 11) = vert_ship_sprite;

                %Set the bottom ship sprite location.
                boardDisplay(shipX(3), shipY(3) + 11) = bot_ship_sprite;
            end
        end

    %Reset the 'partsHit' variable.
    partsHit = 0;

    %Starting at 4, loop over each index in 'shipX' for the location of the second ship.
    for index = 4: size(shipX)
        %Check if the current value at the coordinates in 'shotDisplay'
        if (shotDisplay(shipX(index), shipY(index) + 11) > 8)
            %Increment the number of parts hit.
            partsHit = partsHit + 1;
        end
    end

    %Check if all of the parts of the ship have been hit.
    if (partsHit == 3)
        %Check if the ship is horizontal.
        if (shipX(4) == shipX(5))
            %Set the left ship sprite location.
            boardDisplay(shipX(4), shipY(4) + 11) = left_ship_sprite;

            %Set the horizontal ship sprite location.
            boardDisplay(shipX(5), shipY(5) + 11) = horiz_ship_sprite;

            %Set the right ship sprite location.
            boardDisplay(shipX(6), shipY(6) + 11) = right_ship_sprite;
        else
            %Set the top ship sprite location.
            boardDisplay(shipX(4), shipY(4) + 11) = top_ship_sprite;

            %Set the vertical ship sprite location.
            boardDisplay(shipX(5), shipY(5) + 11) = vert_ship_sprite;

            %Set the bottom ship sprite location.
            boardDisplay(shipX(6), shipY(6) + 11) = bot_ship_sprite;
        end
    end

    %If the 'shipLength' isn't equal to 3.
    else
        %Loop over each index in 'shipX'
        for index = 1: size(shipX)
            %Check if the current value at the coordinates in 'shotDisplay'
            if (shotDisplay(shipX(index), shipY(index) + 11) > 8)
                %Increment the number of parts hit.
                partsHit = partsHit + 1;
            end
        end

        %Check if the number of parts hit is equal to the ship length.
        if (partsHit == shipLength)
            %Check if the ship is horizontal.
            if (shipX(1) == shipX(2))
                %Set the left ship sprite location.
                boardDisplay(shipX(1), shipY(1) + 11) = left_ship_sprite;

                %Starting at 2 loop until ship length minus 1.
                for index = 2: shipLength - 1
                    %Set the horizontal ship sprite location.
                    boardDisplay(shipX(index), shipY(index) + 11) = horiz_ship_sprite;
                end

                %Set the right ship sprite location.
                boardDisplay(shipX(shipLength), shipY(shipLength) + 11) = right_ship_sprite;
            else
                %Set the top ship sprite location.
                boardDisplay(shipX(1), shipY(1) + 11) = top_ship_sprite;

                %Starting at 2 loop until ship length minus 1.
                for index = 2: shipLength - 1
                    %Set the vertical ship sprite location.
                    boardDisplay(shipX(index), shipY(index) + 11) = vert_ship_sprite;
                end

                %Set the bottom ship sprite location.
                boardDisplay(shipX(shipLength), shipY(shipLength) + 11) = bot_ship_sprite;
            end 
        end
    end
end

end


