%% import visual data
visual = imread('Tom.jpg');
visual = rgb2gray(visual);
visual = im2double(visual);


%% extract visual patches from visual data
patch_sizes = [20, 20];
num_patches = 200;
visual_patches_cell = get_visual_patches_cell(visual, patch_sizes, num_patches);


%% online-NTF

R = 15;
factor_cell = online_NTF(visual_patches_cell, R);
dictionary_cell = get_dictionary_cell(factor_cell);


%% display
num_rows = 5;
display_visual_cell(dictionary_cell, num_rows);
