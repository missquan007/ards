%fig3c
X=xlsread('age.xlsx', 'A1:A9399');
[f,xi]=ksdensity(X);
plot(f,xi,'k');
set(gca,'XTick',[0.01,0.02]);
set(gca,'YTick',[20,40,60,80]);
grid on;

%fig3d
X=xlsread('apache_score.xlsx', 'A1:A9400');
[f,xi]=ksdensity(X);
plot(f,xi,'k');
set(gca,'XTick',[0.000,0.005,0.010]);
set(gca,'YTick',[0,50,100,150,200]);
grid on;

%fig3e
x1=xlsread('los.xlsx', 'A2:A8779');
x2=xlsread('los.xlsx', 'B2:B8779');
X = [x1 x2];
boxplot(X,Colors="k",Symbol='o',MedianStyle='line')
set(gca,'YTick',[0,10,20,30]);
grid on;

%fig3f
Y=xlsread('fig3f.xlsx', 'B1:B18');
c = barh(Y,'EdgeColor','none','FaceColor','#959595');
set(gca,'XTick',[0,0.05,0.1,0.15,0.2,0.25]);
grid on;
