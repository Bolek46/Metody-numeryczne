close all
clear
clc

%nie jestem pewny czy ta metoda dobrze działa, ponieważ wrzucajac te dane
%do innych metod wychodzi ładny wykres siinusoidalny, ale sprawdzajać to z
%funkcja, która zostaął obliczona na ćwiczeniach wszystko się zgadza 
%Sprawdzając na danych z ksiązki wykres wychodzi prawidłowy

%% Metoda wymierna

%dane z zadania zrobionego na zajeciach
% X = [ 0 ;    1;   2;   3;];
% Y = [ 1;   3;   -2;   -1;];

%Dane z ksiązki
X= [3;  5;  7;  7.5;    8;  9];
Y= [4.375;  5.47;   13.595; 23.925; 18.75; 6.64];


XY=InterMeasurable(X,Y);
PointInterMeasurable(X,Y,1.4)
plot(XY(:,1),XY(:,2));

function XY=InterMeasurable(X,Y)
    precision=0.1;
    XY=zeros((ceil(X(size(X,1))/precision)),2);
    for i=1:size(XY)+1
        XY(i+1,1)=XY(i,1)+precision;
        XY(i,2)=PointInterMeasurable(X,Y,XY(i,1));
    end
       XY(size(XY,1),2)=PointInterMeasurable(X,Y,XY(size(XY,1),1));
end



function K=PointInterMeasurable(X,Y,x)
    F=zeros(size(X,1),size(X,1));
    F(:,1)=Y;
    for i=1:size(X)-1

        for j=i:size(X)-1
            F(j+1,i+1)=(X(i,1)-X(j+1,1)) / (  F(i,i)-F(j+1,i) );
        end

    end

    K=F(size(F,1),size(F,1));
    for i=size(X,1)-1:-1:1
           iloraz =(x-X(i,1))/K;
           K= F(i,i)+iloraz;

    end
end