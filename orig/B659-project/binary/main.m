
% Loading the dataset
dataSet=csvread('winequality-white-noTitles.csv');
%dataSet=csvread('winequality-white-trim300.csv');
%dataSet=csvread('winequality-red-noTitles.csv');
%dataSet=csvread('winequality-red-trim200.csv');

% Measuring the size of the array
[row,col] = size(dataSet);

% -----
% Sampling with replacement
% sample = 1000; % number of samples
% Randomly arranging all rows with replacement
% randomSelect = randi(row); 
% ------

% ------
% Sampling without replacement
sample = 3050; % number of samples

disp("Randomizing dataset..");

% Randomly arranging all rows
randomSelect = randperm(row); 
% ------

disp("Creating training and test data sets..");
% Creating a new matrix with first 1000 rows
trainData = dataSet(randomSelect(1:sample), :);

% Dividing the matrix into features and their labels
xTrain = trainData(:,[1:11]);
yTrain = trainData(:,12);

[rowTrain,colTrain] = size(xTrain);

testData = dataSet(randomSelect(sample+1):row, :);

xTest = testData(:,[1:11]);
yTest = testData(:,12);

[rowTest,colTest] = size(xTest);

yTrain = split(yTrain);
yTest = split(yTest);

% while(choice!=3)

%	choice = input("Please enter which algorithm you want to use: ");

%	if (choice == 1)
		dist = 0;
		distance= zeros(rowTrain, rowTest);

		disp("Calculating euclidean distances between test data and training data..");

		for var1=1:rowTest
			for var2=1:rowTrain
				for var3=1:colTest
					dist += (xTest(var1,var3)^2) - (xTrain(var2,var3)^2);
				endfor
				% distance is stored var2,var1 to have smaller cols than rows(1000x599)
				distance(var2,var1) = sqrt(dist);
				dist = 0;
			endfor
		endfor

		disp("Sorting the distance vector..");
		[sortedArr,sortPos] = sort(distance);

		% disp(sortedArr);
		% disp(sortPos);

		k=1;
		% NOTE run k from 1 to rowTrain to see the range
		% k = input("\nInput the value of k (<1000): ");

		while(k <= sample)
			%disp("\n-----\nValue of k: ");
			%disp(k);
			yPredict = findNeighbors(k, yTrain, rowTest, sortPos);

%			disp("\nyTest:");
%			disp(yTest);
	
			accuracy = calcAccuracy(yPredict,yTest,rowTest);
			printf("\n%d,%d",k,accuracy);
%			printf("%d,",k);
			
%			calcAccuracy(yPredict,yTest,rowTest);
			if(k>=1 && k<20)
				k++;
			elseif(k==20)
				k=50;
			elseif(k>20)
				k+=50;
			endif
			%k = input("\nDo you want to try entering another value of k? (Exit: 0): ");

		endwhile
		disp("\nExiting..\n");

