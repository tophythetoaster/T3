classdef options < handle
    
    properties
        num_its
        lambda
        key 
        initialization
        rho
    end
    
    
    methods
        
        function obj = options()
            obj.num_its = 50;
            obj.lambda = 0;         %l1 regularization parameter
            obj.key = 'mu';
            obj.rho = 1;            %used for admm
        end
        
        function set.num_its(obj, num_its)
            obj.num_its = num_its;
        end
        
        function set.lambda(obj, lambda)
            obj.lambda = lambda;
        end
        
        function set.key(obj, key)
            obj.key = key;
        end
        
        function set.rho(obj, rho)
            obj.rho = rho;
        end
        

    end

    
end