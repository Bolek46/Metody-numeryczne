close all
clear
clc

dokladnosc=input('wpisz dokładność : ');
kat=input('podaj kąt : ');
%x+h=kat
x=90;
h=deg2rad( kat-x );
x_rad=deg2rad( x );
% cos' = -sin
% sin' = cos

%%Szereg Taylora dla cosinusa
syms f(x)
f(x) = cos(x);
%wyraz pierwszy
wynik=f(x_rad);
for n=1:dokladnosc-1
    %f(x)*h^0
    %(f(x)' * h^1)/1!
    %(f(x)'' * h^2)/2!
    %(f(x)'' * h^3)/3!
    %kolejne wyrazy
    f(x)=diff(f,x);
    wynik=wynik + (f(x_rad)*(h^n))/(factorial(n));
    
end 
fprintf('wartość dla cosinus %.15f \n',wynik);

%%Szereg Taylora dla sinusa
syms f(x)
f(x) = sin(x);
%wyraz pierwszy
wynik=f(x_rad);
for n=1:dokladnosc-1
    %kolejne wyrazy
    f(x)=diff(f,x);
    wynik=wynik + (f(x_rad)*(h^n))/(factorial(n));
end 
fprintf('wartość dla sinus %.15f \n',wynik);

h=input('wprowadz wartośc do funkcji ekspotencjalnej');
x_rad=0;
%%funkcja ekspotencjalna
syms f(x)
f(x) = exp(x);
%wyraz pierwszy
wynik=f(x_rad);
for n=1:dokladnosc-1
    %kolejne wyrazy
    f(x)=diff(f,x);
    wynik=wynik + (f(x_rad)*(h^n))/(factorial(n));
end 
fprintf('wartość funkcji ekspotencjalnej %.15f',wynik);