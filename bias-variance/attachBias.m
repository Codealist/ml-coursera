function M = attachBias(Matrix)

M = [ones(size(Matrix, 1), 1) Matrix];