function [x] = SOLVE(L,U,P,b)
    %El primer sistema es Ly=Pb para y
    y=L\(P*b);
    %El segundo sistema es Ux=y para x
    x=U\y;
    %%%Opcionalmente se puede usar linsolve (sistemas grandes)
    %opts.LT=true; y=linsolve(L,P*b,opts);
    %opts.UT=true; x=linsolve(U,y,opts);
    return;
end