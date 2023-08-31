function [X,Y,Z] = plano(sax,say,normal,punto)
    largo_x=punto(1)-sax:0.2*sax:punto(1)+sax;
    largo_y=punto(2)-say:0.2*say:punto(2)+say;
    [X,Y]=meshgrid(largo_x,largo_y);
    normal=normal/norm(normal);
    d=normal(1)*punto(1)+normal(2)*punto(2)+normal(3)*punto(3);
    Z=(d-normal(1).*X-normal(2).*Y)/normal(3);
end

