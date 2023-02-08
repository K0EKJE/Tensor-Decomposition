% HOSVD - Higher Order Singular Value Decomposition


function [core, A] = hosvd(X)   
    N = ndims(X);
    A = cell(N,1);
    R = randn(N,1);

    for n = 1:N
        R(n) = rank(tenUnfold(X,n));
    end

    for n = 1:N

        X_unf = tenUnfold(X,n);

        if R(n) < size(X,n) % A few eigenvectors are sought
            [A{n},~] = eigs(X_unf*X_unf',R(n));
        else % All eigenvectors are sought
            [V,D] = eig(X_unf*X_unf');
            % Eig returns unsorted eigenvectors, we have to sort them
            [~,indices] = sort(diag(D));
            A{n} = V(:, indices(end:-1:1));
        end

    end


    core = modeProduct(X,{A{N}},N,"expand"); % update core tensor
end
