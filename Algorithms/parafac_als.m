% PARAFAC: Alternating Least Squares (ALS)
function A = parafac_als(X, r)

    dim = size(X);
    N = length(dim);
    A = cell(N, 1);
    B = cell(N, 1);
    X_unfold = cell(N,1);
    
    for n = 1:N
        A{n} = randn(dim(n),r);
        A{n} = normc(A{n});
        X_unfold{n} = tenUnfold(X,n);
        B{n} = A{n}.'*A{n};
    end
    
    
    for j = 100
        for n = 1:N
            
            if n == N
                V = B{N-1};
                for i = 2:(N-1)
                    V = V*B{N-i};
                end
            else 
                V = B{N};
                for i = 1:(N-1)
                    if i ~= n
                        V = V*B{N-i};
                    end
                end
            end
            
            A{n} =  X_unfold{n} * KhatriRao(A{1:end ~= n}) * pinv(V);
            if n~= N
                A{n} = normc(A{n});
            end
            B{n} = A{n}.'*A{n};
        end
    
    end

end
