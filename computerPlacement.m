function [matrix] = computerPlacement(matrix)
%COMPUTERPLACEMENT Randomly places ships in a 10x10 matrix.
%   Returns the 10x10 matrix with the ships placed.

shipSize = 5;

% This loop controls the total number of ships being displayed - for now it
% is 5 ships. 

for k=1:5

    % creates 2 random x and y coordinates
    coord_x =  randi([1,10],1);
    coord_y =  randi([1,10],1);

    % creates a random number between 0 or 1
    side = randi([0,1],1);

    % makes sure that the the ship's last block value doesnt exceed 10
    while(coord_x + (shipSize - 1) > 10 )
        coord_x =  randi([1,10],1);
    end

    while(coord_y + (shipSize - 1) > 10 )
        coord_y =  randi([1,10],1);
    end

    %This for loop avoids any overlapping in the code between ships
    for z=0:shipSize-1
        % checks if the ship is vertical if its equal to 0 and horizontal
        % if its equal to 1
        if(side == 0)
            while(matrix(coord_y+z, coord_x) > 1 )
                coord_x =  randi([1,10],1);
                coord_y =  randi([1,10],1);
            end
        else 
            while(matrix(coord_y, coord_x+z) > 1 )
                coord_x =  randi([1,10],1);
                coord_y =  randi([1,10],1);
            end
        end
    end


    % If side equals to 0 then it dispalys a vertical ship
    if(side == 0)
        % Fills our 10 by 10 matrix with the ship size value to indicate where
        % the ship is placed
        for i = 0: shipSize-1
            matrix(coord_y + i, coord_x) = shipSize;
        end
        

    % If side equals to 1 then it dispalys a horizontal ship
    else    
        % Fills our 10 by 10 matrix with the ship size value to indicate where
        % the ship is placed
        for i = 0: shipSize-1
            matrix(coord_y, coord_x+i) = shipSize;
        end
       
    
    end
    shipSize = shipSize - 1;
    
    if(shipSize == 1)
        shipSize = 3 ;
    end

end
end

