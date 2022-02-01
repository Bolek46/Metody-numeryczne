clc        
clear     
close all 
%% Zajecia 2, ćwiczenie 1
%% Implementacja metody eliminacji Gaussa
A=[ 2 1 5 -1.5
    5 3 2 4
    -2 3 2 -4
    -4.5 3 5 2];

B=[1.7;
    47.3;
    -46.4;
    34.95];
M=[A,B];
x=zeros(length(A),1);
%%  Obliczanie macierzy
for a=1:length(A)-1
    for i=a+1:size(M)
            a21=M(i,a);
            a11=M(a,a);
        for j=1:length(M)
            M(i,j)=(M(i,j))-((a21/a11)*(M(a,j)));
        end
    end
end
%% Obliczanie x
suma=0;
for i=size(M)-1:-1:1
    if(x(i+1,1)==0)
        x(i+1,1)=M(i+1,i+2)/M(i+1,i+1);
    end
    %sumowanie iloczynu x i komórek macierzy
    for j=1:size(M)
        suma=suma+(x(j,1)*M(i,j));
    end
    suma=M(i,length(M))-suma;
    x(i,1)=suma/M(i,i);
    suma=0;
end
x()

