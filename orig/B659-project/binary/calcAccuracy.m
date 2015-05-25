% calcAccuracy.m
% 
% 

function accuracy = calcAccuracy(yPredict, yTest, rowTest)
	
	correct = 0;

	for var1=1:rowTest
		if ( yPredict(var1,1) == yTest(var1,1) )
			correct++;
		endif
	endfor
	
%	disp("\nNumber of correct predictions: ");
%	disp(correct);

	accuracy = (correct/rowTest) * 100;
	
%	disp("Accuracy of this prediction: ");
%	disp(accuracy);
end

