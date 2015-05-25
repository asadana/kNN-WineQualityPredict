% function to calculate the probability distribution of a variable A for %all possible values of A 
% also taken into account laplacian smoothing
function p=priprob(A)

	m=size(A,1); #extract the size of the column to find the probability

	unv=unique(A);
	unv=sort(unv);
	p=zeros(1,size(unv,2)); #create a row vector to define the probability of all the possible outcomes


	p=histc(A,unv); #input the count value

	p=(p+1)/(m+size(p,2)); #gives you the probability value now

