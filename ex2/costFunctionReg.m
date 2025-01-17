function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

for var =1:m
    J=J+(-y(var)*log(sigmoid(dot(theta,X(var,:))))-(1-y(var))*log(1-sigmoid(dot(theta,X(var,:)))));
end
for var =2:length(theta)
    J=J+(lambda/2)*(theta(var)*theta(var));
end
J=J/m;
for var =1:m
    grad=grad+(sigmoid(dot(theta,X(var,:)))-y(var))*X(var,:)';
end
for var=2:length(theta)
    grad(var)=grad(var)+lambda*theta(var);
end
grad=grad/m;
% =============================================================

end
