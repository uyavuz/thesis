classdef Server < handle
    %SERVER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = public)
        Id
        Name
        Location
    end
    
    methods
        function obj = Server(id, name, location)
            if nargin == 2
                obj.Id = id;
                obj.Name = name;
            elseif nargin == 3
                obj.Id = id;
                obj.Name = name;
                obj.Location = location;
            else
                error('Server object requires 2 or 3 arguments.')
            end
        end
    end
    
end

