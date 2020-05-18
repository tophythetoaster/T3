function visual_patches_cell = get_visual_patches_cell(visual, patch_sizes, num_patches)

    sizzle = size(visual);
    m = sizzle(1);
    n = sizzle(2);
    
    a = patch_sizes(1);
    b = patch_sizes(2);
    
    dim_tensor = length(sizzle);
    

    visual_patches_cell = cell(1, num_patches);
    
    
    if dim_tensor == 2
        
        %grayscale image
        
        for k = 1 : num_patches
            i = randi([1, m - a + 1]);
            j = randi([1, n - b + 1]);
            patch = visual(i : i + a - 1, j : j + b - 1);
            visual_patches_cell{k} = patch;
        end
         
        
  elseif dim_tensor == 3
        %color image or grayscale video 
      
       for k = 1 : num_patches
           i = randi([1, m - a + 1]);
           j = randi([1, n - b + 1]);
           patch = visual(i : i + a - 1, j : j + b - 1, :);
           visual_patches_cell{k} = patch;
       end
                       
 
    elseif dim_tensor == 4
        
        %color video 
        
        for k = 1 : num_patches
            i = randi([1, m - a + 1]);
            j = randi([1, n - b + 1]);
            patch = visual(i : i + a - 1, j : j + b - 1, :, :);
            visual_patches_cell{k} = patch;
        end
      
             

    else
        error('invalid data: elements of cell must be either 2, 3 or 4 tensors');
    end
    
    

end