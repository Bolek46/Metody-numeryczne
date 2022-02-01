close all
clear
clc

%% Metoda Trygonometryczna

% X = [ 0 ;    1;   2;   3;   4;  5;  6;  7;  8;  9;  10; 11; 12; 13; 14];
% Y = [ 8.72;   4.92;   -2.11;   1.4; 3.63;   2.09;   1.41;   -5.42;  -8.56;  -0.36;  1.2;    -3.52;  -2.68;  -2.09;  1.32];
X = [ 0 ;    1;   2;   3;];
Y = [ 1;   3;   -2;   -1;];

PointInternTrigo(X,Y,1);
XY=InterTrigo(X,Y);
plot(XY(:,1),XY(:,2));

function XY=InterTrigo(X,Y)
    precision=0.1;
    XY=zeros((ceil(X(size(X,1))/precision)),2);
    for i=1:size(XY)+1
        XY(i+1,1)=XY(i,1)+precision;
        XY(i,2)=PointInternTrigo(X,Y,XY(i,1));
    end
       XY(size(XY,1),2)=PointInternTrigo(X,Y,XY(size(XY,1),1));
end

function f=PointInternTrigo(X,Y,x)
    F(1,:)=X;
    F(2,:)=Y;

    for i=1:size(X)
        F(3,i)=(2*pi*F(1,i))/size(X,1);
    end

    if rem(size(X,1),2)==0
        m=size(X,1)/2;
    else
        m=(size(X,1)-1)/2;
    end

    %liczenie współczynników A
    A=zeros(1,size(X,1)-1);
    for i=1:size(X,1)-1
        for j=1:size(X)
            A(i)=A(i)+(F(2,j)*cos((i-1)*F(3,j)));
        end
            A(i)=(2/size(X,1))*A(i);
    end
    %liczenie współczynników B
    B=zeros(1,size(X,1)-1);
    for i=1:size(X,1)-1
        for j=1:size(X)
            B(i)=B(i)+(F(2,j)*sin((i-1)*F(3,j)));
        end
            B(i)=(2/size(X,1))*B(i);
    end

    
    x=(pi*x)/2;
    %Wyliczanie funkcji
    f=A(1)/2;
    for i=2:m
        f=f+( A(i)*cos((i-1)*x) + B(i)*sin((i-1)*x)  );
    end
    if rem(size(X,1),2)==0
        f=f+ A(m+1)*cos(m*x)/2;
    end
end



