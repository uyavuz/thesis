classdef StreamServer < handle
    %STREAMSERVER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        StreamLength = 10;
    end
    
    methods
        function obj = BasicClass(k)
            if nargin == 1
                if isnumeric(k)
                    obj.StreamLength = k;
                end
            end
        end
    end
    
end

