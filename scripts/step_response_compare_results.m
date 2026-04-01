%% This file compares step response results for fixed gain approach with 
%% gain-optimization approaches.

load('D:\Study\CAPSTONE THESIS\thesis_code\SCATTER PLOT\rendezvous_stepdata.mat','time', 'settling_time_x', 'settling_time_y','settling_time_z',...
        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');
st_x1 = settling_time_x;
rt_x1 = rise_time_x;
oshoot_x1 = overshoot_x;
ushoot_x1 = undershoot_x;

st_y1 = settling_time_y;
rt_y1 = rise_time_y;
oshoot_y1 = overshoot_y;
ushoot_y1 = undershoot_y;

st_z1 = settling_time_z;
rt_z1 = rise_time_z;
oshoot_z1 = overshoot_z;
ushoot_z1 = undershoot_z;

st_xdot1 = settling_time_x_dot;
rt_xdot1 = rise_time_x_dot;
oshoot_xdot1 = overshoot_x_dot;
ushoot_xdot1 = undershoot_x_dot;

st_ydot1 = settling_time_y_dot;
rt_ydot1 = rise_time_y_dot;
oshoot_ydot1 = overshoot_y_dot;
ushoot_ydot1 = undershoot_y_dot;

st_zdot1 = settling_time_z_dot;
rt_zdot1 = rise_time_z_dot;
oshoot_zdot1 = overshoot_z_dot;
ushoot_zdot1 = undershoot_z_dot;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('D:\Study\CAPSTONE THESIS\thesis_code\SCATTER PLOT\rendezvous_optimization_GWO_stepdata.mat',...
    'time', 'settling_time_x', 'settling_time_y','settling_time_z',...
        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');

st_x2 = settling_time_x;
rt_x2 = rise_time_x;
oshoot_x2 = overshoot_x;
ushoot_x2 = undershoot_x;

st_y2 = settling_time_y;
rt_y2 = rise_time_y;
oshoot_y2 = overshoot_y;
ushoot_y2 = undershoot_y;

st_z2 = settling_time_z;
rt_z2 = rise_time_z;
oshoot_z2 = overshoot_z;
ushoot_z2 = undershoot_z;

st_xdot2 = settling_time_x_dot;
rt_xdot2 = rise_time_x_dot;
oshoot_xdot2 = overshoot_x_dot;
ushoot_xdot2 = undershoot_x_dot;

st_ydot2 = settling_time_y_dot;
rt_ydot2 = rise_time_y_dot;
oshoot_ydot2 = overshoot_y_dot;
ushoot_ydot2 = undershoot_y_dot;

st_zdot2 = settling_time_z_dot;
rt_zdot2 = rise_time_z_dot;
oshoot_zdot2 = overshoot_z_dot;
ushoot_zdot2 = undershoot_z_dot;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('D:\Study\CAPSTONE THESIS\thesis_code\SCATTER PLOT\rendezvous_optimization_WOA_stepdata.mat','time', 'settling_time_x', 'settling_time_y','settling_time_z',...
        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');
st_x3 = settling_time_x;
rt_x3 = rise_time_x;
oshoot_x3 = overshoot_x;
ushoot_x3 = undershoot_x;

st_y3 = settling_time_y;
rt_y3 = rise_time_y;
oshoot_y3 = overshoot_y;
ushoot_y3 = undershoot_y;

st_z3 = settling_time_z;
rt_z3 = rise_time_z;
oshoot_z3 = overshoot_z;
ushoot_z3 = undershoot_z;

st_xdot3 = settling_time_x_dot;
rt_xdot3 = rise_time_x_dot;
oshoot_xdot3 = overshoot_x_dot;
ushoot_xdot3 = undershoot_x_dot;

st_ydot3 = settling_time_y_dot;
rt_ydot3 = rise_time_y_dot;
oshoot_ydot3 = overshoot_y_dot;
ushoot_ydot3 = undershoot_y_dot;

st_zdot3 = settling_time_z_dot;
rt_zdot3 = rise_time_z_dot;
oshoot_zdot3 = overshoot_z_dot;
ushoot_zdot3 = undershoot_z_dot;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('D:\Study\CAPSTONE THESIS\thesis_code\SCATTER PLOT\rendezvous_optimization_ALO_stepdata.mat','time', 'settling_time_x', 'settling_time_y','settling_time_z',...
        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');
st_x4 = settling_time_x;
rt_x4 = rise_time_x;
oshoot_x4 = overshoot_x;
ushoot_x4 = undershoot_x;

st_y4 = settling_time_y;
rt_y4 = rise_time_y;
oshoot_y4 = overshoot_y;
ushoot_y4 = undershoot_y;

st_z4 = settling_time_z;
rt_z4 = rise_time_z;
oshoot_z4 = overshoot_z;
ushoot_z4 = undershoot_z;

st_xdot4 = settling_time_x_dot;
rt_xdot4 = rise_time_x_dot;
oshoot_xdot4 = overshoot_x_dot;
ushoot_xdot4 = undershoot_x_dot;

st_ydot4 = settling_time_y_dot;
rt_ydot4 = rise_time_y_dot;
oshoot_ydot4 = overshoot_y_dot;
ushoot_ydot4 = undershoot_y_dot;

st_zdot4 = settling_time_z_dot;
rt_zdot4 = rise_time_z_dot;
oshoot_zdot4 = overshoot_z_dot;
ushoot_zdot4 = undershoot_z_dot;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('D:\Study\CAPSTONE THESIS\thesis_code\SCATTER PLOT\rendezvous_optimization_PSO_stepdata.mat','time', 'settling_time_x', 'settling_time_y','settling_time_z',...
        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');
st_x5 = settling_time_x;
rt_x5 = rise_time_x;
oshoot_x5 = overshoot_x;
ushoot_x5 = undershoot_x;

st_y5 = settling_time_y;
rt_y5 = rise_time_y;
oshoot_y5 = overshoot_y;
ushoot_y5 = undershoot_y;

st_z5 = settling_time_z;
rt_z5 = rise_time_z;
oshoot_z5 = overshoot_z;
ushoot_z5 = undershoot_z;

st_xdot5 = settling_time_x_dot;
rt_xdot5 = rise_time_x_dot;
oshoot_xdot5 = overshoot_x_dot;
ushoot_xdot5 = undershoot_x_dot;

st_ydot5 = settling_time_y_dot;
rt_ydot5 = rise_time_y_dot;
oshoot_ydot5 = overshoot_y_dot;
ushoot_ydot5 = undershoot_y_dot;

st_zdot5 = settling_time_z_dot;
rt_zdot5 = rise_time_z_dot;
oshoot_zdot5 = overshoot_z_dot;
ushoot_zdot5 = undershoot_z_dot;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Settling Time
%step_response_compare(st_x1,st_x2,st_x3,st_x4,st_x5,1,"Settling Time","position","X","[second]");
%step_response_compare(st_y1,st_y2,st_y3,st_y4,st_y5,2,"Settling Time","position","Y","[second]");
%step_response_compare(st_z1,st_z2,st_z3,st_z4,st_z5,3,"Settling Time","position","Z","[second]");
%step_response_compare(st_xdot1,st_xdot2,st_xdot3,st_xdot4,st_xdot5,4,"Settling Time","velocity","X","[second]");
%step_response_compare(st_ydot1,st_ydot2,st_ydot3,st_ydot4,st_ydot5,5,"Settling Time","velocity","Y","[second]");
%step_response_compare(st_zdot1,st_zdot2,st_zdot3,st_zdot4,st_zdot5,6,"Settling Time","velocity","Z","[second]");

%%%Rise Time
%%step_response_compare(rt_x1,rt_x2,rt_x3,rt_x4,rt_x5,7,"Rise Time","position","X","[second]");
%%step_response_compare(rt_y1,rt_y2,rt_y3,rt_y4,rt_y5,8,"Rise Time","position","Y","[second]");
%%step_response_compare(rt_z1,rt_z2,rt_z3,rt_z4,rt_z5,9,"Rise Time","position","Z","[second]");
%%step_response_compare(rt_xdot1,rt_xdot2,rt_xdot3,rt_xdot4,rt_xdot5,10,"Rise Time","velocity","X","[second]");
%%step_response_compare(rt_ydot1,rt_ydot2,rt_ydot3,rt_ydot4,rt_ydot5,11,"Rise Time","velocity","Y","[second]");
%%step_response_compare(rt_zdot1,rt_zdot2,rt_zdot3,rt_zdot4,rt_zdot5,12,"Rise Time","velocity","Z","[second]");


%Overshoot
step_response_compare(oshoot_x1,oshoot_x2,oshoot_x3,oshoot_x4,oshoot_x5,13,"Overshoot","position","X","[m]");
step_response_compare(oshoot_y1,oshoot_y2,oshoot_y3,oshoot_y4,oshoot_y5,14,"Overshoot","position","Y","[m]");
step_response_compare(oshoot_z1,oshoot_z2,oshoot_z3,oshoot_z4,oshoot_z5,15,"Overshoot","position","Z","[m]");
step_response_compare(oshoot_xdot1,oshoot_xdot2,oshoot_xdot3,oshoot_xdot4,oshoot_xdot5,16,"Overshoot","velocity","X","[m/s]");
step_response_compare(oshoot_ydot1,oshoot_ydot2,oshoot_ydot3,oshoot_ydot4,oshoot_ydot5,17,"Overshoot","velocity","Y","[m/s]");
step_response_compare(oshoot_zdot1,oshoot_zdot2,oshoot_zdot3,oshoot_zdot4,oshoot_zdot5,18,"Overshoot","velocity","Z","[m/s]");
%%
%%%Overshoot
%%step_response_compare(ushoot_x1,ushoot_x2,ushoot_x3,ushoot_x4,ushoot_x5,19,"Undershoot","position","X","[m]");
%%step_response_compare(ushoot_y1,ushoot_y2,ushoot_y3,ushoot_y4,ushoot_y5,20,"Undershoot","position","Y","[m]");
%%step_response_compare(ushoot_z1,ushoot_z2,ushoot_z3,ushoot_z4,ushoot_z5,21,"Undershoot","position","Z","[m]");
%%step_response_compare(ushoot_xdot1,ushoot_xdot2,ushoot_xdot3,ushoot_xdot4,ushoot_xdot5,22,"Undershoot","velocity","X","[m/s]");
%%step_response_compare(ushoot_ydot1,ushoot_ydot2,ushoot_ydot3,ushoot_ydot4,ushoot_ydot5,23,"Undershoot","velocity","Y","[m/s]");
%%step_response_compare(ushoot_zdot1,ushoot_zdot2,ushoot_zdot3,ushoot_zdot4,ushoot_zdot5,24,"Undershoot","velocity","Z","[m/s]");

function [] = step_response_compare(s1,s2,s3,s4,s5,fig,compdata,data,ax,unit)


%
%% define colours
myred           = [216 30 49]/255;
myblue          = [27 99 157]/255;
myblack         = [0 0 0]/255;
mygreen         = [0 128 0]/255;
mycyan          = [2 169 226]/255;
myyellow        = [251 194 13]/255;
mygray          = [89 89 89]/255;

%% Plot for optimization algorithms
%set(groot,'defaultAxesColorOrder',[myblue;myblack;myyellow;myred;mygreen;mycyan]);
% define plot parameters
alw             = 1.5;                               % AxesLineWidth
fsz             = 18;                                % Fontsize
lw              = 2.5;                               % LineWidth
msz             = 40;                                % MarkerSize

set(0,'defaultLineLineWidth',alw);                   % set the default axis line width to alw
set(0,'defaultLineLineWidth',lw);                    % set the default line width to lw
set(0,'defaultLineMarkerSize',msz);                  % set the default line marker size to msz
set(0,'defaultAxesFontName', 'Times New Roman');     % set font type


hFig            = figure(fig); clf;
set(gcf, 'Color', [1 1 1]);                         % Sets figure background
set(gca, 'Color', [1 1 1]);                         % Sets axes background
hold on
grid on
grid minor


%scatter( s1,[1],'b',"filled");
%hold on
%scatter( s2,[2],'k',"filled");
%hold on
%scatter( s3,[3],'y',"filled");
%hold on
%scatter( s4,[4],'r',"filled");
%hold on
%scatter( s5,[5],'g',"filled");
%hold off

h1 = scatter( s1, 1*ones(size(s1)), 'b', 'filled', 'DisplayName','Fixed Gain' );
h2 = scatter( s2, 2*ones(size(s2)), 'k', 'filled', 'DisplayName','GWO'       );
h3 = scatter( s3, 3*ones(size(s3)), 'y', 'filled', 'DisplayName','WOA'       );
h4 = scatter( s4, 4*ones(size(s4)), 'r', 'filled', 'DisplayName','ALO'       );
h5 = scatter( s5, 5*ones(size(s5)), 'g', 'filled', 'DisplayName','PSO'       );
hold off

set(gca,'XScale','log');
axis square;
xlabel(compdata +" for Step Response of relative "+data+" in "+ax+"-axis"+", "+ unit)
ylabel('PID Gain Tuning Methods')
box on
set(gca,'GridLineStyle','-')                        % set gridline and font properties
set(gca,'MinorGridLineStyle','-')
set(gca,'GridColor','k')
set(gca,'MinorGridColor','k')
set(findall(hFig, '-property', 'FontSize'), 'FontSize', fsz)

%[hleg] = legend("Fixed Gain","","GWO","","WOA","ALO","","PSO");
%set(hleg,'EdgeColor',hleg.Color);
%set(hleg,'Location','northeast');
legend([h1,h2,h3,h4,h5], 'Location','northeast', 'EdgeColor','k');


end