function peaks = hough_peaks(H)
    numpeaks = 8;
    threshold = 0.5 * max(H(:)); 
    nHoodSize = floor(size(H)/10) * 2 + 1
    peaks = zeros(numpeaks, 2);
    num = 0;
    while(num < numpeaks)
        maxH = max(H(:));
        [r,c] = find(H == maxH);
        if (maxH >= threshold)
            num = num + 1;
            peaks(num,:) = [r(1),c(1)];
            rStart = max(1, r - (nHoodSize(1) - 1) / 2);
            rEnd = min(size(H,1), r + (nHoodSize(1) - 1) / 2);
            cStart = max(1, c - (nHoodSize(2) - 1) / 2);
            cEnd = min(size(H,2), c + (nHoodSize(2) - 1) / 2);
            for i = rStart : rEnd
                for j = cStart : cEnd
                        H(i,j) = 0;
                end
            end
        else
            break;          
        end
    end
    peaks = peaks(1:num, :);            
end
