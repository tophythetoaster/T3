%% import visual data

image = imread('palette.jpg');
grayscale_image = rgb2gray(image);

visual = im2double(image);
grayscale_visual = im2double(grayscale_image);      %worth checking to see what happens if you use rgb2gray directly on visual, not image




%%
s = 20;
patch_sizes = [s, s, 3];
grayscale_patch_sizes = [s, s];

num_patches = 200;

visual_patches_cell = get_visual_patches_cell(visual, patch_sizes, num_patches);
grayscale_visual_patches_cell = get_visual_patches_cell(grayscale_visual, grayscale_patch_sizes, num_patches);



%%

R = 10;

factor_cell = online_NTF(visual_patches_cell, R);
dictionary_cell = get_dictionary_cell(factor_cell);

grayscale_factor_cell = online_NTF(grayscale_visual_patches_cell, R);
grayscale_dictionary_cell = get_dictionary_cell(grayscale_factor_cell);



%%

grayscale_dictionary_cell_2 = get_grayscale_cell(dictionary_cell);

visual_cell = {dictionary_cell{:}, grayscale_dictionary_cell{:}, grayscale_dictionary_cell_2{:}};

num_rows = 3;
display_visual_cell(visual_cell, num_rows);







