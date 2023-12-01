% This program animates how an AM signal propagates in a dispersive medium
% To select the type of dispersion, you need to select appropriate values of 
% c2: 1) to observe normal dispersion, uncomment line 16 and 
% comment both lines 18 and 20; to observe dispersionless, comment line 18 and
% uncomment both lines 16 and 20; to observe abnormal dispersion, comment
% line 20 and uncommet both line 16 and 18.   
clear;
f=20e3;
% carrier frequency
fe=1.3e3;
% envelope frequency
f1=f-fe;
f2=f+fe;
c1=2.8e8;
% phase velocity at f1 - low side frequency
c2=0.95*c1;
% phase velocity at f2 - high side frequency: normal dispersion
%c2=c1;
% phase velocity at f2 - high side frequency: dispersionless case
% c2= (1+f2./f1)*0.5*c1
% phase velocity at f2 - high side frequency: abnormal dispersion
omega1=2*pi*f1;
omega2=2*pi*f2;
beta1=omega1/c1;
beta2=omega2/c2;
beta0=(beta2+beta1)/2.;
delta_beta=(beta2-beta1)/2.
omega=2*pi*f;
omega_e=2*pi*fe;
t1=0.;
t2=10./fe;
NS=30;
dt=1/f/NS;
lambda=2.*pi/beta0;
lambda_e=2.*pi/delta_beta;
z1=0;
z2=2*2*pi/delta_beta;
dz=lambda/30.;
z=(z1:dz:z2);
hold off;
for t=t1:dt:t2
    hold off;
    e=cos(omega_e*t-delta_beta.*z).*cos(omega*t-beta0.*z);
    plot(z,e,'r');
    hold on;
        en=cos(omega_e*t-delta_beta.*z);
    plot(z,en,'--b',z,-en,'--b');
    hold on;
    axis([-inf inf -1.5 1.5]);
    drawnow;
%   r=input('frame number');
end

