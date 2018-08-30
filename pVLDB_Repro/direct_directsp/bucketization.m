% **************************************** % ****************************************
%               ** This method will give a bucketization of the errors **
% **************************************** % ****************************************

% *******  =========================== Inputs ==============================  *******
% **************************************** % ****************************************
% | Take the input as two Matlab variables as the traffic genrated using the Direct |
% | Directsp values. Groups them into 50 bucketes and finds the average error in    |
% |                         each bucket and returns it                              |
% ***************************************** % ***************************************

% *******  =========================== outputs =============================  *******
% |                        Bucketized Error on the input varibales                  |
% ***************************************** % ***************************************

function [Bucket] = bucketization(total, direct, directsp)
    size_of_bucket = ceil(total * 0.02); 
    number_of_buckets = ceil(total/size_of_bucket);
    Bucket = zeros(number_of_buckets, 2);
    size(Bucket)
    overful = false;
    for bucket = 0:number_of_buckets-1
        sum_values = 0;
        error_values = 0;
        for each_element_in_bucket = 1:size_of_bucket
            current_index = floor(((bucket*size_of_bucket) + each_element_in_bucket));
            if (current_index <= total)
                sum_values = sum_values + direct(current_index);
                error_values = error_values + abs((direct(current_index) - directsp(current_index)));
            else
                overful = true;
                break;
            end 
        end
        
        if ~overful
            sum_values = (sum_values / size_of_bucket);
            error_values = (error_values / size_of_bucket);
            Bucket(bucket+1, 1) = sum_values;
            Bucket(bucket+1, 2) = error_values;
        else
            sum_values = (sum_values / each_element_in_bucket-1);
            error_values = (error_values / each_element_in_bucket-1);
            Bucket(bucket+1, 1) = sum_values;
            Bucket(bucket+1, 2) = error_values;
            break;
        end
    end
    save('bucket.txt','Bucket','-ascii')
end
