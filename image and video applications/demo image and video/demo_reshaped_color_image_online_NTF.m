%% get image

image = imread('four seasons japan.jpg');
image = im2double(image);


%% get image patch data, reshape


s = 10;
num_patches = 100;

patch_sizes_1 = [s, s, 3];
patch_sizes_2 = [s^2, 3];          
patch_sizes_3 = [3 * s^2, 1];

visual_patches_cell_1 = get_visual_patches_cell(image, patch_sizes_1, num_patches);
visual_patches_cell_2 = reshape_tensor_cell(visual_patches_cell_1, patch_sizes_2);
visual_patches_cell_3 = reshape_tensor_cell(visual_patches_cell_2, patch_sizes_3);



%% learn dictionaries

R = 10;
factor_cell_1 = online_NTF(visual_patches_cell_1, R);
factor_cell_2 = online_NTF(visual_patches_cell_2, R);
factor_cell_3 = online_NTF(visual_patches_cell_3, R);

dictionary_cell_1 = get_dictionary_cell(factor_cell_1);
dictionary_cell_2 = get_dictionary_cell(factor_cell_2);
dictionary_cell_3 = get_dictionary_cell(factor_cell_3);



%% display result


dictionary_cell_2 = reshape_tensor_cell(dictionary_cell_2, [s, s, 3]);
dictionary_cell_3 = reshape_tensor_cell(dictionary_cell_3, [s, s, 3]);
visual_cell = [dictionary_cell_1, dictionary_cell_2, dictionary_cell_3];

num_rows = 3;
display_visual_cell(visual_cell, num_rows);



