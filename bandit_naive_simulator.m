function bandit_naive_simulator()

num_layouts = 10;
max_rps = 1;
rps_mean = linspace(0,max_rps,num_layouts) + 0.1;
%rps_mean = ones(num_layouts,1)*1;
rps_hist = {};
for i = 1:num_layouts
    rps_hist{i} = rps_mean(i);
end
N = 1;
m = ones(num_layouts,1);
iter = 1000;
mean_bound = zeros(num_layouts,1);

for i = 1:iter
    for j = 1:num_layouts
        mean_hist(j) = mean(rps_hist{j});
    end
    r = rand();
    s = sum(mean_hist);
    mean_hist_norm = mean_hist/s;
    mean_range = zeros(num_layouts,1);
    for k = 1:num_layouts-1
        mean_range(k+1) = sum(mean_hist_norm(1:k));
    end
    idx = find(r > mean_range);
    idx_max = idx(length(idx));
    new_rps = rps_mean(idx_max) + rand();
    rps_hist{idx_max} = [rps_hist{idx_max} new_rps];
    m(idx_max) = m(idx_max) + 1;
    N = N + 1;
end

m

total_payout = 0;
for i = 1:num_layouts
    total_payout = total_payout + sum(rps_hist{i});
end
total_payout

end

