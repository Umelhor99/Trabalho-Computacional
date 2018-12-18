%   variaveis constantes, n�meros mecanogr�ficos dos alunos
Rodrigo = 190185;
Rafael = 190171;
Joao = 190119;
Vasco = 190205;

%   numero do grupo
G = 4;

%   soma dos numeros mecanograficos dos alunos
s = Rodrigo + Rafael + Joao + Vasco;

%   Fun��o que transfroma um numero numa string
d = num2str(s);

%   matriz linha com o numero 'd'
s = [str2double(d(1)), str2double(d(2)), str2double(d(3)), str2double(d(4)), str2double(d(5)), str2double(d(6))];
d = s;

%   matrizes auxiliares para calculos defenidos no enunciado
auxL = [1; 0; 0; 0; 10^-1; 10^-2];
auxR = [10; 0; 0; 1; 10^-1; 0];
auxC = [10^-4; 10^-5; 10^-6; 0; 0; 0];

%   valores correspondes aos componentes passivos do circuito,
%   para o respetivo grupo
L = d * auxL;
R = d * auxR;
C = d * auxC;

 %L=0.320e1;
 %R=0.352e2;
 %C=3.6e-4;
 %G = 50;

%   Divide o intervalo [0,1] em 100 pontos
t = linspace(0, 1, 101);

%   Funcao da Carga em funcao do tempo 
Q = q_eq3(R, L, C, G, t);

%---------------------------Exercicio 1----------------------------------

%  alínea 1.a
    %gerar_grafico(1, t, Q, 0, .6, 0.5, 0.4, "Tempo [s]", "Carga [C]","a");

%  alínea 1.b
    [a, b, c, d] = ex1b(L, C);
    %gerar_grafico(2, a, b, 0.5, 0.6, 0.5, 0.4, "aprox_r", "erro", "b");
    %gerar_2_graficos(3, a, d, b, 0.25, 0.25, .5, 0.5, "r", "(%)erro","f(r)", "b");
    
    
%---------------------------Exercicio 2----------------------------------

%  alínea 2.a
    %Tabela_2a = ex2a(R, L, C);

%  alínea 2.b
    %ex2b(R);


%---------------------------Exercicio 3----------------------------------

%  alínea 3.a
   [K, J, I, Tab] = ex3a(Q, t, L, R, C, G);
   
%gerar_tabela(Tab, 4, 0, 0.4, 1, .18);

%gerar_2_graficos(5, t , I , J, 0.0, 0.25, .5, 0.5, "Tempo [s]",  "i(t) [A]", "J(t) [A]", "a");
%gerar_2_graficos(6, t, J-I, J, 0.5, 0.25, .5, 0.5, "Tempo [s]",  "J(t) - i(t) [A]", "J(t) [A]", "a");
   
%  alínea 3.b
   [Qs, Qt] = ex3b(G, R, L, C, K, t);
   
 %gerar_grafico (7, t, Qt, 0.2, 0.55, 0.25, 0.25, "Tempo [s]", "Qt(tk)", "b");
 %gerar_grafico (8, t, Qs, 0.55, 0.55, 0.25, 0.25, "Tempo [s]", "Qs(tk)", "b");
 %gerar_grafico (9, t, Qs - Qt, 0.2, 0.25, 0.25, 0.25, "Tempo [s]", "[Qs - Qt](tk)", "b");
 %gerar_grafico (10, t, (abs(Qt - Qs) ./ Qs ) .* 100, 0.1, 0.1, 0.8, 0.8, "Tempo [s]", "[|Qt - Qs|](tk)", "b");
 
 %---------------------------Exercicio 4----------------------------------
   
 %  TODO, por na msm função
for n = 1:3
    [ye, t4] = ex4a(R, G, L, C, n);
     %gerar_2_graficos(11 + n - 1, t4, ye, I, (n-1)*0.2, 0.2, 0.6, 0.6, "legenda_x", "legenda_y", "legenda_y2", "a");
     if n == 1
         y1 = ye;
         t1 = t4;
     elseif n == 2
         y2 = ye;
         t2 = t4;
     else
         y3 = ye;
         t3 = t4;
     end
    
end
%gerar_2_graficos(11 + n - 1, t3, y3, y1, (n-1)*0.2, 0.2, 0.6, 0.6, "legenda_x", "legenda_y","legenda_y", "a");
%gerar_grafico(15, t, I, 0.2, 0.2, 0.6, 0.6, "legenda_x", "legenda_y", "b");
[yb, t5] = ex4b(R, G, L, C, I);
     %gerar_grafico(15, t5, yb, 0.2, 0.2, 0.6, 0.6, "legenda_x", "legenda_y", "b");
     %gerar_2_graficos(11 + n - 1, t5, yb, y1, (n-1)*0.2, 0.2, 0.6, 0.6, "legenda_x", "legenda_y","legenda_y", "a");
    
  