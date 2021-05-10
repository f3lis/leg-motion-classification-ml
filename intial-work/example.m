% example object
% label = ("walk", "run", or "jump")
% data = {[x_acc1, x_acc2 ...], ... [abs_acc1, abs_acc2 ...]}
classdef example
    properties
        label % string 
        data % cell array of 1 x N matricies
    end
    methods
        function obj = example(label, data)
            obj.label = label;
            obj.data = data;
        end
    end
end