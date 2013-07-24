function [] = profilerInput()

echo on;

% generating random data set
x=load('uscities.txt');
N=size(x,2);

figure(1);
clf;
plot(x(1,:),x(2,:),'k.');
set(gca,'FontSize',18);
title('INPUT');
ax=axis;
drawnow;

% connecting data points within radius of 0.1 and corrupting it with 10% noise
D=dissimilar(x,0.05^2,30,0.1);

figure(2);
clf;
plot(x(1,:),x(2,:),'k.');
set(gca,'FontSize',18);
title('epsilon-GRAPH');
ax=axis;
hold on;
gplot(D,x');
drawnow;

% run fastmvu
[y,det]=fastmvu(D,2,'leigsdim',30,'eta',1e-04,'maxiter',500);

% plot output
figure(3);
clf;
y(1,:)=y(1,:).*sign(y(1,445));
y(2,:)=y(2,:).*sign(y(2,445));
plot(y(1,:),y(2,:),'k.');
set(gca,'FontSize',18);
title('OUTPUT');
axis(ax);

end
