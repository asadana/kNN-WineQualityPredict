
function label=pdlabel(Xt,X,Y)

% input Xt is a vector of 1*n where n is the number of examples
% X is the training examples fetures
% Y is the training examples label

	[m,n]=size(Xt);
	unqY=unique(Y);
	[my,ny]=size(unqY);
	[mx,nx]=size(X);

	eta=ones(my,1);

	for i=1:my

		temp=find(Y==unqY(i));   %find the positions where yi occurs

		for j=1:n

			unqxj=length(unique(X(:,j))); %find for the laplacian smoothing

			nr=length(find(X(temp,j)==Xt(:,j)));
			nr=nr+1;

			dr=mx+unqxj;

			eta(i,1)*=(nr/dr);

		end

		temp2=priprob(Y);
	
		temp3=temp2(i);

		eta(i)*=temp3;

	end


label=unqY(find(eta==max(eta)));


