function [g,f] = Setup()
%Setup Zwraca pod³¹czone kamery oraz ustawia wartosc timeout
%   Detailed explanation goes here
g=gigecam(1);
g.Timeout=100;
f=gigecam(2);
f.Timeout=100;
end

