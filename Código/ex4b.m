function [yrk, t] = ex4b(R, G, L, C, I, ye)
    
    h = 10^-4;

    t = 0:h:1;

    yrk = zeros(1, 1/h);

    stay = 1;
    i = 2;

    yrk(1) = -(R * G)/(2 * L);

    while stay == 1

        if t(i) == 1
            stay = 0;
        end

        xn = q_eq3( R, L, C, G, t(i-1) );
        yn = R_italico( yrk(i-1), R, G, C);

        yrk(i) = yrk(i-1) + h* f_Runge_Kutta_pm2( yn + (h/2), xn + (h/2)* f_Runge_Kutta_pm2(yn, xn, L, C ), L, C);

        i = i + 1;
    end
    
    %Cálculo da interpolação
    
    T = (27 + G)/127;
    M = str2double(sprintf('%.0f', T * 100));
    T = M/100;
    
    
    X = zeros(1, 4);
    for n = 1:4
        X(n) = T + (n-1)/100;
    end
    Yi = zeros(1, 4);
    Yye = zeros(1, 4);
    Yrk = zeros(1, 4);
    for n = 1:4
        Yi(n) = I(n + M - 1);
        Yye(n) = ye(n + M - 1);
        Yrk(n) = yrk(n + M - 1);
    end
    
    %Ti = interpolacao(X, Yi, T, 4);
    %Tye = interpolacao(X, Yye, T, 4);
    %Trk = interpolacao(X, Yrk, T, 4);
end

function y = R_italico(x, R, G, C)

y = R*x + G*C*sin(x);
end

function y = f_Runge_Kutta_pm2(Rif, qf, L, C)

y = -(Rif + qf/C) / L;

end