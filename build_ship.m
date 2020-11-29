function matrix = build_ship(obj,ship_length,matrix)
%BUILD_SHIP Creates the ships.


%make a title to tell the player how long of a ship to place
if ship_length == 5
    title("Place a ship that is 5 tiles long")
elseif ship_length == 4
    title("Place a ship that is 4 tiles long")
elseif ship_length == 3
    title("Place a ship that is 3 tiles long")
elseif ship_length == 2
    title("Place a ship that is 2  tiles long")
end
x1 = 0;
x2 = 0;
y1 = 0;
y2 = 0;
length = 0;
horizontal = 0;


    while length ~= ship_length %make the player pick tiles until their ship is the desired length
       [x1,y1] = getMouseInput(obj);
       [x2,y2] = getMouseInput(obj);
       
       if (x1 == x2 && y1~=y2) || (y1 == y2 && x1 ~= x2) %this if statement make a variable, length, so we have an exact distance between the points and determines the direction
           if (y1 == y2)
               horizontal = 1;
               if (x2 > x1)
                   length = x2 - x1 + 1;
               else
                   length = x1 - x2 + 1;
               end
           else
               if (y2 > y1)
                   length = y2 - y1 + 1;
               else
                   length = y1 - y2 + 1;
               end
           end
       end
    end

  
  for i = 0:(length-1)
      if (horizontal == 1)
          if (x2 > x1)
              matrix(x1+i, y1) = length; %this function outputs a matrix of the player board and the locations of the ships
          else
              matrix(x2+i, y1) = length;
          end
      else
          if (y2 > y1)
              matrix(x1, y1+i) = length;
          else
              matrix(x1, y2+i) = length;
          end
      end
  end
        title("")
end