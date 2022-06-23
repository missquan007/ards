%计算OR值
x=xlsread('fig4_longstay.xlsx', 'A2:A9400');
y=xlsread('fig4_longstay.xlsx', 'AD2:AD9400');
[b,stats]=regress(y,x);
exp(b)

%OR plot
Y=xlsread('Longstay_OR.xlsx', 'B1:B15');%与长期住院亚群最相关的前15个变量OR值
%Y=xlsread('Rapiddeath_OR.xlsx', 'B1:B15');与快速死亡亚群最相关的前15个变量OR值
%Y=xlsread('Recovery_OR.xlsx', 'B1:B15');与自愈亚群最相关的前15个变量OR值
baseValue = 1;
c = barh(Y,'BaseValue',baseValue,'EdgeColor','none');
grid on;
set(gca,'XTick',[0.1,0.3,0.5,1.0,2.0,3.0,5.0]);

color1 = [126, 47, 142] ./ 255;  % '#7E2F8E' 
color2 = [34, 139, 34] ./ 255;   % '#228B22' 

c.FaceColor = 'flat';
for k = 1 : length(Y)
    if Y(k) > baseValue
        c.CData(k, :) = color1;
    else
        c.CData(k, :) = color2;
    end
end


