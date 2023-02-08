clear all; close all; clc

x=-2.5:0.1:2.5; y=-3:0.1:3; t=0:0.1:5*pi;
[X,Y,T]=meshgrid(x,y,t);
k = 2;
const = (-1)^k*(2^k*k*sqrt(pi))^(-1/2);
syms z;
f(z) = exp(-z.^2/2)*diff(exp(-z.^2),z,k);
z = X.^2+Y.^2;

A = const.*eval(f).*cos(3/2.*T)+(sech(X).*tanh(X).*exp(-0.2*Y.^2)).*sin(T)...
    +X.^2.*(1/100*Y.^2);

for j=1:length(t)
  pcolor(x,y,A(:,:,j)), shading interp, caxis([-1 1]), drawnow
end

figure(1)
for j=1:10
  subplot(2,5,j)
  pcolor(x,y,A(:,:,10*(j-1)+1)), colormap(hot), shading interp, caxis([-1 1]), axis off
  
end


figure(2)
model=parafac(A,3);
[A1,A2,A3]=fac2let(model);
subplot(3,1,1), plot(x,A2,'Linewidth',[2])
subplot(3,1,2), plot(y,A1,'Linewidth',[2])
subplot(3,1,3), plot(t,A3,'Linewidth',[2])

subplot(3,1,1), set(gca,'Xtick',[-2.5 0 2.5],'Fontsize',[15]), set(gca,'Ytick',[-.2 0 .4],'Fontsize',[15])
title("x")
subplot(3,1,2), set(gca,'Xtick',[-3 0 3],'Fontsize',[15])
title("y")
subplot(3,1,3), set(gca,'Xlim',[0 5*pi],'Xtick',[0 5*pi 10*pi],'Xticklabels',{'0','5\pi','10\pi'},'Fontsize',[15])
title("t")

result = randn(size(A));

for i = 1:32
    result(:,:,i) = A3(i,1)*(A1*A2.')+A3(i,2)*(A1*A2.');
end
    

