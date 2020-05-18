function grayscale_cell = get_grayscale_cell(color_cell)
    
    num_patches = length(color_cell);
    grayscale_cell = cell(1, num_patches);
    for j = 1 : num_patches
        
        patch = color_cell{j};
        patch = double(patch);      %needed in case patch is stored as tensor
        patch = im2uint8(patch);    %proper way to convert from double to uint8
        patch = rgb2gray(patch);    %proper way to convert color to grayscale
        grayscale_cell{j} = patch;
            
    end

end