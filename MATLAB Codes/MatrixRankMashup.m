clc;
close;
clear;

%% Some parameters
K = 8; % number of packets
N = 10; % number of servers
M = 5; % number of users
d = ceil(log2(K)); % degree - log2(K) is a good assumption

dict = getAllVectorsWithConstantWeight(K, d); % vector dictionary
[vectorCount, ~] = size(dict); % number of possible vectors

% Have a random network code in servers
used = zeros(1, N);
A = zeros(N, K);
for idx = 1:N
    selected = randi([1 vectorCount]);
    while ~isempty(find(used == selected, 1))
        selected = randi([1 vectorCount]);
    end
    A(idx, :) = dict(selected, :);
    used(idx) = selected;
end

% Channel erasure rate
p = 0.7;

% Transmit packets
wants = rand(M, K) < p; % with probability p, we need a retransmission

Kbar = zeros(1, M);
fullRanksCount = zeros(1, M);
for m = 1:M
    % Wanted bit count and effective network code of servers (eliminate bits we
    % have)
    Kbar(m) = sum(wants(m, :));
    Abar = A(:, wants(m, :));

    % Let us get all possible selections of Kbar rows out of N rows
    C = nchoosek(1:N, Kbar(m));
    [nk, ~] = size(C); % nk = nchoosek(N, Kbar)

    % Calculate rank(A) for each possible selection
    fullRanks = [];
    for idx = 1:nk
        if rank(Abar(C(idx, :), :)) == Kbar(m)
            fullRanksCount(m) = fullRanksCount(m) + 1;
            fullRanks(fullRanksCount(m), :) = C(idx, :);
        end
    end
end