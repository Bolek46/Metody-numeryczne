close all
clear
clc

%% Metoda Newtona
X = [ 0 ;    2;   3;   5;];
Y = [ 10;   5;   4;   2;];


XY=InterNewton(X,Y);

plot(XY(:,1),XY(:,2));

function XY=InterNewton(X,Y)
    precision=0.1;
    XY=zeros((ceil(X(size(X,1))/precision)),2)
    for i=1:size(XY)+1
        XY(i+1,1)=XY(i,1)+precision;
        XY(i,2)=PointInterNewton(X,Y,XY(i,1));
    end
       XY(size(XY,1),2)=PointInterNewton(X,Y,XY(size(XY,1),1));
end


function y=PointInterNewton(X,Y,x)
    F=zeros(size(X,1),size(X,1));
    F(:,1)=Y;
    k=1;
    for i=1:size(F)
        for j=1:size(F)-k
        F(j,i+1)=(F(j+1,i)-F(j,i))/(X(j+k,1)-X(j,1)  );
        end
        k=k+1;
    end

    y=F(1,1);
    for i=2:size(X)
        iloczyn=1;
        for j=1:i-1
            iloczyn=iloczyn*( x - X(j,1) );
        end
        F(1,i)*iloczyn;
        y=y+F(1,i)*iloczyn;
    end
end