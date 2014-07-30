function [x, y, d] = koch_curve(iter)

T = 100;

x = [0; T; T/2; 0];
y = [0; 0; T*3^(1/2)/2; 0];
d = [1; 4; 6; 1];

for i = 2:iter
    len = 3*4^(i-1);
    x_next = zeros(len, 1);
    y_next = zeros(len, 1);
    d_next = zeros(len, 1);
    idx = 1;
    for j = 1:length(d)
        if d(j) == 1
            d_next(idx:idx+3) = [1, 2, 3, 1]';
        elseif d(j) == 2
            d_next(idx:idx+3) = [2, 6, 1, 2]';
        elseif d(j) == 3
            d_next(idx:idx+3) = [3, 1, 4, 3]';
        elseif d(j) == 4
            d_next(idx:idx+3) = [4, 3, 5, 4]';
        elseif d(j) == 5
            d_next(idx:idx+3) = [5, 4, 6, 5]';
        elseif d(j) == 6
            d_next(idx:idx+3) = [6, 5, 2, 6]';
        end
        x_next(idx:idx+3) = x_trans(x(j), d_next(idx:idx+3), T, i);
        y_next(idx:idx+3) = y_trans(y(j), d_next(idx:idx+3), T, i);
        idx = idx + 4;
    end
    x = x_next;
    y = y_next;
    d = d_next;
end
%line(x, y);
plot(x, y, 'k');
axis square;
end

function xt = x_trans(x, d, T, iter)
xt = zeros(4, 1);
xt(1) = x;
for i = 1:3
    if d(i) == 1
        xt(i+1) = x + T/3^(iter-1);
    elseif d(i) == 2
        xt(i+1) = x + T/(2*3^(iter-1));
    elseif d(i) == 3
        xt(i+1) = x + T/(2*3^(iter-1));
    elseif d(i) == 4
        xt(i+1) = x - T/(2*3^(iter-1));
    elseif d(i) == 5
        xt(i+1) = x - T/3^(iter-1);
    elseif d(i) == 6
        xt(i+1) = x - T/(2*3^(iter-1));
    end
    x = xt(i+1);
end
end

function yt = y_trans(y, d, T, iter)
yt = zeros(4,1);
yt(1) = y;
for i = 1:3
    if d(i) == 1
        yt(i+1) = y;
    elseif d(i) == 2
        yt(i+1) = y - 3^(1/2)*T/(2*3^(iter-1));
    elseif d(i) == 3
        yt(i+1) = y + 3^(1/2)*T/(2*3^(iter-1));
    elseif d(i) == 4
        yt(i+1) = y + 3^(1/2)*T/(2*3^(iter-1));
    elseif d(i) == 5
        yt(i+1) = y;
    elseif d(i) == 6
        yt(i+1) = y - 3^(1/2)*T/(2*3^(iter-1));
    end
    y = yt(i+1);
end
end
