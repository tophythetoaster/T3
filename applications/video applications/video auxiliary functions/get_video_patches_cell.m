function video_patches_cell = get_video_patches_cell(video, patch_length, patch_width, num_patch_frames, num_patches)

    %image should already be converted to double via im2double (DON'T JUST CAST TO DOUBLE)

    sizes = size(video);
    m = sizes(1);
    n = sizes(2);
    
    a = patch_length;
    b = patch_width;
    T_short = num_patch_frames;
    
    video_patches_cell = cell(1, num_patches);
    
    c = length(sizes);
    
    switch c
        %grayscale video
        case 3
            T = length(video(1, 1, :));
            for p = 1 : num_patches
                i = randi([1, m - a + 1]);
                j = randi([1, n - b + 1]);
                t = randi([1, T - T_short + 1]);
                patch = video(i : i + a - 1, j : j + b - 1, t : t + T_short - 1);
                video_patches_cell{p} = patch;
            end  
            
        %color video
        case 4
            T = length(video(1, 1, 1, :));
            for p = 1 : num_patches
                i = randi([1, m - a + 1]);
                j = randi([1, n - b + 1]);
                t = randi([1, T - T_short + 1]);
                patch = video(i : i + a - 1, j : j + b - 1, :, t : t + T_short - 1);
                video_patches_cell{p} = patch;
            end
        otherwise
            error('INVALID IMAGE DATA!!!!!')
    end