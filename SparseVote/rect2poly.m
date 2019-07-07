
% function for packing the rectangle
function poly = rect2poly(rect)

x = rect(1);
y = rect(2);
w = rect(3);
h = rect(4);

poly = [ x y;...
              x+w y;...
              x+w y+h;...
              x y+h;...
              x y];
