

close all;

for i=1:10
    
    clear all;
    
    % set algorithm parameters
    t = 0.0004;
    ITER = 30;
    kcluster = 3;
    
    % initialize random data points
    X = [1000*randn(1000,2) + 1000; 2000*randn(1000,2) + 5000];
   
    % k-Means on random data
    tic;
    [C, I, iter] = myKmeans(X, kcluster, ITER, t);
    toc
    
    
    disp(['k-means took ' int2str(iter) ' iterations']);
    
  
    colors = {'red', 'green', 'blue'};
    
    % show plot of clustering
    figure;
    for i=1:kcluster
       hold on, plot(X(find(I == i), 1), X(find(I == i), 2), '.', 'color', colors{i});
    end
    
  
    pause;
end


pause;
close all;