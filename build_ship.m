function finished_matrix = build_ship(obj,ship_length,matrix)
fprintf("\n Build a ship that is %.f tiles long\n", ship_length)
x1 = 0;
x2 = 0;
y1 = 0;
y2 = 0;
length = 0;
horizontal = 0;
    while length ~= ship_length
       [x1,y1] = getMouseInput(obj);
       [x2,y2] = getMouseInput(obj);
       
       if (x1 == x2 && y1~=y2) || (y1 == y2 && x1 ~= x2)
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
              matrix(x1+i, y1) = length;
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
        finished_matrix = matrix;
end