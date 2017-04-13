

function [C, I, iter] = kmeansfinal(X, K, maxiter, TOL)

% number of vectors in X
[row, dim] = size(X);

% compute a random permutation of all input vectors
R = randperm(row);

% construct indicator matrix (each entry corresponds to the cluster
% of each point in X)
I = zeros(row, 1);

% construct centers matrix
C = zeros(K, dim);

% take the first K points in the random permutation as the center sead
for k=1:K
    C(k,:) = X(R(k),:);
end

% iteration 
iter = 0;


while 1
    % find closest point
    for n=1:row
        % find closest center to current input point
        min1 = 1;
        min2 = norm(X(n,:) - C(min1,:), 1);
        for j=1:K
            dist = norm(C(j,:) - X(n,:), 1);
            if dist < min2
                min1 = j;
                min2 = dist;
            end
        end
        
        
        I(n) = min1;
    end
    
    
    for k=1:K
        C(k, :) = sum(X(find(I == k), :));
        C(k, :) = C(k, :) / length(find(I == k));
    end
    
  
    RSS_error = 0;
    for idx=1:row
        RSS_error = RSS_error + norm(X(idx, :) - C(I(idx),:), 2);
    end
    RSS_error = RSS_error / row;
    
   
    iter = iter + 1;
    
    % check stopping criteria
    if 1/RSS_error < TOL
        break;
    end
    
    if iter > maxiter
        iter = iter - 1;
        break;
    end
end


