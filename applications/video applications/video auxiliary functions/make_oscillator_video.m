function video = make_oscillator_video(n, omegas, T)

h = .01;
num_frequencies = length(omegas);
colors = colormap('hsv');
close;

video = zeros(n, n, 3, T);

for i = 1 : n
    for j = 1 : n
         idx = randi([1, num_frequencies]);
         for t = 1 : T
            omega = omegas(idx);
            intensity = .5 * (1 + sin(2 * pi * h * omega * t));
            color = colors(4 * omega, :);      %omega between 1 and 64, integer (or just round...)
            video(i, j, :, t) = intensity * color;
         end
    end
end


%video = im2uint8(video);


