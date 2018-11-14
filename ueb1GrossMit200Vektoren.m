
%%
% Loese LP f�r Zufalls-Vektoren
% Anzahl Vektoren
n = 200;
% Dimension Vektoren
dim = 20;


A1 = zeros(dim*2,dim);
j = 1;
for i = 1 : 2 : dim*2
        A1(i,j) = 1;
        A1(i+1,j) = -1;
        j = j + 1;
end
A1 = repmat(A1,[n,1]);
A2 = zeros(2*n*dim,n*dim);
j = 1;
for i = 1 : 2 : 2*n*dim
        A2(i,j) = -1;
        A2(i+1,j) = -1;
        j = j + 1;
end
einheitsvektor = @(d,n) [zeros(1,n-1) 1 zeros(1,d-n)];
A3 = zeros(n,dim);
for i = 1 : n
    A3 = [A3,repmat(einheitsvektor(n,i),[1,dim])];
end
A4 = [A1,A2,zeros(2*n*dim,1)];
A5 = [A3,-ones(n,1)];
A = [A4;A5];

% Vektoren aufbereiten -> in b stecken, alternierend:

B=reshape(data,[4000,1]);
BB=[B';-B'];
b=reshape(BB,[8000,1]);
b=[b;zeros(200,1)];

% Test Vektoren
% b1 = -ones(n*dim,1);
% b1 = [b1';-b1'];
% b = [reshape(b1,[2*n*dim,1]) ; zeros(n,1)];

f=ones((n+1)*dim+1,1);

[x,fval,exitflag] = linprog(f,A,b);
xx = x(1:dim);
