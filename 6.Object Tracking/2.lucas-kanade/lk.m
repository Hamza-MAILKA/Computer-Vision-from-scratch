function [U, V, C] = lk(Im1, Im2, ws)
% (U, V): vitesses, C : coordonnées des coins dans Im1


% coins par utilisation Harris
C = corner(Im1);

% supprimer les coins dans les Bords
[m, n] = size(Im1);
w = round(ws/2); 
for i = 1:size(C, 1)
    x = C(i, 1);
    y = C(i, 2);
    if (x <= w) || (x >= n-w) 
        C(i,:) = -1;
    end
    if (y <= w) || (y >= m-w) 
        C(i,:) = -1;
    end
end

i = 0;
while i < size(C, 1)
    i = i+1;
    if C(i,1) == -1
        C(i,:) = [];
        i = i - 1;
    end
end

% nombre de coins
nc = size(C, 1);
U = zeros(nc, 1);
V = zeros(nc, 1);


Kx = 0.25 * [-1 1; -1 1];
Ky = 0.25 * [-1 -1; 1 1];
Kt = 0.25 * [-1 -1; -1 -1];

Dx = conv2(Im1, Kx) + conv2(Im2, Kx );
Dy = conv2(Im1, Ky) + conv2(Im2, Ky);
Dt = conv2(Im1, Kt) + conv2(Im2, -Kt);


for i = 1:nc
    x = C(i, 1); y = C(i, 2);
    Ix = Dx(y-w:y+w, x-w:x+w)';
    Iy = Dy(y-w:y+w, x-w:x+w)';
    It = Dt(y-w:y+w, x-w:x+w)';
    
    Ix = Ix(:); Iy = Iy(:); It = It(:);
    A = [Ix Iy];
    b = -It;
    
    X = pinv(A) * b;
    U(i) = X(1);
    V(i) = X(2);
end
end