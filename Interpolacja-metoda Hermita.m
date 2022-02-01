close all
clear
clc


%% Metoda Hermita
F=[-1   -2  NaN;
    0   10  40;];

t=[0;   0;  1;  1;  1];
%Stworzenie wekotra fi na podstawie danych
for i=1:size(t)
    for j=1:size(F,1)
       
        if t(i)==rem(j+size(F,1)-1,size(F,1))
            Y(i)=F(j,1);
        end
    end
end

XY=PointInterHermit(t,Y,F,1)

XY=InterHermit(t,Y,F)
plot(XY(:,1),XY(:,2));

function XY=InterHermit(X,Y,H)
    precision=0.1;
    XY=zeros((ceil(X(size(X,1))/precision)),2);
    for i=1:size(XY)+1
        XY(i+1,1)=XY(i,1)+precision;
        XY(i,2)=PointInterHermit(X,Y,H,XY(i,1));
    end
        %XY(size(XY),1)=XY(i,1)+precision;
       XY(size(XY,1),2)=PointInterHermit(X,Y,H,XY(size(XY,1),1));
end


function y=PointInterHermit(X,Y,H,x)
    F=zeros(size(X,1),size(X,1));
    F(:,1)=Y;
    k=1;
    for i=1:size(F)
        for j=1:size(F)-k
            if X(j+k,1)-X(j,1)==0
                     
%                 if X(j+k,1)==0           
%                 F(j,i+1)=H(1,i+1)/factorial(i);
%                 elseif X(j+k,1)==1
%                 F(j,i+1)=H(2,i+1)/factorial(i);
%                 end
                          
                    for u=1:size(H,1)
                        if X(j)==rem(u+size(H,1)-1,size(H,1))
                            F(j,i+1)=H(u,i+1)/factorial(i);
                        end
                    end
            else
                F(j,i+1)=(F(j+1,i)-F(j,i))/(X(j+k,1)-X(j,1) );
            end
        end
        k=k+1;
    end
    
    y=F(1,1);
    for i=2:size(X)
        iloczyn=1;
        for j=1:i-1
            iloczyn=iloczyn*( x - X(j,1) );
        end
        
        y=y+F(1,i)*iloczyn;
    end
end