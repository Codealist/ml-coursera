function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
#C = 1;
#sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
C_vec   = [0.01, 0.03, 0.1, 0.3, 1,   3,   10,   30];
Sig_vec = [0.1,  0.6,  1.2, 2.4, 4.8, 9.6, 19.2, 38.4];

best_pair = [0.01, 0.1];
lowest_error = 100000;

for i = 1:length(C_vec)
	C = C_vec(i);
	for j = 1:length(Sig_vec)
		sigma = Sig_vec(j);
		model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		
		predictions = svmPredict(model, Xval);
		error = mean(double(predictions ~= yval));
		
		if (error < lowest_error)
			fprintf('New best global constants: C = %f, sig = %f ...\n', C, sigma);
			lowest_error = error;
			best_pair = [C, sigma];
		endif
end

C = best_pair(1);
sigma = best_pair(2);

% =========================================================================

end
