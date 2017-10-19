clear; clc;

n = 10;
K = 3;
z = 5;

NODES = zeros(11, 11, 2); % initialization of node probs
NODES(1, 1, 1) = 1;
NODES(1, 1, 2) = 0;

for i = 1:n+1
    for w = max(1, i-z):min(i, z + 1)
        NODES(i, w, 2) = (z - (w - 1))/(n - (i - 1));
        NODES(i, w, 1) = 1 - NODES(i, w, 2);
    end
end