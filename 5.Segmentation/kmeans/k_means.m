function [c_map,V] = k_means(im, clusterNo, maxIter)
% c_map : les indices de cluster de chaque pixel 
% V     : les centres de gravité du cluster.

[pixelNo,nnn] = size(im)

% random initialisation entre 0 et 255 de "clusterNo" valeur
randIndices = randperm(pixelNo,clusterNo);
centers = double(im(randIndices,:));
D = zeros(clusterNo,pixelNo); % Distance matrix
for iter=1:maxIter
    D = pdist2(centers,im);% Calcul la distance eucledian 
    % cluster de chaque pixel :les valeurs de distance minimum
    [~,min_indices] = min(D); 
    % Mettre à jour les centres de cluster
    old_centers = centers;
    for j=1:clusterNo 
        centers(j,:) = mean(im(min_indices ==j,:));
    end 
       % Vérification la convergence

    if sum(sum(abs(old_centers-centers))) == 0 
        display(['Centers converged in ' num2str(iter) ' iteration.' ]);
        break;
    end
end

if iter == maxIter
    display(['Centers could not converged in ' num2str(maxIter) ' iteration.' ]);
end

c_map = min_indices';
V = centers;
end