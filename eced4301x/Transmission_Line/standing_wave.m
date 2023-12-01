R=0.;
L=1.0;
G=0.;
C=1.0;
ZL=0.5+j*0.5;
f=1e9;
omega=2*pi*f;
Z=R+j*omega*L;
Y=G+j*omega*C;
r=sqrt(Z*Y);
alpha=real(r);
beta=imag(r);
Zo=sqrt(Z/Y);
Gamma_L=(ZL-Zo)/(ZL+Zo);
t1=0.;
t2=10./f*10;
NS=30;
dt=1/f/NS;
lambda=2.*pi/beta;
z1=0;
z2=5*lambda
dz=lambda/NS;
zs=(z1:dz:z2);
Gamma=Gamma_L*exp(-2*r*(z2-z1));
eim=abs(exp(-r.*zs));
erm=abs(Gamma*exp(r.*zs));
en=abs(exp(-r.*zs)+Gamma*exp(r.*zs));
hn=abs(exp(-r.*zs)/Zo-Gamma*exp(r.*zs)/Zo);
vs=2.;
vmax=5*vs;
vmin=-5*vs;
for t=t1:dt:t2
    axis([-inf inf vmin vmax]); 
    plot(zs,eim+4*vs,'--k',zs,-eim+4*vs,'--k',zs,erm+2*vs,'--k',zs,-erm+2*vs,'--k',zs, en-2.*vs, '--k', zs, -en-2*vs, '--k',zs, hn-4*vs, '--k', zs, -hn-4*vs, '--k');
    hold on;
    ei=real(exp(-r.*zs).*exp(j*omega*t))+4*vs;
    er=real(Gamma.*exp(+r.*zs)*exp(j*omega*t))+2*vs;
    et=real((exp(-r.*zs)+Gamma*exp(r.*zs))*exp(j*omega*t))-2*vs;
    ht=real((exp(-r.*zs)/Zo-Gamma*exp(r.*zs)/Zo)*exp(j*omega*t))-4*vs;
    plot(zs,ei,'r',zs,er,'r',zs,et,'r',zs,ht,'b');
    hold off;
    axis([-inf inf vmin vmax]); 
    drawnow;
    set(gcf,'doublebuffer','on');
end

