%% Metoda siecznych
fprintf('METODA siecznych \n');
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

    x0= a - (fa*(b-a))/(fb-fa);
    while abs(f(x0))>=e
        x0= a - (fa*(b-a))/(fb-fa);
        f0=f(x0);
        b=a;
        a=x0;
        fa=f(a);
        fb=f(b);
      
    end
    fprintf('Funkcja f(x)=%s posiada miejsce zerowe dla x=%.3f \n', f(x),x0);
