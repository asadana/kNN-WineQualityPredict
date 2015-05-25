% split.m
% binary split for 6 and above, and 5 and under

function y = split(y)
	
	[row, col] = size(y);
	
	for var1=1:row
		if( y(var1,1) >= 6)
			y(var1,1) = 1;
		else
			y(var1,1) = 0;
		endif
	endfor

end
