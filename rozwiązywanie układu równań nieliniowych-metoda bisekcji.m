close all
clear
clc

%% Metoda bisekcji
fprintf('METODA BISEKCJI \n');
syms f(x)
f(x) = x^3-3;
%Precyzja wyznaczania
e=0.001;
%Ustalanie przedziału:
a=1;
b=6;

fa=f(a);
fb=f(b);

%czy istnieje miejsce zerowe
if fa*fb<0
    x0=(a+b)/2;
    while abs(f(x0))>=e
        x0=(a+b)/2;
        f0=f(x0);
        if  fa*f0 <0
            a=a;
            b=x0;
        else if f0*fb<0
                a=x0;
                b=b;
            end
        end
    end
    fprintf('Funkcja f(x)=%s posiada miejsce zerowe dla x=%.3f \n', f(x),x0);
else
    fprintf('Możliwe, że funkcja nie ma miejsc zerowych\n');
end

%% Metoda reugła falsi
fprintf('METODA REGUŁA FALSI \n');
syms f(x)
f(x) = x^3-3;
%Precyzja wyznaczania
e=0.001;
%Ustalanie przedziału:
a=1;
b=6;
fa=f(a);
fb=f(b);
%czy istnieje miejsce zerowe
if fa*fb<0
    x0= a - (fa*(b-a))/(fb-fa);
    while abs(f(x0))>=e
        x0= a - (fa*(b-a))/(fb-fa);
        f0=f(x0)
        if  fa*f0 <0
            a=a;
            b=x0;
        else if f0*fb<0
                a=x0;
                b=b;
            end
        end
    end
    fprintf('Funkcja f(x)=%s posiada miejsce zerowe dla x=%.3f \n', f(x),x0);
else
    fprintf('Możliwe, że funkcja nie ma miejsc zerowych\n');
end

%% Metoda stycznych (Newtona-Raphsona)
fprintf('METODA stycznych (Newtona-Raphsona) \n');
syms f(x)
f(x) = x^3-3;
%Precyzja wyznaczania
e=0.001;
%Ustalanie przedziału:
a=1;
b=6;
fa=f(a);
fb=f(b);

%czy istnieje miejsce zerowe
if fa*fb<0
    x_1=b;
    xi=a;
     x0 = xi - ( f(xi)*(xi-x_1)  ) / ( f(xi)-f(x_1)   );
    while abs(f(x0))>=e
        
        x0 = xi - ( f(xi)*(xi-x_1)  ) / ( f(xi)-f(x_1)   );
        xi=x_1;
        x_1=x0;
        end
    
    fprintf('Funkcja f(x)=%s posiada miejsce zerowe dla x=%.3f \n', f(x),x0);
else
    fprintf('Możliwe, że funkcja nie ma miejsc zerowych\n');
end



