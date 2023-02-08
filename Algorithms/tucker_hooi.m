
% Based on Higher Order Orthogonal Iteration 
% Multilinear operators for higher-order decompositions by Tamara G. Kolda

% [core, A] outputs the core matrix and a cell of factors
% X is the tensor for decomposition
% R is a cell containing the ranks of each mode 
% iter limits total number of iterations 


function [core,A] = tucker_hooi(X,iter,R)

    N = ndims(X);
    A = cell(N,1);
%     R = randn(N,1);
%     for n = 1:N
%         R(n) = rank(tenUnfold(X,n));
%     end


    for i = 1:iter+1 % use the extra loop for initialization 
        for n = 1:N
            modes = 1:N;
            modes(n) = [];
            if i == 1 
                X_unf = tenUnfold(X,n);
            else
                Z = modeProduct(X,{A{modes(:)}},modes,"expand"); 
                X_unf = tenUnfold(Z,n); % conduct mode product and unfold 

            end
            if R(n) < size(X,n) % A few eigenvectors are sought
                [A{n},~] = eigs(X_unf*X_unf',R(n));
            else % All eigenvectors are sought
                [V,D] = eig(X_unf*X_unf');
                % Eig returns unsorted eigenvectors, we have to sort them
                [~,indices] = sort(diag(D));
                A{n} = V(:, indices(end:-1:1));
            end

        end
    end

    core = modeProduct(Z,{A{N}},N,"expand"); % update core tensor
end
