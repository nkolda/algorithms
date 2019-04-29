function [L,U,P]=luFactor(A)
%LU factorization with partial pivoting algorithm
%
%Input arguments:  A, the coefficient matrix
%
%Output arguments: L, the lower triangular matrix
%                  U, the upper triangular matrix
%                  P, the pivot matrix
%
%Example Call:
%               [L,U,P]=luFactor([2,-6,-2;-3,-1,7;-8,1,-2])
%
%
%This function calculates the LU factorization of a matrix given the user
%input coefficient matrix, A
%The function was created by Noah Kolda on April 1, 2019


[row,col]=size(A);
%defines the size of the input matrix

if row~=col
    fprintf('The coefficient matrix must be a square matrix');
return;
end
%Error check to make sure the input matrix is a square matrix

%pivot
P=eye(size(A));
%sets P as the identitiy matrix initially
temp=row;
%defines a new matrix with equal rows as A, used for pivoting
k=col;
U=A;

%defines guidelines for pivoting
for i=1:temp
    [pivot temp]=max(abs(A(i:temp,i)));
    temp=temp+i-1;
    %pivots P with respect to A
    A([i temp],:)=A([temp i],:);
    P([i temp],:)=P([temp i],:);
    
    
for i=1:col
    %loops through each column until completion
    if row>=3
    %calculates U and L faster if the coefficient matrix is a 3x3
    %U matrix
    U=A;
    %calculates L21/L11, etc, and calculates/defines U 
    L2111=A(2,1)/A(1,1);
    U(2,1)=0;
    U(2,2)=(A(2,2))-L2111*A(1,2);
    U(2,3)=(A(2,3))-L2111*A(1,3);
    
    L3111=A(3,1)/A(1,1);
    U(3,1)=0;
    U(3,2)=(A(3,2))-L3111*A(2,2);
    U(2,3)=(A(2,3))-L2111*A(1,3);
    
    L3222=A(3,2)/U(2,2);
    U(3,2)=0;
    U(3,3)=(U(3,3))-L3222*U(2,3);
    
    
    
    %L matrix for a 3x3 
    L=zeros(row,col);
    %fills the L matrix with corresponding values
    L(1,1)=1;
    L(1,2:col)=0;
    L(2,1)=L2111;
    L(2,2)=1;
    L(2,3:col)=0;
    L(3,1)=L3111;
    L(3,2)=L3222;
    L(3,3)=1;
    
    
    else
    %calculates L and U for A larger than 3x3
    k=col;
    j=row;
    L(j,k)=U(j,k)/U(k,k);
    U(j,:)=U(j,:)-L(j,k)*U(k,:);
    end
end
end
end


    
    



