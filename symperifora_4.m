function dx = symperifora_4(t,x,r)
% F= -lam , g  = 1 , M-G-C ��������, x(5)-x(6) ����������� ��� ��������
% ��������, x(3)-x(4) = �1-�2 , , x(1) - x(2) ��
% ����������� ��� ����������� ���������� x(7-8-9-10) = �� ����������� ��� �
% , x(11-12-13-14) = �� ����������� ��� � , gamma = � ������� � , p :
% Gm*(s+p) = SPR
   
    % ��������:
    
    lam = 3.5; % lam>0
    g1 = 800000000000;  % g1.2.3.4 > 0
    g2 = 200000000000;
    g3 = 600000000000;
    g4 = 500000000000;
    p = 2.5;   % 0<p<3
    
    
    %��������� ����������
    
    gamma = [g1 0 0 0 ; 0 g2 0 0 ; 0 0 g3 0 ; 0 0 0 g4];
    dx(7) = -gamma(1,:)*(x(1)-x(5))*[x(11);x(12);x(13);x(14)];
    dx(8) = -gamma(2,:)*(x(1)-x(5))*[x(11);x(12);x(13);x(14)];
    dx(9) = -gamma(3,:)*(x(1)-x(5))*[x(11);x(12);x(13);x(14)];
    dx(10) = -gamma(4,:)*(x(1)-x(5))*[x(11);x(12);x(13);x(14)];
    u = [x(7); x(8) ; x(9) ; x(10)]' * [x(3) ; x(4) ; x(1) ; r(t)] + [dx(7); dx(8) ; dx(9) ; dx(10)]'*[x(11);x(12);x(13);x(14)];
    dx(1) = x(2);
    dx(2) = -20*sin(x(1)) - 2*x(2) + 2*u ;
    dx(3) = -lam*x(3) + u ;
    dx(4) = -lam*x(4) + x(1) ;
    dx(5) = x(6) ;
    dx(6) = -2*x(5) - 3*x(6) + 2*r(t) ;
    
    dx(11) = -p*x(11) + x(3);
    dx(12) = -p*x(12) + x(4);
    dx(13) = -p*x(13) + x(1);
    dx(14) = -p*x(14) + r(t);
    
    dx = dx' ;
    
end
