function X = outerproduct(varargin)
% Input: vectors a1, a2, ... an.
% Output: X, the outer product of a1 o a2 o ... o aN
%
% can be found @ https://github.com/sderooij/tnkf_lssvm_seizure_detect/blob/56e06bcf3d5d6902e59b0152da9b9656ff2a004c/classification/Tensor_Functions/outerproduct.m
%% 
if nargin == 0
    X = [];
    return
elseif nargin == 1
    X = varargin;
    return
end

% Initialize X to be a column vector
if size(varargin{1},1)<size(varargin{1},2)
    X = varargin{1}';
else
    X = varargin{1};
end

% perform outerproduct
for k = 2:nargin
    b = reshape(varargin{k},[ones(1,k-1) length(varargin{k})]);
    X =  X.*b;
end

end
