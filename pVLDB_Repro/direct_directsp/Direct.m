% This function solves the quadratic programming in the form of:
%        min  1/2x'x - c'x
%        s.t. Ax = b                                                        
% Input:
%       A: n by m matrix
%       b: n by 1 vector
%       c: m by 1 vector
% Output:
%       x: m by 1 vactor
% Detail: This method uses the Lagrangian expression:
%             min 1/2x'x - c'x + lambda(AX-b)
%         we have taken the derivatives with regard to x and lambda and
%         solved the system.
function [ x ] = Direct( A,b,c) % QuadraticProgrammin_Solved :)
% x = c - A'*inv(A*A')*(Ac-b)
%     tmp = A*A';
    Atranspose = transpose(A);
    tmp = A*Atranspose;
    tmp2 = tmp \ (A*c - b);
    x = c - A'*tmp2;
end

