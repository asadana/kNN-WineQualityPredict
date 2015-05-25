data=csvread('winequality-red-trim200.csv');

Xtest=data(:,[1:11]);

Ytest=data(:,12);

% implementing Naive Bayes
Ypd=zeros(size(Ytest,1),1);

for i=1:size(Xtest,1)
	Ypd(i)=pdlabel(Xtest(i,:),X,Y);
endfor

end


