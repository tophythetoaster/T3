function data_cell = get_data_cell(dictionary, T)

data_cell = cell(1, T);


if ~iscell(dictionary)
    W = dictionary;
    [m, r] = size(W);
    for t = 1 : T
        c = rand(r, 1);
        x = W * c;
        data_cell{t} = x;
    end

else

    dictionary_cell = dictionary;
    R = length(dictionary_cell);

    for t = 1 : T
        c = rand(1, R);
        X = lincomb(c, dictionary_cell);
        data_cell{t} = X;
    end

    
end
