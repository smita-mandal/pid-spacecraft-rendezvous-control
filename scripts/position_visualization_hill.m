function [] = position_visualization_hill(t,x,y,z,x_dot,y_dot,z_dot)

%% This function generates plots for rendezvous mission in Hill frame.
%
%% define colours
myred           = [216 30 49]/255;
myblue          = [27 99 157]/255;
myblack         = [0 0 0]/255;
mygreen         = [0 128 0]/255;
mycyan          = [2 169 226]/255;
myyellow        = [251 194 13]/255;
mygray          = [89 89 89]/255;

set(groot,'defaultAxesColorOrder',[myblue]);
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
hFig            = figure(1); clf;
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

plot(t,x)
%fprintf('Step Response Characteristics: Position in Hill Frame along X-axis');
%stepinfo(x,t)

axis square;
xlabel(' Time, [s]')
ylabel('Relative position of Deputy Satellite in Hill Frame along X-axis, [m]')
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)

%% y-axis
hFig            = figure(2); clf;
set(groot,'defaultAxesColorOrder',[mygreen]);
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

plot(t , y)
%fprintf('Step Response Characteristics: Position in Hill Frame along Y-axis');
%stepinfo(y,t)

axis square;
xlabel(' Time, [s]')
ylabel('Relative position of Deputy Satellite in Hill Frame along Y-axis, [m]')
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)

%% z-axis
hFig            = figure(3); clf;
set(groot,'defaultAxesColorOrder',[myred]);
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

plot(t, z)
%fprintf('Step Response Characteristics: Position in Hill Frame along Z-axis');
%stepinfo(z,t)

axis square;
xlabel(' Time, [s]')
ylabel('Relative position of Deputy Satellite in Hill Frame along Z-axis, [m]')
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)

%% x-axis
hFig            = figure(4); clf;
set(groot,'defaultAxesColorOrder',[mycyan]);
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

plot(t, x_dot)
%fprintf('Step Response Characteristics: Velocity in Hill Frame along Z-axis');
%stepinfo(x_dot,t)

axis square;
xlabel(' Time, [s]')
ylabel('Relative velocity of Deputy Satellite in Hill Frame along X-axis, [m/s]')
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)

%% y-axis
hFig            = figure(5); clf;
set(groot,'defaultAxesColorOrder',[myyellow]);
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

plot(t , y_dot)
%fprintf('Step Response Characteristics: Velocity in Hill Frame along Y-axis');
%stepinfo(y_dot,t)


axis square;
xlabel(' Time, [s]')
ylabel('Relative velocity of Deputy Satellite in Hill Frame along Y-axis, [m/s]')
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)

%% z-axis
hFig            = figure(6); clf;
set(groot,'defaultAxesColorOrder',[myblack]);
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor

plot(t, z_dot)
%fprintf('Step Response Characteristics: Velocity in Hill Frame along Z-axis');
%stepinfo(z_dot,t)

axis square;
xlabel(' Time, [s]')
ylabel('Relative velocity of Deputy Satellite in Hill Frame along Z-axis, [m/s]')
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)

end
