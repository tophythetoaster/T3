function display_visual_cell(visual_cell, num_rows)


    num_visuals = length(visual_cell);
    num_cols = ceil(num_visuals / num_rows);
    
    figure;
    for k = 1 : num_visuals
        subplot(num_rows, num_cols, k);
        visual = visual_cell{k};
        visual = double(visual);
        visual = im2uint8(visual);
        imshow(visual);
    end










