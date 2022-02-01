close all
clear
clc

A = [3  4   0;
      1    2   1;
      0    2   6];
  
b=[1;   0;  1];
I=eye(size(A));
%% Tworzenie macierzy B, F i D
D=zeros(size(A));
for i=1:size(A)
    D(i,i)=A(i,i);
end

F=zeros(size(A));
for i=1:size(A)
    for j=1:size(A)
        if j==i break;
        end
        F(j,i)=A(j,i);
    end
end
B=A-F;
%% Wyliczanie x
% Fxi+b
%   P - Prawa strona równania
X0=[0;   0;  0];
P=[0;   0;  0];
P=MultiplyMatrix(F,X0);
P=P+b;
X1=X0;
suma=0;
M=ones(size(B))-eye(size(B));
%Petla sumuje iloczyny elementów w wierszach z macierzy B przez macierz
%niewiadome x z kolumny X1
%Macierz M eliminuje mnożenie przez aktualnie liczony x
%Suma iloczynów jest dzielona przez współczynnik stojacy przy liczonej
%niewiadomej x
%Mogę Panu jasniej wytłumaczyć w rozmowie. w piśmie nie wiem jak to zwieźle
%zawrzeć :) 
for j=1:size(X0,2) 
    for i=1:size(B)
        for k=1: size(B)
            suma=suma+(M(i,k)*B(i,k)*X1(k,j));
        end  
        %Obliczanie kolejnych niewiadomyh x, Prawa strona równania jest
        %ppomniejszona o sumę a nastepnie dzielona przez wsplczynnik ddla
        %danego X
        X1(i,j)=(P(i,j)-suma)/B(i,i);
        suma=0;
    end
end




%% Funkcja Mnożenia macierzy
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







