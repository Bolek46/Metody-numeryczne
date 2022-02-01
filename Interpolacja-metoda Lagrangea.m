close all
clear
clc

%% Metoda Lagrangea
X = [ 0 ;    3;   6;   9;];
Y = [ 1.12;  1.14;    1.17;   2; ];


XY=InterLagrangea(X,Y);
plot(XY(:,1),XY(:,2));

function XY=InterLagrangea(X,Y)
    precision=0.1;
    XY=zeros((ceil(X(size(X,1))/precision)),2)
    for i=1:size(XY)+1
        XY(i+1,1)=XY(i,1)+precision;
        XY(i,2)=PointLagrangea(X,Y,XY(i,1));
    end
       XY(size(XY,1),2)=PointLagrangea(X,Y,XY(size(XY,1),1));
end

function y=PointLagrangea(X,Y,x)
y=0
    for i=1:size(X)
        iloczyn=1;
        for j=1:size(X)
            if i~=j
                X(j)
                iloczyn=iloczyn*( (x-X(j)) / ( X(i)-X(j) ) )
            end
        end
        y=y+iloczyn*Y(i);
    end
end
