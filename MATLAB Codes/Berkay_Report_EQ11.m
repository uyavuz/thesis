clear; clc;

NUMBER_OF_ITERATIONS = 1e5;
z = 5;
K = 3;
n = 10;

dict = zeros(nchoosek(n, z), n);
permutations = nchoosek(1:n, z);

for row = 1:length(dict(:,1))
    dict(row, permutations(row, :)) = 1;
end

count = 0;
for idx = 1:NUMBER_OF_ITERATIONS
    selected = zeros(K, n);
    selectedIdx = zeros(1, K);
    for k = 1:K
        cand = floor(rand() * nchoosek(n, z)) + 1; 
        while sum(selectedIdx == cand) > 0
            cand = floor(rand() * nchoosek(n, z)) + 1;
        end
        selectedIdx(k) = cand;
        selected(k, :) = dict(cand, :);
    end
    count = count + (sum(mod(sum(selected), 2)) == z);
    
end

sim_res = count / NUMBER_OF_ITERATIONS;

alpha = z/n;
beta = 1 - alpha;

psub = @(k, temp) nchoosek(k, temp) * alpha^temp * beta^(k - temp);
p = 0;
q = 0;
for idx = 1:2:K
    p = p + psub(K, idx);
end
for idx = 0:2:K
    q = q + psub(K, idx);
end

P = nchoosek(n, z) * p^z * q^(n - z);