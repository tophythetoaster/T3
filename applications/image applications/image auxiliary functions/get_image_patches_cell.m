function image_patches_cell = get_image_patches_cell(image, patch_length, patch_width, num_patches)
    
    %image should already be converted to double via im2double (DON'T JUST CAST TO DOUBLE)

    sizes = size(image);
    m = sizes(1);
    n = sizes(2);
    
    a = patch_length;
    b = patch_width;
    
    image_patches_cell = cell(1, num_patches);
    
    c = length(sizes);
    
    switch c
        case 2
            for p = 1 : num_patches
                i = randi([1, m - a + 1]);
                j = randi([1, n - b + 1]);
                patch = image(i : i + a - 1, j : j + b - 1);
                image_patches_cell{p} = patch;
            end  
        case 3
            for p = 1 : num_patches
                i = randi([1, m - a + 1]);
                j = randi([1, n - b + 1]);
                patch = image(i : i + a - 1, j : j + b - 1, :);
                image_patches_cell{p} = patch;
            end
        otherwise
            error('INVALID IMAGE DATA!!!!!')
    end
       


end