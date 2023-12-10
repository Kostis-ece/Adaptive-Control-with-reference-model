%% clear everything
clc;
close all;
clear all;




Ts = [0,15] ;
%r = @(t)(0); %% 1ο Σενάριο
r = @(t)(0.00437*(3.5*sin(0.5*t)+3*cos(0.5*t)));  %2ο Σενάριο (α)
Kstar1 = -9;
Kstar2 = 2.5;
Lstar = 1 ;

xo = [0; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ] ;
[T,X] = ode45(@(t,x)symperifora_3(t,x,r),Ts,xo);
e = X(:,1) - X(:,3) ;  % σφάλμα εξόδου 
E = X(:,2) - X(:,4) ;  % σφάλμα ταχύτητας
K1x = X(:,5).*X(:,1) ; % πολλαπλασιασμός ανα στοιχείο, προκύπτει ο όρος Κ1*Χ1
K2x = X(:,6).*X(:,2) ;
Lr = X(:,7).*r(T);
U = -K1x -K2x + Lr;
K1tilda = X(:,5) - Kstar1; % Κ περισπωμένη
K2tilda = X(:,6) - Kstar2;
Ltilda = X(:,7) - Lstar;  % L περισπωμένη
ed = X(:,1) - 0.0175*sin(0.5*T) ;  %σφάλμα παρακολούθησης επιθυμητού σήματος (σύστημα) (α)
%plot(T,X(:,3) - 0.0175*sin(0.5*T));
%plot(T,K1tilda);
%plot(T,K2tilda);
%plot(T,Ltilda);
%plot(T,U);
%plot(T,X(:,1), 'r' , T, X(:,3), 'b' , T,e , 'y' );
%plot(T,X(:,2), 'r' , T, X(:,4), 'b' , T,E, 'y' );
%plot(T,ed , 'y' , T,X(:,1) , 'r' , T,0.0175*sin(0.5*T) , 'b' ) ; %(α)





