function [C] = ApproxAAT(A, m, th)
% Uses the sparse representation of A
% number of columns is the max number of non-zero elements + 1
% The first column of each row is the number of non-zero elements in that row
% the cells A(i,2) to A(i,A(i,1)+1) are the indices of the non-zero elements
% in that row

n=size(A,1);
C = zeros(n,n);
nz=0;
for i=1:n
    C(i,i)=A(i,1); % the number of non zero elements in that row
    if C(i,i)>=th
        nz=nz+1;
    end
end
F = zeros(nz); nz
k=1;
for i=1:n
    if C(i,i)>=th
        F(k)=i;
        k=k+1;
    end
end

% ------- Logic to complete AAt approximately using Sparse representation    --------
for i=1:nz
    for j=i+1:nz
            Si = A(F(i),1); Sj = A(F(j),1);
            k1 = 2; k2=2; % the index of the first non-zero element in the row
            while(k1<=Si+1 && k2<=Sj+1)
                if(A(F(i),k1)<A(F(j),k2) )
                    k1  = k1+1;
                elseif (A(F(i),k1)>A(F(j),k2) )
                    k2  = k2+1;
                else
                    C(F(i),j) = C(F(i),F(j)) + 1;
                    k1  = k1+1;
                    k2  = k2+1;
                end % if
            end % while
        C(F(j),F(i)) = C(F(i),F(j));
    end % for j
end % for i
end
