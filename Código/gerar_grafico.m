function gerar_grafico(num_fig, x, y, dist_x, dist_y, lenght, height, stringx, stringy, titulo )

%   Desenho do grafico do erro relativo de r_til e f_r_til
figure(num_fig);
plot( x, y , '-');

%   Defenição da posição da janela no ecrã
%   set -- (dec) parte esquerda, (dec) parte inferior, (dec) comprimento do ecrã, (dec) altura do ecrã
set(gcf, 'Units', 'Normalized', 'OuterPosition', [dist_x, dist_y, lenght, height]);

%   Legendas dos eixos do grafico
xlabel(stringx), ylabel(stringy);

%   Tamanho do título
ax = gca;
ax.FontSize = 16;

%   Título do gráfico
str = sprintf('%s', titulo );
title(str);

end



%TODO MUDAR NO EX 1, E GERAR_TABELA