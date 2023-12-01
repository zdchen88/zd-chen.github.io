clear;
a1=1.;
% amplitude of the forward wave
a2=0.;
% amplitufe of the backward wave
f=1e9;
% frequency
omega=2*pi*f;
alpha=0;
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
hold off;
for t=t1:dt:t2
    e=a1.*cos(omega*t-k.*z)+a2.*cos(omega*t+k.*z);
    plot(z,e);
    hold on;
    ze=rem((ze+omega*dt/k),10*lambda);
    eb=exp(-alpha.*ze).*cos(omega*t-k.*ze);
 %   bar(ze,eb,'-m');
    hold off;
    axis([-inf inf -1.5*(a1+a2) 1.5*(a1+a2)]); 
    drawnow;
%   r=input('frame number');
end

