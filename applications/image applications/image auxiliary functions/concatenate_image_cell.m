function concatenated_image_cell = concatenate_image_cell(image_cell, num_rows, num_cols)

%note this converts to uint8 for you via im2uint8 (DO NOT JUST CAST!!!)

num_images = length(image_cell);

im1 = image_cell{1};
sizes = size(im1);
m = sizes(1);
n = sizes(2);

space = 5;
M = num_rows * (m + space) + space + 1;
N = num_cols * (n + space) + space + 1;


switch length(sizes)
    %grayscale image
    case 2
        concatenated_image_cell = 255 * ones(M, N);
        v = 1;
        for i = 1 : num_rows
            for j = 1 : num_cols
                if v <= num_images
                    a = (m + space) * (i - 1) + space + 1;
                    b = (n + space) * (j - 1) + space + 1;
                    concatenated_image_cell(a : a + m - 1, b : b + n - 1) = image_cell{v};
                end
                v = v + 1;
            end
        end
        
        concatenated_image_cell = im2uint8(concatenated_image_cell);
             
        
    %color image 
    case 3
        concatenated_image_cell = 255 * ones(M, N, 3);
        v = 1;
        for i = 1 : num_rows
            for j = 1 : num_cols
                if v <= num_images
                    a = (m + space) * (i - 1) + space + 1;
                    b = (n + space) * (j - 1) + space + 1;
                    concatenated_image_cell(a : a + m - 1, b : b + n - 1, :, :) = image_cell{v};
                end
                v = v + 1;
            end
        end
        
        concatenated_image_cell = im2uint8(concatenated_image_cell);

        
    otherwise
        error('INVALID IMAGE CELL');
        
end


end