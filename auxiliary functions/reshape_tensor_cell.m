function reshaped_tensor_cell = reshape_tensor_cell(tensor_cell, sizes)


num_tensors = length(tensor_cell);
reshaped_tensor_cell = cell(1, num_tensors);
for j = 1 : num_tensors
    ten = tensor_cell{j};
    ten = reshape(ten, sizes);
    reshaped_tensor_cell{j} = ten;
    
end