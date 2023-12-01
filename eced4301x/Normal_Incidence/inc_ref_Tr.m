%clear
ep_r1=1.;
% dielectric constant of medium 1
mu_r1=1.;
% relative permeability of medium 1
sigma_1=0.00;
% conductivity of medium 1
ep_r2=9;
% dielectric constant of medium 2
mu_r2=1.;
% relative permeability of medium 2
sigma_2=0.00;
% conductivity of medium 2
f=1e9;
% frequency
omega=2*pi*f;
epsilon_0=8.85e-12;
mu_0=4*pi*1e-7;
epc1=ep_r1+sigma_1/j/omega/epsilon_0;
epc2=ep_r2+sigma_2/j/omega/epsilon_0;
r1=j*omega*sqrt(mu_0*mu_r1*epsilon_0*epc1);
r2=j*omega*sqrt(mu_0*mu_r2*epsilon_0*epc2);
alpha1=real(r1);
beta1=imag(r1);
alpha2=real(r1);
beta2=imag(r2);
eta1=120*pi*sqrt(mu_r1/epc1);
eta2=120*pi*sqrt(mu_r2/epc2);
Gamma=(eta2-eta1)/(eta2+eta1);
T=2*eta2/(eta2+eta1);
t1=0.;
t2=100./f;
NS=30;
dt=1/f/NS;
lambda1=2.*pi/beta1;
lambda2=2.*pi/beta2;
NL1=1;
NL2=1;
if (lambda1>lambda2)
    NL2=fix(lambda1/lambda2);
end
if (lambda2>lambda1)
    NL1=fix(lambda2/lambda1);
end
z1=-5*NL1*lambda1
z2=0
z3= 5*NL2*lambda2
dz1=lambda1/NS;
dze1=lambda1/NS;
dz2=lambda2/NS;
dze2=lambda2/NS;
zs1=(z1:dz1:z2);
zs2=(z2:dz2:z3);
ze1=(z1:dze1:z2);
ze2=(z2:dze2:z3);
vs=2*exp(alpha1*z1);
eim=abs(exp(-r1.*zs1));
erm=abs(Gamma*exp(r1.*zs1));
etm=abs(T*exp(-r2.*zs2));
en1=abs(exp(-r1.*zs1)+Gamma*exp(r1.*zs1));
en1l=-en1-2*vs;
en1=en1-2*vs;
en2=abs(T*exp(-r2.*zs2));
en2l=-en2-2*vs;
en2=en2-2*vs;
zs=[zs1 zs2];
en=[en1 en2];
enl=[en1l en2l]
vmax=8.*exp(alpha1*z1);
vmin=-vmax;;
for t=t1:dt:t2
    plot([0 0],[vmax vmin],'--g');
    hold on
    plot(zs,en,'--b',zs,enl,'--b');
    hold on;
    plot(zs1,eim+3*vs,'--b',zs1,-eim+3*vs,'--b',zs1,erm+vs,'--b',zs1,-erm+vs,'--b',zs2,etm+2*vs,'--b',zs2,-etm+2*vs,'--b');
    hold on;
    ei=real(exp(-r1.*ze1).*exp(j*omega*t));
    er=real(Gamma.*exp(+r1.*ze1)*exp(j*omega*t));
    e1=ei+er;
    ei=ei+3*vs;
    er=er+vs;
    e1=e1-2*vs;
    et1=real(T*exp(-r2.*ze2).*exp(j*omega*t));
    et2=et1-2*vs;
    et1=et1+2*vs;
    plot(ze1,ei,'r',ze1,er,'r',ze2, et1,'r', ze1, e1,'r', ze2, et2, 'r');
    hold off;
    axis([-inf inf vmin vmax]); 
    drawnow;
end

