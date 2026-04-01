function [] = position_visualization_comp_hill(t500,t20,a1,a2,a3,a4,a5,a6,fig,data,ax,unit)

%% This function compares the results of fixed gain approach with gain-optimisation
%% approaches in Hill frame.
%
%% define colours
myred           = [216 30 49]/255;
myblue          = [27 99 157]/255;
myblack         = [0 0 0]/255;
mygreen         = [0 128 0]/255;
mycyan          = [2 169 226]/255;
myyellow        = [251 194 13]/255;
mygray          = [89 89 89]/255;

set(groot,'defaultAxesColorOrder',[myyellow;myblue]);
%;mycyan;mygray
% define plot parameters
alw             = 1.5;                               % AxesLineWidth
fsz             = 18;                                % Fontsize
lw              = 2.5;                               % LineWidth
msz             = 40;                                % MarkerSize

set(0,'defaultLineLineWidth',alw);                   % set the default axis line width to alw
set(0,'defaultLineLineWidth',lw);                    % set the default line width to lw
set(0,'defaultLineMarkerSize',msz);                  % set the default line marker size to msz
set(0,'defaultAxesFontName', 'Times New Roman');     % set font type

%% Plot for fixed gain and gain scheduling
hFig            = figure(fig); clf;
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

plot(t500,a1,'-',t500,a2,'--')

axis square;
xlabel(' Time, [s]')
ylabel("Relative " +data +" of Deputy Satellite in Hill Frame along " +ax +"-axis, "+unit)
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)

[hleg] = legend('Fixed Gain','Dynamic Gain Scheduling');
set(hleg,'EdgeColor',hleg.Color);
set(hleg,'Location','northeast');


%% Plot for optimization algorithms
set(groot,'defaultAxesColorOrder',[myyellow;mycyan;mygreen;myred]);
%;mycyan;mygray
% define plot parameters
alw             = 1.5;                               % AxesLineWidth
fsz             = 18;                                % Fontsize
lw              = 2.5;                               % LineWidth
msz             = 40;                                % MarkerSize

set(0,'defaultLineLineWidth',alw);                   % set the default axis line width to alw
set(0,'defaultLineLineWidth',lw);                    % set the default line width to lw
set(0,'defaultLineMarkerSize',msz);                  % set the default line marker size to msz
set(0,'defaultAxesFontName', 'Times New Roman');     % set font type


hFig            = figure(fig+1); clf;
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

plot(t20,a3,'-',t20,a4,'-.',t20,a5,'--',t20,a6,':')

axis square;
xlabel(' Time, [s]')
ylabel("Relative " +data +" of Deputy Satellite in Hill Frame along " +ax +"-axis, "+unit)
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)

[hleg] = legend('PSO','ALO','GWO','WOA');
set(hleg,'EdgeColor',hleg.Color);
set(hleg,'Location','northeast');


end