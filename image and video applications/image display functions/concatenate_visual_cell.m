function concatenated_visual = concatenate_visual_cell(visual_cell, num_rows)

    
    num_visuals = length(visual_cell);
    visual_1 = visual_cell{1};
    sizzle = size(visual_1);
    a = sizzle(1);
    b = sizzle(2);
    dim_tensor = length(sizzle);
    
    space = 5; 
    num_cols = ceil(num_visuals / num_rows);
    
    
    
    
    
    
    if dim_tensor == 2
        
        %grayscale image
        m = (a + space - 1) * num_rows + 2 * space + 1;
        n = (b + space - 1) * num_cols + 2 * space + 1; 
        Sizzle = [m, n];
        concatenated_visual = 255 * ones(Sizzle, 'uint8');
        
        for i = 1 : num_rows
            for j = 1 : num_cols
                
                idx = num_rows * (i - 1) + j;
                if idx  <= num_visuals
                    visual = visual_cell{idx};
                    I = (a + space) * (i - 1) + space + 1;
                    J = (b + space) * (j - 1) + space + 1;
                    concatenated_visual(I : I + a - 1, J : J + b - 1) = visual;
                end
            end
        end
        
        
        
        
        
        
    elseif dim_tensor == 3
        
        c = sizzle(3);
        if c == 3
            
            %just assume this is a color image, not a grayscale video with
            %3 frames lol 
            
            m = (a + space - 1) * num_rows + 2 * space + 1;
            n = (b + space - 1) * num_cols + 2 * space + 1; 
            Sizzle = [m, n, 3];
            concatenated_visual = 255 * ones(Sizzle, 'uint8');
        
            for i = 1 : num_rows
                for j = 1 : num_cols

                    idx = num_rows * (i - 1) + j;
                    if idx  <= num_visuals
                        visual = visual_cell{idx};
                        I = (a + space) * (i - 1) + space + 1;
                        J = (b + space) * (j - 1) + space + 1;
                        concatenated_visual(I : I + a - 1, J : J + b - 1, :) = visual;
                    end
                end
            end
            
        else
            
            %grayscale video 
            
            m = (a + space - 1) * num_rows + 2 * space + 1;
            n = (b + space - 1) * num_cols + 2 * space + 1; 
            T = c;
            Sizzle = [m, n, T];
            concatenated_visual = 255 * ones(Sizzle, 'uint8');
        
            for i = 1 : num_rows
                for j = 1 : num_cols

                    idx = num_rows * (i - 1) + j;
                    if idx  <= num_visuals
                        visual = visual_cell{idx};
                        I = (a + space) * (i - 1) + space + 1;
                        J = (b + space) * (j - 1) + space + 1;
                        concatenated_visual(I : I + a - 1, J : J + b - 1) = visual;
                    end
                end
            end
            
        end
        
        
        
        
    elseif dim_tensor == 4
        
        %color video 
             
        m = (a + space - 1) * num_rows + 2 * space + 1;
        n = (b + space - 1) * num_cols + 2 * space + 1; 
        T = sizzle(4);
        Sizzle = [m, n, 3, T];
        concatenated_visual = 255 * ones(Sizzle, 'uint8');
        
        for i = 1 : num_rows
            for j = 1 : num_cols

                idx = num_rows * (i - 1) + j;
                if idx  <= num_visuals
                    visual = visual_cell{idx};
                    I = (a + space) * (i - 1) + space + 1;
                    J = (b + space) * (j - 1) + space + 1;
                    concatenated_visual(I : I + a - 1, J : J + b - 1, :, :) = visual;
                end
            end
        end
 
        

    else
        error('invalid data: elements of cell must be either 2, 3 or 4 tensors');
    end
    
    
    
    


end










