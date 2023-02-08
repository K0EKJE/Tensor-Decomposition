% n-mode multiplication

function Z = modeProduct(X,A,modes,direction)

    N = ndims(X);
    Z = X;

    % loop for calculating n-mode multiplication
    for i = 1:numel(modes)

        X_unf = tenUnfold(Z,modes(i)); % prepare mode-n X
        if strcmp(direction,'restore')
            tmp = A{i}*X_unf;
        elseif strcmp(direction,'expand')
            tmp = A{i}'*X_unf;
        else 
            error('direction must be "restore" or "expand"');
        end
        indices = 1:N;
        indices(modes(i)) = [];
        sizes = size(Z);

        tmp = reshape(tmp,[size(tmp,1),sizes(indices)]); 
        Z = permute(tmp,[2:modes(i),1,modes(i)+1:N]); %reshape for next n-mode multiplication
                
    end
end