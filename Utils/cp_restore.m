% Reconstruct tensor from factors 

function U = cp_restore(X, A)
    
    sizes = size(X);
    
    result = randn(sizes);
    
    for i = 1:length(size(X))
        result(:,:,i) = A{3}(i,1)*(A{1}*A{2}.')+A3(i,2)*(A{3}*A{2}.');
    end


end
