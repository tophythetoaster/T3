function concatenated_video_cell = concatenate_video_cell(video_cell, num_rows, num_cols)

num_videos = length(video_cell);

vid1 = video_cell{1};
sizes = size(vid1);
m = sizes(1);
n = sizes(2);

space = 5;
M = num_rows * (m + space) + space + 1;
N = num_cols * (n + space) + space + 1;


switch length(sizes)
    %grayscale video
    case 3
        T = sizes(3);
        concatenated_video_cell = 255 * ones(M, N, T);
        v = 1;
        for i = 1 : num_rows
            for j = 1 : num_cols
                if v <= num_videos
                    a = (m + space) * (i - 1) + space + 1;
                    b = (n + space) * (j - 1) + space + 1;
                    concatenated_video_cell(a : a + m - 1, b : b + n - 1, :) = video_cell{v};
                end
                v = v + 1;
            end
        end
        
        concatenated_video_cell = im2uint8(concatenated_video_cell);
             
        
    %color video 
    case 4
        T = sizes(4);
        concatenated_video_cell = 255 * ones(M, N, 3, T);
        v = 1;
        for i = 1 : num_rows
            for j = 1 : num_cols
                if v <= num_videos
                    a = (m + space) * (i - 1) + space + 1;
                    b = (n + space) * (j - 1) + space + 1;
                    concatenated_video_cell(a : a + m - 1, b : b + n - 1, :, :) = video_cell{v};
                end
                v = v + 1;
            end
        end
        
        concatenated_video_cell = im2uint8(concatenated_video_cell);

        
    otherwise
        error('INVALID VIDEO CELL');
        
end


end