function [yrk, t] = ex4b(R, G, L, C, I, ye)
    
    h = 10^(-4);

    t = 0:h:1;
    N = (1/10^(-4));
    yrk = zeros(1, 1/h);

    stay = 1;
    i = 1;
    t = [0:h:1];
    yrk(1) = -(R * G)/(2 * L);

    for i = 1:N
        k1 = f_Runge_Kutta_pm2((i)*h, yrk(i), L, C, G, R);
        tNew = t(i) + h/2;
        yNew = yrk(i) + h*k1/2;
        yrk(i+1) = yrk(i) + h * f_Runge_Kutta_pm2(tNew,yNew, L, C, G, R);
     
        if t(i) == 1
            break
        end
        %i = i + 1;
    end
    
    %Cálculo da interpolação
    
    T = (27 + G)/127;
    M = str2double(sprintf('%.0f', T * h^-1));
    O = M/h^-1;
    
    
    X = zeros(1, 4);
    for n = 1:4
        X(n) = O + (n-1)/100;
    end
    Yi_aux = zeros(1, 4);
    Yye_aux = zeros(1, 4);
    Yrk_aux = zeros(1, 4);
    for n = 1:4
        Yi_aux(n) = I(str2double(sprintf('%.0f', T * 100)));
        Yye_aux(n) = ye(n + M - 1);
        Yrk_aux(n) = yrk(n + M - 1);
    end
    
    
    Ti = interpolacao(X, Yi_aux, T, 4)
    Tye = interpolacao(X, Yye_aux, T, 4)
    Trk = interpolacao(X, Yrk_aux, T, 4)
    
end

function y = R_italico(x, R, G, C)
y = R*x + G*C*sin(x);
end

function y = f_Runge_Kutta_pm2(t, y, L, C, G, R)

y = -(R_italico( y, R, G, C) + q_eq3( R, L, C, G, t )/C ) / L;

end