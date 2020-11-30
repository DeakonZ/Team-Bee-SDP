% Varsha Govardhanam :)

clc
clear


% Initialize scene
my_scene = simpleGameEngine('Battleship.png',84,84);

% Set up variables to name the various sprites
blank_sprite = 1;
water_sprite = 2;
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;
hit_sprite = 9;
miss_sprite = 10;

% Display empty board   
%%board_display(:,11) = blank_sprite;
%drawScene(my_scene,board_display)



%% Creating initial coordinates for the ships

% creating a 10 by 10 computer side matrix
matrix = ones(10, 10);

% this variable holds the size of the ship
shipSize = 5;
   
% This loop controls the total number of ships being displayed - for now it
% is 5 ships. 

for k=1:5

    % the variable count will hold the ship size
    count = shipSize;
    % The variable count will be updated withint the while loop upto 0, if it reaches zero that menas, the space nedded to place the ship is available 
    % if it is not 0 that means it will have to o through the loop again to
    % find place for the ship
    while(count ~= 0)
       count = shipSize;

        % creates 2 random x and y coordinates
        coord_x =  randi([1,10],1)
        coord_y =  randi([1,10],1)

        % creates a random number between 0 or 1, and based on the number
        % it will either place a vertical ship or a horizontal ship
        side = randi([0,1],1);
        
        % If side equals to 1 then it dispalys a vertical ship
        if(side == 1)
            % makes sure that the the ship's last block value doesnt exceed 10
            % for the x coordinate
            while(coord_x + (shipSize - 1) > 10 )
                coord_x =  randi([1,10],1);
            end
            % and for the y coordinate
            while(coord_y + (shipSize - 1) > 10 )
                coord_y =  randi([1,10],1);
            end

            %This for loop avoids any overlapping in the code between ships
            for i = 0: shipSize - 1
                % checking if each block in the ship placemnt is not occupied
                if(matrix(coord_y + i, coord_x) == 1)
                    count = count - 1
                end

            end
            
        % If side equals to 0 then it dispalys a horizontal ship
        else
            % makes sure that the the ship's last block value doesnt exceed 10
            % for the x coordinate
            while(coord_x + (shipSize - 1) > 10 )
                coord_x =  randi([1,10],1);
            end
            % and for the y coordinate
            while(coord_y + (shipSize - 1) > 10 )
                coord_y =  randi([1,10],1);
            end

            %This for loop avoids any overlapping in the code between ships
            for i = 0: shipSize - 1
                % checking if each block in the ship placemnt is not occupied
                if(matrix(coord_y, coord_x + i) == 1)
                    count = count - 1
                end

            end
        end
    
    end
        
    % after checking for space for the ship and finding it, this loop will
    % place the ship in its coordinates
    if(side == 1)    
        for z = 0: shipSize-1
           matrix(coord_y+z , coord_x ) = shipSize;
        end

    else 
        for z = 0: shipSize-1
           matrix(coord_y , coord_x + z) = shipSize;
        end
    end
    
    % printing the matrix
    matrix
    
    shipSize = shipSize - 1;
    
    % for the last iteration we want to set 1 to 3 because there are two 3
    % sized ships and since we dont need a ship sized 1 we can replace 1
    % with 3
    if(shipSize == 1)
        shipSize = 3 ;
    end
    
end