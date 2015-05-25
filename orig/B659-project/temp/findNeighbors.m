% findNeighbors.m
% 
% 

function yPredict = findNeighbors(k, yTrain, rowTest, sortPos)

	temp = zeros(k,rowTest);
	
	yPredict = zeros(rowTest,1);

	count1 = 0;
	count2 = 0;
	count3 = 0;
	count4 = 0;
	count5 = 0;
	count6 = 0;
	count7 = 0;
	count8 = 0;
	count9 = 0;
	count10 = 0;

	for var1=1:rowTest

		for var2=1:k
			y(var2,var1) = sortPos(var2,var1);
			temp(var2,var1) = yTrain(y(var2,var1),1);
			
			if (temp(var2,var1) == 1)
				count1++;
			elseif (temp(var2,var1) == 2)
				count2++;
			elseif (temp(var2,var1) == 3)
				count3++;
			elseif (temp(var2,var1) == 4)
				count4++;
			elseif (temp(var2,var1) == 5)
				count5++;
			elseif (temp(var2,var1) == 6)
				count6++;
			elseif (temp(var2,var1) == 7)
				count7++;
			elseif (temp(var2,var1) == 8)
				count8++;
			elseif (temp(var2,var1) == 9)
				count9++;
			elseif (temp(var2,var1) == 10)
				count10++;
			endif
		endfor
		
		[maxVal, maxPos] = max([count1,count2,count3,count4,count5,count6,count7,count8,count9,count10]);

	
		if (maxPos == 1)
			yPredict(var1,1) = 1;
		elseif (maxPos == 2)
			yPredict(var1,1) = 2;
		elseif (maxPos == 3)
			yPredict(var1,1) = 3;
		elseif (maxPos == 4)
			yPredict(var1,1) = 4;
		elseif (maxPos == 5)
			yPredict(var1,1) = 5;
		elseif (maxPos == 6)
			yPredict(var1,1) = 6;
		elseif (maxPos == 7)
			yPredict(var1,1) = 7;
		elseif (maxPos == 8)
			yPredict(var1,1) = 8;
		elseif (maxPos == 9)
			yPredict(var1,1) = 9;
		elseif (maxPos == 10)
			yPredict(var1,1) = 10;
		endif
		
		count1 = 0;
		count2 = 0;
		count3 = 0;
		count4 = 0;
		count5 = 0;
		count6 = 0;
		count7 = 0;
		count8 = 0;
		count9 = 0;
		count10 = 0;

	endfor

	% disp(temp);
	% disp("\nyPredict:")
	% disp(yPredict);

end
