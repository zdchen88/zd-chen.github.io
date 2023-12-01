alpha=0.8;
% attenuation constant alpha
f=1e9;
% frequency
omega=2*pi*f;
k=omega/3e8;
t1=0.;
t2=100./f;
NS=30;
dt=1/f/NS;
lambda=3e8/f;
z1=0;
z2=10*lambda;
dz=lambda/30.;
dze=lambda/8;
z=(z1:dz:z2);
ze=(z1:dze:z2);
alpha=alpha/lambda;
hold off;
for t=t1:dt:t2
    e=exp(-alpha.*z).*cos(omega*t-k.*z);
    plot(z,e, '-r');
    hold on;
    en=exp(-alpha.*z);
    plot(z,en,'--b',z,-en,'--b');
%    hold on;
%    ze=rem((ze+omega*dt/k),10*lambda);
%    eb=exp(-alpha.*ze).*cos(omega*t-k.*ze);
%    bar(ze,eb,'-m');
    hold off;
    axis([-inf inf -1.5 1.5]); 
    drawnow;
%   r=input('frame number');
end

