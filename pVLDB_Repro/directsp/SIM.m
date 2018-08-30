function [c] = SIM(A, B, m, th)
    k = round(log2(m));
    if (A(1)>=k && B(1)>=k)
        % bottom-k sketch
        i=2; j=2; s=0; % s/k is jacard sim
        while(i<=k+1 && j<=k+1)
            if(A(i)>B(j))
                j=j+1;
            elseif(A(i)<B(j))
                i=i+1;
            else
                s=s+1; i=i+1; j=j+1;
            end
        end
        i=2; j=2;
        for u =1:k
            if(A(i)>B(j))
                hk = B(j);
                j=j+1;
            elseif(A(i)<B(j))
                hk = A(i);
                i=i+1;
            else
                hk = B(j);
                s=s+1; i=i+1; j=j+1;
            end
        end
        c = (s/k)*((k-1)/hk)*m;
    else % apply threshold based estimation
        Si = A(1); Sj = B(1); c = 0;
        beta1 = min(A(1) - th , Si) + 1; % early stop threshold
        beta2 = min(B(1) - th , Sj) + 1;
        k1 = 2; k2=2; % the index of the first non-zero element in the row
        while(k1<=beta1 && k2<=beta2)
            if(A(k1)<B(k2) )
                k1  = k1+1;
            elseif (A(k1)>B(k2) )
                k2  = k2+1;
            else
                c = c + 1;
                k1  = k1+1;
                k2  = k2+1;
            end % if
        end % while
        
        if(c==0) % stop early
            return
        end
        
        while(k1<=Si+1 && k2<=Sj+1)
            if(A(k1)<B(k2) )
                k1  = k1+1;
            elseif (A(k1)>B(k2) )
                k2  = k2+1;
            else
                c = c + 1;
                k1  = k1+1;
                k2  = k2+1;
            end % if
        end % while
    end % end of if
end % end of function
