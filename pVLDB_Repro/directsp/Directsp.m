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
function [ x, lambda, aat] = Directsp(Asp,ATsp,b,prior,mul,th) % QuadraticProgrammin_Solved :)
% x = c - A'*inv(A*A')*(Ac-b)

if(mul==1)
    tmp = ExactAAT(Asp);
elseif(mul==2)
    tmp = ApproxAAT(Asp,size(ATsp,1),th);
else
    tmp = ApproxAAT2(Asp,size(ATsp,1),th);
end
aat = tmp;
%save('aat.txt' ,'tmp','-ascii');
tmp3=MulMV(Asp,prior);
%save('mulmv.txt' ,'tmp3','-ascii');
tmp2 = tmp \ (tmp3 - b);

lambda = tmp2';

tmp = MulMV(ATsp,tmp2);
x = prior - tmp;
disp('Done Direct SP');
end


