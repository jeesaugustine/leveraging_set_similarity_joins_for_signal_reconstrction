function [C] = ApproxAAT2(A, m, th)
% Uses the sparse representation of A
% number of columns is the max number of non-zero elements + 1
% The first column of each row is the number of non-zero elements in that row
% the cells A(i,2) to A(i,A(i,1)+1) are the indices of the non-zero elements in that row
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
    for i=1:nz-1
        for j=i+1:nz % for every pair of freq. rows
            C(i,j) = SIM(A(F(i),:),A(F(j),:),m,th);
            C(j,i)=C(i,j);
        end
    end
end