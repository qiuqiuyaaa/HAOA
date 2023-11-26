
function [J1,J2,J3] = CalulateInf(X,f,LB,UB)
X = sort(X);
x = [LB;X';UB];
d = size(x,1);
J1=0;J2=0;J3=0;


for i = 2:d
    f0 = f(x(i-1));
    f1 = f(x(i));
    dist = x(i)-x(i-1);
    J1 = J1 + (f1 + f0)*dist/2;
end

for i = 2:d
    f0 = f(x(i-1));
    f1 = f(x(i));
    f3 = f((x(i)+x(i-1))/2);
    dist = x(i)-x(i-1);
    J2 = J2 + (f1 + f0 + 4*f3)*dist/6;
end

for i = 2:d
    f0 = f(x(i-1));
    f1 = f(x(i));
    f3 = f((2*x(i)+x(i-1))/3);
    f4 = f((x(i) + 2*x(i-1))/3);
    dist = x(i)-x(i-1);
    J3 = J3 + (f1 + f0 + 3*f3 + 3*f4)*dist/8;
end


end
