function f = tenUnfold(X,n)
% Tensor unfolding for tensor with size of n1*n2*...*nd
% dim = (n1,n2,...,nd)
I = size(X); 
C = [1:n-1,n+1:length(I)];
K = prod(I(C));
f = reshape(permute(X,[n C]),I(n),K);

end