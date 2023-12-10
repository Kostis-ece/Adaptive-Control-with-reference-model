function dx = symperifora_3(t,x,r)
% M-G-C ��������, x(3)-x(4) ����������� ��� ��������
% ��������, x(5)-x(6) = �� ����������� ��� � , x(7) �� L , x(1) - x(2) ��
% ����������� ��� ����������� ���������� , P � ������� P ��� ��������� ��� ��� ������� Lyapunov ��� ������� ����� ��� ������ Q
%Q ����������� ��������� �� ����� Q1,Q2 ��� Bm � ������� ��� ��������
    
    % ��������
    
    Q1 = 20000000; % Q1.2 > 0
    Q2 = 20000000;
    
    % ��������� ����������
    
    P = [Q2/3+11*Q1/12 Q1/4;Q1/4 Q1/12+Q2/6];
    Bm = [0 2]';   
    xm = [x(3) x(4)]';
    e = [x(1);x(2)]  - xm;  
    u = -x(5)*x(1) - x(6)*x(2) + x(7) * r(t) ;
    dx(1) = x(2);
    dx(2) = -20*sin(x(1)) - 2*x(2) + 2*u ;    
    dx(3) = x(4) ;
    dx(4) = -2*x(3) - 3*x(4) + 2*r(t) ;  
    dx(5) = Bm' * P * e * x(1);
    dx(6) = Bm' * P * e * x(2);
    dx(7) = - Bm' * P * e * r(t);
      
    
    dx = dx' ;
    
end