function [] = position_visualization_icrf(t,x_c,x_d,y_c,y_d,z_c,z_d,xdot_c,xdot_d,ydot_c,ydot_d,zdot_c,zdot_d)

%% This function generates plots for rendezvous mission in ICRF frame.
%
%% define colours
myred           = [216 30 49]/255;
myblue          = [27 99 157]/255;
myblack         = [0 0 0]/255;
mygreen         = [0 128 0]/255;
mycyan          = [2 169 226]/255;
myyellow        = [251 194 13]/255;
mygray          = [89 89 89]/255;

%set(groot,'defaultAxesColorOrder',[myred;mycyan]);
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

%% x-axis
hFig            = figure(7); clf;
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

h1 = plot(t, x_c,'r-','DisplayName', 'Chief Spacecraft');
hold on
h2 = plot(t,x_d,'c--', 'DisplayName', 'Deputy Spacecraft');
hold off

legend([h1(1), h2(1)], 'Location', 'northeast');  

axis square;
xlabel(' Time, [s]')
ylabel('Position of Chief and Deputy Satellite in ICRF Frame along X-axis, [m]')
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)




%% y-axis
hFig            = figure(8); clf;
%set(groot,'defaultAxesColorOrder',[myred;myyellow]);
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

h1 = plot(t, y_c,'r-','DisplayName', 'Chief Spacecraft');
hold on
h2 = plot(t,y_d,'y--', 'DisplayName', 'Deputy Spacecraft');
hold off

legend([h1(1), h2(1)], 'Location', 'northeast');  


axis square;
xlabel(' Time, [s]')
ylabel('Position of Chief and Deputy Satellite in ICRF Frame along Y-axis, [m]')
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)



%% z-axis
hFig            = figure(9); clf;
%set(groot,'defaultAxesColorOrder',[myred;mygreen]);
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

h1 = plot(t, z_c,'r-','DisplayName', 'Chief Spacecraft');
hold on
h2 = plot(t,z_d,'g--', 'DisplayName', 'Deputy Spacecraft');
hold off

legend([h1(1), h2(1)], 'Location', 'northeast');  

axis square;
xlabel(' Time, [s]')
ylabel('Position of Chief and Deputy Satellite in ICRF Frame along Z-axis, [m]')
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)



%% x-axis
hFig            = figure(10); clf;
%set(groot,'defaultAxesColorOrder',[myred;mycyan]);
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

h1 = plot(t, xdot_c,'k-','DisplayName', 'Chief Spacecraft');
hold on
h2 = plot(t,xdot_d,'c--', 'DisplayName', 'Deputy Spacecraft');
hold off

legend([h1(1), h2(1)], 'Location', 'northeast');  

axis square;
xlabel(' Time, [s]')
ylabel('Velocity of Chief and Deputy Satellite in ICRF Frame along X-axis, [m/s]')
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)


%% y-axis
hFig            = figure(11); clf;
%set(groot,'defaultAxesColorOrder',[myred;myyellow]);
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

h1 = plot(t, ydot_c,'k-','DisplayName', 'Chief Spacecraft');
hold on
h2 = plot(t,ydot_d,'y--', 'DisplayName', 'Deputy Spacecraft');
hold off

legend([h1(1), h2(1)], 'Location', 'northeast');  


axis square;
xlabel(' Time, [s]')
ylabel("Velocity of Chief and Deputy Satellite in ICRF Frame along Y-axis, [m/s]")
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)



%% z-axis
hFig            = figure(12); clf;
%set(groot,'defaultAxesColorOrder',[myred;mygreen]);
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

h1 = plot(t, zdot_c,'k-','DisplayName', 'Chief Spacecraft');
hold on
h2 = plot(t,zdot_d,'g--', 'DisplayName', 'Deputy Spacecraft');
hold off

legend([h1(1), h2(1)], 'Location', 'northeast');

axis square;
xlabel(' Time, [s]')
ylabel("Velocity of Chief and Deputy Satellite in ICRF Frame along Z-axis, [m/s]")
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)


end
