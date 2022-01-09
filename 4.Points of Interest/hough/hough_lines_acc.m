function [H, theta, rho] = hough_lines_acc(BW)
    %%% discrétisation de l'espace de hough 
    theta = -90:1:89;
    dMax = sqrt((size(BW,1) - 1) ^ 2 + (size(BW,2) - 1) ^ 2);
    diagonal =ceil(dMax) ;
    rho = -diagonal : diagonal;% rho: from -diagonal to diagonal
    %%% Initialisation de l'accumulateur 
    numRho = 2 * ceil(dMax) + 1;
    numTheta = length(theta);
    H = zeros(numRho, numTheta);
    for i = 1 : size(BW,1)
        for j = 1 : size(BW,2)
            if (BW(i, j))
                for k = 1 : numTheta
                    temp = j * cos(theta(k) * pi / 180) + i * sin(theta(k) * pi / 180);
                    rowIndex = round(temp + diagonal) + 1;
                    H(rowIndex, k) = H(rowIndex, k) + 1;                   
                end
            end            
        end
    end    
end
