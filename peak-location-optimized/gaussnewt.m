function a = gaussnewt(t,acc)
% Application of Gauss-Newton method with a polynomial of degree 2
% of a quadratic fit to apply as a Gaussian
% Inputs: time, acceleration data 
% Outputs: Array a enlisting coefficient values
tol = 0.0001;
imax = 50;
n = length(t);
a = [-0.001,-0.001,0.001]; % Approximate starting values
for i = 1:imax
    a0 = a(1);
    a1 = a(2);
    a2 = a(3);
    for i = 1:n
        % quadratic function being used as a model for regression
        h(i) = a0.*t(i)^2 + a1.*t(i) + a2;
        dh_a = t(i)^2;
        dh_b = t(i);
        dh_c = 1;
        J(i,1) = dh_a; % Jacobian coeff 1
        J(i,2) = dh_b; % Jacobian coeff 2
        J(i,3) = dh_c; % Jacobian coeff 3
        d(i) = acc(i) - h(i); % Residual matrix
    end
    ea = (J'*J)\(J'*d');
    a = a + ea';
    output = [i a ea'];
    if (abs(ea(1)) < tol && abs(ea(2)) < tol) % Check approximate error
        disp('Gauss-Newton method converged.');
        break
    end
end
end

