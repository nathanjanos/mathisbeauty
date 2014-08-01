function mandelbrot_city_roads()

figure; hold on;

num_roads = 1000;

xmin = -4000;
xmax = 4000;
ymin = -4000;
ymax = 4000;

r = 1;
xr = 0;
yr = 0;
for i = 1:num_roads
    jmax = randi(100);
    for j = 1:randi(100)
        k = log(j+10);
        c = j/10;
        line([randn()*(xmax-xmin)+xr*k randn()*(xmax-xmin)+yr*k],...
            [randn()*(ymax-ymin)+xr*k randn()*(ymax-ymin)+yr*k],...
            'Color', [mod(rand()*r+c,1) mod(rand()*r+c,1) mod(rand()*r+c,1)],...
            'LineWidth', rand()*r*10/j);
    end
    r = abs(r + randn()/100);
    xr = xr + 200*randn();
    yr = yr + 200*randn();
end

axis square;
axis off;

end