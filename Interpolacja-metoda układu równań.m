close all
clear
clc

%Ta Metoda nie działa poprawnie i nie mogę dojść, w którym miejscu lezy
%problem. Prawidłowo wylicz tylko jeden ze współczynników reszta jest inna

%% Metoda układu równań

X = [ 0 ;    3;   6;   9;];
Y = [ 1.12;  1.14;    1.17;   2; ];

%Macierz Vandermonde’a
W=ones(size(X,1),size(X,1));
for i=1:size(X,1)
    
    for j=1:size(X,1)-1
        W(i,j+1)=X(i)^j;
        
    end
end

%Liczenie wyznacznika Vandermonde'a
D=1;
for i=1:size(X)-1
    for j=i+1:size(X)
        D=D*(W(j,2)-W(i,2));  
    end
end

%Obliczanie wartości współczynników
L=Dopelnienie(W);
A= zeros(size(X,1),1);
size(A)
suma=0;
for i=1:size(A,1)
    for j=1:size(A,1)
       yi=Y(j,1)
       xi=L(j,i)
        suma=suma+(Y(j,1)*L(j,i));
    end
    A(i,1)=suma/D;
    suma=0;
end

%%wyliczanie dopełaniania algebraicznego macierzy
function L=Dopelnienie(T)
    Tpom=zeros(size(T,1)-1,size(T,1)-1);
    L=T;
    for i=1:size(T)
        for j=1:size(T)
          for k=1:size(T)-1
                for h=1:size(T)-1
                    if (k>=i && h>=j)
                        Tpom(k,h)=T(k+1,h+1);
                    elseif k>=i
                        Tpom(k,h)=T(k+1,h);
                    elseif h>=j
                        Tpom(k,h)=T(k,h+1);
                    else
                        Tpom(k,h)=T(k,h);
                    end  
                end
          end
           L(i,j)=(-1)^(i+j) * Det(Tpom);
           Tpom=zeros(size(T,1)-1,size(T,1)-1);
        end
    end
end

%Funkcja liczaca wyznacznik macierzy (Metoda Sarrusa)
function det=Det(X)
    %Rozszerzenie macierzy i doklejenie skopiowanych kolumn 
    Xplus = zeros(size(X,1),2*size(X,2)-1);
    for i=1:size(Xplus,1)
        for j=1:size(Xplus,2)
            if j>size(X,1)
              Xplus(i,j)=X(i,j-size(X,1));
            else
              Xplus(i,j)=X(i,j);
            end
        end
    end
   
   det=0;
   %Przekątna ze znakiem plus
   diagonal_down=1;
   %Przekątna ze znakiem minus
   diagonal_up=1;
  
    for i=1:size(X)
        for j=1:size(X)
            diagonal_down=diagonal_down*Xplus(j,j+i-1);
            diagonal_up=diagonal_up*Xplus(size(X,1)-j+1,j+i-1);
        end
        det=det+diagonal_down-diagonal_up;
        diagonal_down=1;
        diagonal_up=1;
    end
    
end

