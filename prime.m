%The function pr=prime(m,n) determines every prime number between two
%inputs, m and n. The inputs must be positive integers. If the entered
%values of either m or n are negative or non-integers, the function will display "The input
%argument must be a positive integer." If the value of m is larger than the
%value of m, the function will display "The value of n must be larger than
%the value of m." If the two inputs follow the guidelines above, the
%function will output an array of every prime number that comes between the
%inputs. This function was created by Noah Kolda on 11/25/18.

function pr=prime(m,n)  %gives the function
j=1;                    %defines j for the output array
if m>n
    disp('The value of n must be larger than the value of m');  
    return
end
                        %if m>n, display the error message
if m < 0 || n < 0
    disp('The input argument must be a positive integer'); 
    return
end
if floor(m)~=m || floor(n)~=n
    disp('The input argument must be a positive integer');
    return
end
    
         %if m or n are not positive integers, display the error message(s)
for array=m:n
    remainder=0;        %sets the initial remainder to define the variable
    for t=2:array/2     %the following 3 lines determine if the output is prime
        num=array/t;            
        math=num-floor(num);
        if math==0              %if the result of the calculations is 0,
            remainder=1;        %set the rmainder=1
        end
    end
    if remainder==0         %if the remainder is not 1,
        pr(j)=array;        %create an array of the prime numbers
        j=j+1;
    end
end
end
    
    