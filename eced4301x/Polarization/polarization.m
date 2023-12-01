clear;
phi=-133;
% phase difference between the x-directed and the y-directed plane waves
a1=3.;
% amplitude of the x-directed plane wave
a2=4.;
% amplitude of the y-directed plane wave
eta=2.;
% intrinsic wave impedance eta
z=0.;
% location where the polarization is to be observed
phi=phi/180.*pi;
f=1e9;
% frequency
NS=100;
omega=2*pi*f;
k=omega/3e8;
v_max=2.;
v_min=-2.;
t1=0.;
t2=100/f;
dt=1./f/NS;
ang(NS+1)=0.;
mag(NS+1)=0.;
i=1;
for t=0:dt:1./f
   e1=a1*cos(omega*t-k*z+phi);
   e2=a2*cos(omega*t-k*z);
   mag(i)=sqrt(e1*e1+e2*e2);
   ang(i)=atan2(e2,e1);
   i=i+1;
end; 
angh(NS+1)=0.;
magh(NS+1)=0.;
i=1;
for t=0:dt:1./f
   e2=a1*cos(omega*t-k*z+phi)/eta;
   e1=-a2*cos(omega*t-k*z)/eta;
   magh(i)=sqrt(e1*e1+e2*e2);
   angh(i)=atan2(e2,e1);
   i=i+1;
end; 
for t=t1:dt:t2
   hold off;
   polar(ang,mag,'--r');
   hold on;
    polar(angh,magh,'--b');
   hold on;
   compass(a1+a2,0,'g');
   hold on;
   compass(0,a1+a2,'g');
   e1=a1*cos(omega*t-k*z+phi);
   e2=a2*cos(omega*t-k*z);
   compass(e1,e2,'r')
   hold on;
   h1=e1/eta;
   h2=e2/eta;
   compass(-h2,h1,'b');
   drawnow;
end

