function I = lbp(img)
[n, m] = size(img);
I = zeros(n, m, 'uint8');
for j = 2:m-1
    for i = 2:n-1
        nhood = nhood8(i, j);
        for k = 1:size(nhood, 1)
            I(i, j) = I(i, j)+(int8(img(nhood(k, 1),nhood(k, 2)))-int8(img(i,j))>= 0)* 2^(k-1);
        end
    end
end
end

function idx = nhood8(i, j)
idx = [
    i-1, j-1;
    i-1, j;
    i-1, j+1;
    
    i, j-1;
    i, j+1;

    i+1, j-1;
    i+1, j;
    i+1, j+1
];

end
