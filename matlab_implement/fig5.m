%fig5A
function [fitresult, gof] = createFits(x1, y1, x2, y2, x3, y3)
x1=xlsread('fig5a_recovery.xlsx', 'A2:A97');
y1=xlsread('fig5a_recovery.xlsx', 'B2:B97');
x2=xlsread('fig5a_longstay.xlsx', 'A2:A98');
y2=xlsread('fig5a_longstay.xlsx', 'B2:B98');
x3=xlsread('fig5a_rapiddeath.xlsx', 'A2:A78');
y3=xlsread('fig5a_rapiddeath.xlsx', 'B2:B78');

fitresult = cell( 3, 1 );
gof = struct( 'sse', cell( 3, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

[xData, yData] = prepareCurveData( x1, y1 );
[xData1, yData1] = prepareCurveData( x2, y2 );
[xData2, yData2] = prepareCurveData( x3, y3 );

ft = fittype( {'(sin(x-pi))', '((x-10)^2)', '1'}, 'independent', 'x', 'dependent', 'y', 'coefficients', {'a', 'b', 'c'} );
[fitresult{1}, gof(1)] = fit( xData, yData, ft );
[fitresult{2}, gof(2)] = fit( xData1, yData1, ft );
[fitresult{3}, gof(3)] = fit( xData2, yData2, ft );

h=plot( fitresult{1}, xData, yData);
hold on;
h1=plot( fitresult{2}, xData1, yData1);
hold on;
h2=plot( fitresult{3}, xData2, yData2);
hold on;
set(gca,'XTick',[0,8,16,24]);
set(gca,'YTick',[3,6,9]);

xlabel( 'x1', 'Interpreter', 'none' );
ylabel( 'y1', 'Interpreter', 'none' );
grid on
hold on

%fig5B
function [fitresult, gof] = createFits(x1, y1, x2, y2, x3, y3)
x1=xlsread('fig5b_recovery.xlsx', 'A2:A98');
y1=xlsread('fig5b_recovery.xlsx', 'B2:B98');
x2=xlsread('fig5b_longstay.xlsx', 'A2:A98');
y2=xlsread('fig5b_longstay.xlsx', 'B2:B98');
x3=xlsread('fig5b_rapiddeath.xlsx', 'A2:A84');
y3=xlsread('fig5b_rapiddeath.xlsx', 'B2:B84');


fitresult = cell( 3, 1 );
gof = struct( 'sse', cell( 3, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

[xData, yData] = prepareCurveData( x1, y1 );
[xData1, yData1] = prepareCurveData( x2, y2 );
[xData2, yData2] = prepareCurveData( x3, y3 );

ft = fittype( {'(sin(x-pi))', '((x-10)^2)', '1'}, 'independent', 'x', 'dependent', 'y', 'coefficients', {'a', 'b', 'c'} );
[fitresult{1}, gof(1)] = fit( xData, yData, ft );
[fitresult{2}, gof(2)] = fit( xData1, yData1, ft );
[fitresult{3}, gof(3)] = fit( xData2, yData2, ft );

h=plot( fitresult{1}, xData, yData);
hold on;
h1=plot( fitresult{2}, xData1, yData1);
hold on;
h2=plot( fitresult{3}, xData2, yData2);
hold on;
set(gca,'XTick',[0,8,16,24]);
set(gca,'YTick',[7.2 7.3 7.4]);

xlabel( 'x1', 'Interpreter', 'none' );
ylabel( 'y1', 'Interpreter', 'none' );
grid on
hold on

%fig5C
function [fitresult, gof] = createFits(x1, y1, x2, y2, x3, y3)
x1=xlsread('fig5c_recovery.xlsx', 'A2:A98');
y1=xlsread('fig5c_recovery.xlsx', 'B2:B98');
x2=xlsread('fig5c_longstay.xlsx', 'A2:A98');
y2=xlsread('fig5c_longstay.xlsx', 'B2:B98');
x3=xlsread('fig5c_rapiddeath.xlsx', 'A2:A81');
y3=xlsread('fig5c_rapiddeath.xlsx', 'B2:B81');


fitresult = cell( 3, 1 );
gof = struct( 'sse', cell( 3, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

[xData, yData] = prepareCurveData( x1, y1 );
[xData1, yData1] = prepareCurveData( x2, y2 );
[xData2, yData2] = prepareCurveData( x3, y3 );

ft = fittype( {'(sin(x-pi))', '((x-10)^2)', '1'}, 'independent', 'x', 'dependent', 'y', 'coefficients', {'a', 'b', 'c'} );
[fitresult{1}, gof(1)] = fit( xData, yData, ft );
[fitresult{2}, gof(2)] = fit( xData1, yData1, ft );
[fitresult{3}, gof(3)] = fit( xData2, yData2, ft );

h=plot( fitresult{1}, xData, yData);
hold on;
h1=plot( fitresult{2}, xData1, yData1);
hold on;
h2=plot( fitresult{3}, xData2, yData2);
hold on;
set(gca,'XTick',[0,8,16,24]);
set(gca,'YTick',[16,20,24,28]);

xlabel( 'x1', 'Interpreter', 'none' );
ylabel( 'y1', 'Interpreter', 'none' );
grid on
hold on