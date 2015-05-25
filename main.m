
dataSet=csvread('winequality-red-noTitles.csv');

[row,col] = size(dataSet);


% Sampling without replacement:

sample = 1000; % number of samples

randomSelect = randperm(row); 

trainData = dataSet(randomSelect(1:sample), :);

xTrain = trainData(:,[1:11]);
yTrain = trainData(:,12);

[rowTrain,colTrain] = size(xTrain);

testData = dataSet(randomSelect(sample+1:row), :);

xTest = testData(:,[1:11]);
yTest = testData(:,12);

[rowTest,colTest] = size(xTest);

for i=0:rowTest
	for j=0:rowTrain
		for k=0:colTest
			dist = sqrt( (xTest[i,k])^2 - (xTrain[j,k])^2 );
			%dist = euclideanDist(xTest,xTrain,i,j,k);
			distance(i,k) = dist;
		endfor
	endfor
endfor

%dist(i,j,k) = euclideanDist(xTrain[i,j]



% euclidean
%x=[5,4,0.5,0.1];
%y=[2,2,0.2,0.3];

%disp(sqrt(x.^2 - y.^2));




% Sampling with replacement:

%sample = 1000; % number of samples

%randomSelect = randi(row); 

%trainData = dataSet(randomSelect(1:sample), :);

%testData = dataSet(randomSelect(sample+1:row), :);
