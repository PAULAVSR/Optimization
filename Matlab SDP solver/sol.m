n=20;                           % Dimension der A-Matrizen

blk{1,1} = 's';                 % s .. semidefinit
blk{1,2} = n;                   % Blockgröße (=Größe von A1)
blk{2,1} = 's'; 
blk{2,2} = n; 
blk{3,1} = 's'; 
blk{3,2} = n;
blk{4,1} = 's'; 
blk{4,2} = n;
blk{5,1} = 'u';                 % u .. unrestricted
blk{5,2} = 1;                   % Größe eines Skalars (1x1 Block)

n2 = n*(n+1)/2;                 % Anzahl der Variablen pro Block 
zz = sparse(n2,1);              % Nullvektor
I = speye(n);                   % Einheitsmatrix

blktmp{1,1} = 's';              % Für -alpha*I
blktmp{1,2} = n;

At{1,1} = -[lmifun(A1,-I), svec(blktmp,-I,1)];  % -(-A'*X-X*A-alpha*I)
At{2,1} = -[lmifun(A2,-I), svec(blktmp,-I,1)];
At{3,1} = -[lmifun(A3,-I), svec(blktmp,-I,1)];
At{4,1} = -[lmifun(I/2,I), svec(blktmp,-I,1)];  % -(X-alpha*I)
At{5,1} = -sparse([1, zeros(1,n2)]);            % -(X11)  

C{1,1} = sparse(n,n);           % Nullvektor
C{2,1} = sparse(n,n);
C{3,1} = sparse(n,n);
C{4,1} = sparse(n,n); 
C{5,1} = -1;                    % max -(-alpha) -> max alpha

b = -[zeros(n2,1); -1];         % rechte Seite (-X11)=(-1) -> X11=1

[obj,X,y,Z,info,runhist] = sqlp(blk,At,C,b);

% Eigenwerte von Blockmatrix X:
eig(X{1});
eig(X{2});
eig(X{3});
eig(X{4});

% Eigenwerte von ...(siehe Aufgabe):
eig(-A1'*X{1}-X{1}*A1);
eig(-A2'*X{2}-X{2}*A2);
eig(-A3'*X{3}-X{3}*A3);

if(obj>0) 
    "System ist stabil" 
    obj(1);
else
    "System ist instabil" 
    obj(1);
end



