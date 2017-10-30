function [ vectorList ] = getAllVectorsWithConstantWeight( vectSize, degree )
%GETALLVECTORSWITHCONSTANTWEIGHT Returns all binary vectors with constant
%degree
%   

vectorList = zeros(nchoosek(vectSize, degree), vectSize);
permutations = nchoosek(1:vectSize, degree);

for row = 1:length(vectorList(:,1))
    vectorList(row, permutations(row, :)) = 1;
end

end

