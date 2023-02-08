function f = tenfold(X,D,n)
% D is the original dimension of X
% n is the mode n expansion 
C = [1:n-1,n+1:length(D)];
f = ipermute(reshape(X,[D(n) D(C)]),[n C]);

end