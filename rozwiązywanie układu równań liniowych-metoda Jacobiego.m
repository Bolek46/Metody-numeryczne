close all
clear
clc

A = [3  4   0;
      1    2   1;
      0    2   6];
  
b=[1;   0;  1];
I=eye(size(A));

D=zeros(size(A));
for i=1:size(A)
    D(i,i)=1/A(i,i);
end

C1=zeros(size(A));
C1=MultiplyMatrix(D,A);

C1=I-C1;

C2=[0;   0;  0];
C2=MultiplyMatrix(D,b);

X=[0;   0;  0];
for i=1:size(A)
    X=MultiplyMatrix(C1,X);
    X=X+C2;
end
X
%% Funkcja Mnożenia Macierzy
function X=MultiplyMatrix(D,A)
X=zeros(size(D,1),size(A,2));
    for i=1:size(D,1) %ilość wierszy macierzy wynikowej
        for j=1:size(A,2) %ilość kolumn macierzy wynikowej
            for k=1: size(D)
             X(i,j)=X(i,j)+(D(i,k)*A(k,j));
            end
        end
    end
end
