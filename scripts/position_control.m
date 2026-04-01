%% position_control.m
%% Run this file by selecting simulink model through the variable, "mdl"
%% This file, once run, collects data for 100 data points by doing a batch run
%% and save the data in three output files. Data is loaded from these output files into
%% individual variables. After that, following functions are called
%% for data visualization: 
%% position_visualization_hill(t,x,y,z,x_dot,y_dot,z_dot),
%% position_visualization_icrf(t,x_c,x_d,y_c,y_d,z_c,z_d,xdot_c,xdot_d,ydot_c,ydot_d,zdot_c,zdot_d),
%% position_visualization_comp_hill(t500,t20,a1,a2,a3,a4,a5,a6,fig,data,ax,unit) and 
%% step_response_compare(st_x1,st_x2,st_x3,st_x4,st_x5,st_x6,13,"Settling Time","position","X","[second]")
%%##################################################################################################
%%##################################################################################################
mdl = 'rendezvous_optimization_PSO';
sim_time = 600;
trim = 20;
%% Parameters for chief spacecraft
m0_C = 950; % kg; Initial mass of deputy 
omega_T = deg2rad(0.1); %angular orbital velocity of target spacecraft


%% Parameters for deputy spacecraft
mDot = 0.000102; %kg/s
m0 = 4; % kg; Initial mass of deputy 
Isp = 50; %s
Ve_x = 9.8 * Isp; %m/s
Ve = [Ve_x; 0; 0];

I=[1,0,0;0,1,0;0,0,1]; %Identity matrix

%% systen model for X axis
%A = [0,1,0,0,0,0;(3*(omega_T^2)),0,0,(2*omega_T),0,0;0,0,0,1,0,0;0,...
    %(-2*omega_T),0,0,0,0;0,0,0,0,0,1;0,0,0,0,(-(omega_T^2)),0]
Ax = [0,1;(3*(omega_T^2)),0];
Bx = [0;1/m0];
Cx = eye(2);
Dx = zeros(2,1);

% Controller gains
Ki_x= 1;
Kp_x =1;
Kd_x =20;


% Reachability/Controllability m0atrix
Wx = ctrb(Ax, Bx);
det(Wx);

%% systen model for Y axis
Ay = [0,1;0,0];
By = [0;1/m0];
Cy = eye(2);
Dy = 0;

% Controller Gains
Ki_y= 0.5;
Kp_y =1;
Kd_y =20;

% Reachability/Controllability matrix
Wy = ctrb(Ay, By);
det(Wy);

%% systen model for Z axis
Az = [0,1;(-(omega_T^2)),0];
Bz = [0;1/m0];
Cz = eye(2);
Dz = 0;

% Controller Gains
Ki_z= 0.05;
Kp_z =0.5;
Kd_z =20;

% Reachability/Controllability matrix
Wz = ctrb(Az, Bz);
det(Wz);


%%#######################################################################
%%#####################################################################
%% Inner Loop Controller

% System Model for x-axis
Ax_i = [0,1;0,0];
Bx_i = [0;1/m0];
Cx_i = eye(2);
Dx_i = [0;0];

% Controller gains
Ki_x_i= 0.5;
Kp_x_i= 5;
Kd_x_i=20;


% Reachability/Controllability matrix
Wx_i = ctrb(Ax_i, Bx_i);
det(Wx_i);

% systen model for Y axis
Ay_i = [0,1;0,0];
By_i = [0;1/m0];
Cy_i = eye(2);
Dy_i = [0;0];

% Controller Gains
Ki_y_i= 1;
Kp_y_i =5;
Kd_y_i =20;

% Reachability/Controllability matrix
Wy_i = ctrb(Ay_i, By_i);
det(Wy_i);

% systen model for Z axis
Az_i = [0,1;0,0];
Bz_i = [0;1/m0];
Cz_i = eye(2);
Dz_i = [0;0];

% Controller Gains
Ki_z_i= 0.5;
Kp_z_i =5;
Kd_z_i =20;

% Reachability/Controllability matrix
Wz_i = ctrb(Az_i, Bz_i);
det(Wz_i);

%############################################################################################
%############################################################################################
%% Load data for all the simulation runs
%[outputfile1,outputfile2,outputfile3]= run_scenario('rendezvous',100,100);
%load(outputfile1,'time', 'settling_time_x', 'settling_time_y','settling_time_z',...
%        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
%        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
%        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
%        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
%        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
%        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');
%st_x1 = settling_time_x;
%rt_x1 = rise_time_x;
%oshoot_x1 = overshoot_x;
%ushoot_x1 = undershoot_x;
%
%st_y1 = settling_time_y;
%rt_y1 = rise_time_y;
%oshoot_y1 = overshoot_y;
%ushoot_y1 = undershoot_y;
%
%st_z1 = settling_time_z;
%rt_z1 = rise_time_z;
%oshoot_z1 = overshoot_z;
%ushoot_z1 = undershoot_z;
%
%st_xdot1 = settling_time_x_dot;
%rt_xdot1 = rise_time_x_dot;
%oshoot_xdot1 = overshoot_x_dot;
%ushoot_xdot1 = undershoot_x_dot;
%
%st_ydot1 = settling_time_y_dot;
%rt_ydot1 = rise_time_y_dot;
%oshoot_ydot1 = overshoot_y_dot;
%ushoot_ydot1 = undershoot_y_dot;
%
%st_zdot1 = settling_time_z_dot;
%rt_zdot1 = rise_time_z_dot;
%oshoot_zdot1 = overshoot_z_dot;
%ushoot_zdot1 = undershoot_z_dot;
%
%%Outputfile2
%load(outputfile2, 'time','x','x_dot','y','y_dot','z','z_dot');
%th1 = time;
%x1 = x;
%y1 = y;
%z1 = z;
%x_dot1 = x_dot;
%y_dot1 = y_dot;
%z_dot1 = z_dot;
%
%%Outputfile3
%load(outputfile3, 't1','x_c','x_d','y_c','y_d','z_c','z_d','xdot_c','xdot_d','ydot_c','ydot_d','zdot_c','zdot_d');
%ti1 = t1;
%x_c1 = x_c;
%x_d1 = x_d;
%y_c1 = y_c;
%y_d1 = y_d;
%z_c1 = z_c;
%z_d1 = z_d;
%xdot_c1 = xdot_c;
%xdot_d1 = xdot_d;
%ydot_c1 = ydot_c;
%ydot_d1 = ydot_d;
%zdot_c1 = zdot_c;
%zdot_d1 = zdot_d;

%%load(outputfile,'time','x','x_dot','y','y_dot','z','z_dot');
%%t500 = time;
%%x1 = x;
%%y1 = y;
%%z1 = z;
%%x_dot1 = x_dot;
%%y_dot1 = y_dot;
%%z_dot1 = z_dot;
%[outputfile1,outputfile2,outputfile3]= run_scenario('rendezvous_gainscheduling',500,500);
%load(outputfile1,'time', 'settling_time_x', 'settling_time_y','settling_time_z',...
%        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
%        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
%        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
%        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
%        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
%        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');
%st_x2 = settling_time_x;
%rt_x2 = rise_time_x;
%oshoot_x2 = overshoot_x;
%ushoot_x2 = undershoot_x;
%
%st_y2 = settling_time_y;
%rt_y2 = rise_time_y;
%oshoot_y2 = overshoot_y;
%ushoot_y2 = undershoot_y;
%
%st_z2 = settling_time_z;
%rt_z2 = rise_time_z;
%oshoot_z2 = overshoot_z;
%ushoot_z2 = undershoot_z;
%
%st_xdot2 = settling_time_x_dot;
%rt_xdot2 = rise_time_x_dot;
%oshoot_xdot2 = overshoot_x_dot;
%ushoot_xdot2 = undershoot_x_dot;
%
%st_ydot2 = settling_time_y_dot;
%rt_ydot2 = rise_time_y_dot;
%oshoot_ydot2 = overshoot_y_dot;
%ushoot_ydot2 = undershoot_y_dot;
%
%st_zdot2 = settling_time_z_dot;
%rt_zdot2 = rise_time_z_dot;
%oshoot_zdot2 = overshoot_z_dot;
%ushoot_zdot2 = undershoot_z_dot;
%
%%Outputfile2
%load(outputfile2, 'time','x','x_dot','y','y_dot','z','z_dot');
%th2 = time;
%x2 = x;
%y2 = y;
%z2 = z;
%x_dot2 = x_dot;
%y_dot2 = y_dot;
%z_dot2 = z_dot;
%
%%Outputfile3
%load(outputfile3, 't1','x_c','x_d','y_c','y_d','z_c','z_d','xdot_c','xdot_d','ydot_c','ydot_d','zdot_c','zdot_d');
%ti2 = t1;
%x_c2 = x_c;
%x_d2 = x_d;
%y_c2 = y_c;
%y_d2 = y_d;
%z_c2 = z_c;
%z_d2 = z_d;
%xdot_c2 = xdot_c;
%xdot_d2 = xdot_d;
%ydot_c2 = ydot_c;
%ydot_d2 = ydot_d;
%zdot_c2 = zdot_c;
%zdot_d2 = zdot_d;
%
%%%load(outputfile, 'x','x_dot','y','y_dot','z','z_dot');
%%%x2 = x;
%%%y2 = y;
%%%z2 = z;
%%%x_dot2 = x_dot;
%%%y_dot2 = y_dot;
%%%z_dot2 = z_dot;
%[outputfile1,outputfile2,outputfile3]= run_scenario('rendezvous_optimization_PSO',100,20);
%load(outputfile1,'time', 'settling_time_x', 'settling_time_y','settling_time_z',...
%        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
%        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
%        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
%        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
%        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
%        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');
%st_x3 = settling_time_x;
%rt_x3 = rise_time_x;
%oshoot_x3 = overshoot_x;
%ushoot_x3 = undershoot_x;
%
%st_y3 = settling_time_y;
%rt_y3 = rise_time_y;
%oshoot_y3 = overshoot_y;
%ushoot_y3 = undershoot_y;
%
%st_z3 = settling_time_z;
%rt_z3 = rise_time_z;
%oshoot_z3 = overshoot_z;
%ushoot_z3 = undershoot_z;
%
%st_xdot3 = settling_time_x_dot;
%rt_xdot3 = rise_time_x_dot;
%oshoot_xdot3 = overshoot_x_dot;
%ushoot_xdot3 = undershoot_x_dot;
%
%st_ydot3 = settling_time_y_dot;
%rt_ydot3 = rise_time_y_dot;
%oshoot_ydot3 = overshoot_y_dot;
%ushoot_ydot3 = undershoot_y_dot;
%
%st_zdot3 = settling_time_z_dot;
%rt_zdot3 = rise_time_z_dot;
%oshoot_zdot3 = overshoot_z_dot;
%ushoot_zdot3 = undershoot_z_dot;
%
%%Outputfile2
%load(outputfile2, 'time','x','x_dot','y','y_dot','z','z_dot');
%th3 = time;
%x3 = x;
%y3 = y;
%z3 = z;
%x_dot3 = x_dot;
%y_dot3 = y_dot;
%z_dot3 = z_dot;
%
%%Outputfile3
%load(outputfile3, 't1','x_c','x_d','y_c','y_d','z_c','z_d','xdot_c','xdot_d','ydot_c','ydot_d','zdot_c','zdot_d');
%ti3 = t1;
%x_c3 = x_c;
%x_d3 = x_d;
%y_c3 = y_c;
%y_d3 = y_d;
%z_c3 = z_c;
%z_d3 = z_d;
%xdot_c3 = xdot_c;
%xdot_d3 = xdot_d;
%ydot_c3 = ydot_c;
%ydot_d3 = ydot_d;
%zdot_c3 = zdot_c;
%zdot_d3 = zdot_d;
%
%%%load(outputfile, 'time','x','x_dot','y','y_dot','z','z_dot');
%%%t20 = time;
%%%x3 = x;
%%%y3 = y;
%%%z3 = z;
%%%x_dot3 = x_dot;
%%%y_dot3 = y_dot;
%%%z_dot3 = z_dot;
%[outputfile1,outputfile2,outputfile3]= run_scenario('rendezvous_optimization_ALO',100,20);
%load(outputfile1,'time', 'settling_time_x', 'settling_time_y','settling_time_z',...
%        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
%        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
%        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
%        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
%        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
%        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');
%st_x4 = settling_time_x;
%rt_x4 = rise_time_x;
%oshoot_x4 = overshoot_x;
%ushoot_x4 = undershoot_x;
%
%st_y4 = settling_time_y;
%rt_y4 = rise_time_y;
%oshoot_y4 = overshoot_y;
%ushoot_y4 = undershoot_y;
%
%st_z4 = settling_time_z;
%rt_z4 = rise_time_z;
%oshoot_z4 = overshoot_z;
%ushoot_z4 = undershoot_z;
%
%st_xdot4 = settling_time_x_dot;
%rt_xdot4 = rise_time_x_dot;
%oshoot_xdot4 = overshoot_x_dot;
%ushoot_xdot4 = undershoot_x_dot;
%
%st_ydot4 = settling_time_y_dot;
%rt_ydot4 = rise_time_y_dot;
%oshoot_ydot4 = overshoot_y_dot;
%ushoot_ydot4 = undershoot_y_dot;
%
%st_zdot4 = settling_time_z_dot;
%rt_zdot4 = rise_time_z_dot;
%oshoot_zdot4 = overshoot_z_dot;
%ushoot_zdot4 = undershoot_z_dot;
%
%%Outputfile2
%load(outputfile2, 'time','x','x_dot','y','y_dot','z','z_dot');
%th4 = time;
%x4 = x;
%y4 = y;
%z4 = z;
%x_dot4 = x_dot;
%y_dot4 = y_dot;
%z_dot4 = z_dot;
%
%%Outputfile3
%load(outputfile3, 't1','x_c','x_d','y_c','y_d','z_c','z_d','xdot_c','xdot_d','ydot_c','ydot_d','zdot_c','zdot_d');
%ti4 = t1;
%x_c4 = x_c;
%x_d4 = x_d;
%y_c4 = y_c;
%y_d4 = y_d;
%z_c4 = z_c;
%z_d4 = z_d;
%xdot_c4 = xdot_c;
%xdot_d4 = xdot_d;
%ydot_c4 = ydot_c;
%ydot_d4 = ydot_d;
%zdot_c4 = zdot_c;
%zdot_d4 = zdot_d;
%
%%%load(outputfile, 'x','x_dot','y','y_dot','z','z_dot');
%%%x4 = x;
%%%y4 = y;
%%%z4 = z;
%%%x_dot4 = x_dot;
%%%y_dot4 = y_dot;
%%%z_dot4 = z_dot;
%[outputfile1,outputfile2,outputfile3]= run_scenario('rendezvous_optimization_GWO',100,20);
%load(outputfile1,'time', 'settling_time_x', 'settling_time_y','settling_time_z',...
%        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
%        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
%        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
%        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
%        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
%        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');
%st_x5 = settling_time_x;
%rt_x5 = rise_time_x;
%oshoot_x5 = overshoot_x;
%ushoot_x5 = undershoot_x;
%
%st_y5 = settling_time_y;
%rt_y5 = rise_time_y;
%oshoot_y5 = overshoot_y;
%ushoot_y5 = undershoot_y;
%
%st_z5 = settling_time_z;
%rt_z5 = rise_time_z;
%oshoot_z5 = overshoot_z;
%ushoot_z5 = undershoot_z;
%
%st_xdot5 = settling_time_x_dot;
%rt_xdot5 = rise_time_x_dot;
%oshoot_xdot5 = overshoot_x_dot;
%ushoot_xdot5 = undershoot_x_dot;
%
%st_ydot5 = settling_time_y_dot;
%rt_ydot5 = rise_time_y_dot;
%oshoot_ydot5 = overshoot_y_dot;
%ushoot_ydot5 = undershoot_y_dot;
%
%st_zdot5 = settling_time_z_dot;
%rt_zdot5 = rise_time_z_dot;
%oshoot_zdot5 = overshoot_z_dot;
%ushoot_zdot5 = undershoot_z_dot;
%
%%Outputfile2
%load(outputfile2, 'time','x','x_dot','y','y_dot','z','z_dot');
%th5 = time;
%x5 = x;
%y5 = y;
%z5 = z;
%x_dot5 = x_dot;
%y_dot5 = y_dot;
%z_dot5 = z_dot;
%
%%Outputfile3
%load(outputfile3, 't1','x_c','x_d','y_c','y_d','z_c','z_d','xdot_c','xdot_d','ydot_c','ydot_d','zdot_c','zdot_d');
%ti5 = t1;
%x_c5 = x_c;
%x_d5 = x_d;
%y_c5 = y_c;
%y_d5 = y_d;
%z_c5 = z_c;
%z_d5 = z_d;
%xdot_c5 = xdot_c;
%xdot_d5 = xdot_d;
%ydot_c5 = ydot_c;
%ydot_d5 = ydot_d;
%zdot_c5 = zdot_c;
%zdot_d5 = zdot_d;
%
%%%load(outputfile, 'x','x_dot','y','y_dot','z','z_dot');
%%%x5 = x;
%%%y5 = y;
%%%z5 = z;
%%%x_dot5 = x_dot;
%%%y_dot5 = y_dot;
%%%z_dot5 = z_dot;
%[outputfile1,outputfile2,outputfile3] = run_scenario('rendezvous_optimization_WOA',100,20);
%load(outputfile1,'time', 'settling_time_x', 'settling_time_y','settling_time_z',...
%        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
%        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
%        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
%        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
%        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
%        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');
%st_x6 = settling_time_x;
%rt_x6 = rise_time_x;
%oshoot_x6 = overshoot_x;
%ushoot_x6 = undershoot_x;
%
%st_y6 = settling_time_y;
%rt_y6 = rise_time_y;
%oshoot_y6 = overshoot_y;
%ushoot_y6 = undershoot_y;
%
%st_z6 = settling_time_z;
%rt_z6 = rise_time_z;
%oshoot_z6 = overshoot_z;
%ushoot_z6 = undershoot_z;
%
%st_xdot6 = settling_time_x_dot;
%rt_xdot6 = rise_time_x_dot;
%oshoot_xdot6 = overshoot_x_dot;
%ushoot_xdot6 = undershoot_x_dot;
%
%st_ydot6 = settling_time_y_dot;
%rt_ydot6 = rise_time_y_dot;
%oshoot_ydot6 = overshoot_y_dot;
%ushoot_ydot6 = undershoot_y_dot;
%
%st_zdot6 = settling_time_z_dot;
%rt_zdot6 = rise_time_z_dot;
%oshoot_zdot6 = overshoot_z_dot;
%ushoot_zdot6 = undershoot_z_dot;
%
%%Outputfile2
%load(outputfile2, 'time','x','x_dot','y','y_dot','z','z_dot');
%th6 = time;
%x6 = x;
%y6 = y;
%z6 = z;
%x_dot6 = x_dot;
%y_dot6 = y_dot;
%z_dot6 = z_dot;
%
%%Outputfile3
%load(outputfile3, 't1','x_c','x_d','y_c','y_d','z_c','z_d','xdot_c','xdot_d','ydot_c','ydot_d','zdot_c','zdot_d');
%ti6 = t1;
%x_c6 = x_c;
%x_d6 = x_d;
%y_c6 = y_c;
%y_d6 = y_d;
%z_c6 = z_c;
%z_d6 = z_d;
%xdot_c6 = xdot_c;
%xdot_d6 = xdot_d;
%ydot_c6 = ydot_c;
%ydot_d6 = ydot_d;
%zdot_c6 = zdot_c;
%zdot_d6 = zdot_d;
%
%%%load(outputfile,'x','x_dot','y','y_dot','z','z_dot');
%%%x6 = x;
%%%y6 = y;
%%%z6 = z;
%%%x_dot6 = x_dot;
%%%y_dot6 = y_dot;
%%%z_dot6 = z_dot;
%%%
%%% Compare response for all PID tuning methods
%%Settling Time
%step_response_compare(st_x1,st_x2,st_x3,st_x4,st_x5,st_x6,13,"Settling Time","position","X","[second]");
%step_response_compare(st_y1,st_y2,st_y3,st_y4,st_y5,st_y6,14,"Settling Time","position","Y","[second]");
%step_response_compare(st_z1,st_z2,st_z3,st_z4,st_z5,st_z6,15,"Settling Time","position","Z","[second]");
%step_response_compare(st_xdot1,st_xdot2,st_xdot3,st_xdot4,st_xdot5,st_xdot6,16,"Settling Time","velocity","X","[second]");
%step_response_compare(st_ydot1,st_ydot2,st_ydot3,st_ydot4,st_ydot5,st_ydot6,17,"Settling Time","velocity","Y","[second]");
%step_response_compare(st_zdot1,st_zdot2,st_zdot3,st_zdot4,st_zdot5,st_zdot6,18,"Settling Time","velocity","Z","[second]");
%
%%Rise Time
%step_response_compare(rt_x1,rt_x2,rt_x3,rt_x4,rt_x5,rt_x6,19,"Rise Time","position","X","[second]");
%step_response_compare(rt_y1,rt_y2,rt_y3,rt_y4,rt_y5,rt_y6,20,"Rise Time","position","Y","[second]");
%step_response_compare(rt_z1,rt_z2,rt_z3,rt_z4,rt_z5,rt_z6,21,"Rise Time","position","Z","[second]");
%step_response_compare(rt_xdot1,rt_xdot2,rt_xdot3,rt_xdot4,rt_xdot5,rt_xdot6,22,"Rise Time","velocity","X","[second]");
%step_response_compare(rt_ydot1,rt_ydot2,rt_ydot3,rt_ydot4,rt_ydot5,rt_ydot6,23,"Rise Time","velocity","Y","[second]");
%step_response_compare(rt_zdot1,rt_zdot2,rt_zdot3,rt_zdot4,rt_zdot5,rt_zdot6,24,"Rise Time","velocity","Z","[second]");
%
%
%%Overshoot
%step_response_compare(oshoot_x1,oshoot_x2,oshoot_x3,oshoot_x4,oshoot_x5,oshoot_x6,25,"Overshoot","position","X","[m]");
%step_response_compare(oshoot_y1,oshoot_y2,oshoot_y3,oshoot_y4,oshoot_y5,oshoot_y6,26,"Overshoot","position","Y","[m]");
%step_response_compare(oshoot_z1,oshoot_z2,oshoot_z3,oshoot_z4,oshoot_z5,oshoot_z6,27,"Overshoot","position","Z","[m]");
%step_response_compare(oshoot_xdot1,oshoot_xdot2,oshoot_xdot3,oshoot_xdot4,oshoot_xdot5,oshoot_xdot6,28,"Overshoot","velocity","X","[m/s]");
%step_response_compare(oshoot_ydot1,oshoot_ydot2,oshoot_ydot3,oshoot_ydot4,oshoot_ydot5,oshoot_ydot6,29,"Overshoot","velocity","Y","[m/s]");
%step_response_compare(oshoot_zdot1,oshoot_zdot2,oshoot_zdot3,oshoot_zdot4,oshoot_zdot5,oshoot_zdot6,30,"Overshoot","velocity","Z","[m/s]");
%
%%Overshoot
%step_response_compare(ushoot_x1,ushoot_x2,ushoot_x3,ushoot_x4,ushoot_x5,ushoot_x6,31,"Undershoot","position","X","[m]");
%step_response_compare(ushoot_y1,ushoot_y2,ushoot_y3,ushoot_y4,ushoot_y5,ushoot_y6,32,"Undershoot","position","Y","[m]");
%step_response_compare(ushoot_z1,ushoot_z2,ushoot_z3,ushoot_z4,ushoot_z5,ushoot_z6,33,"Undershoot","position","Z","[m]");
%step_response_compare(ushoot_xdot1,ushoot_xdot2,ushoot_xdot3,ushoot_xdot4,ushoot_xdot5,ushoot_xdot6,34,"Undershoot","velocity","X","[m/s]");
%step_response_compare(ushoot_ydot1,ushoot_ydot2,ushoot_ydot3,ushoot_ydot4,ushoot_ydot5,ushoot_ydot6,35,"Undershoot","velocity","Y","[m/s]");
%step_response_compare(ushoot_zdot1,ushoot_zdot2,ushoot_zdot3,ushoot_zdot4,ushoot_zdot5,ushoot_zdot6,36,"Undershoot","velocity","Z","[m/s]");

%% Visulization of Hill frame data for each method
%% Fixed Gain
%position_visualization_hill(th1,x1,y1,z1,x_dot1,y_dot1,z_dot1);
%% Dynamic Gain scheduling
%position_visualization_hill(th2,x2,y2,z2,x_dot2,y_dot2,z_dot2);
%% PSO
%position_visualization_hill(th3,x3,y3,z3,x_dot3,y_dot3,z_dot3);
%% ALO
%position_visualization_hill(th4,x4,y4,z4,x_dot4,y_dot4,z_dot4);
%% GWO
%position_visualization_hill(th5,x5,y5,z5,x_dot5,y_dot5,z_dot5);
%% WOA
%position_visualization_hill(th6,x6,y6,z6,x_dot6,y_dot6,z_dot6);
%
%% Visulization of ICRF frame data for each method
%% Fixed Gain
%position_visualization_icrf(ti1,x_c1,x_d1,y_c1,y_d1,z_c1,z_d1,xdot_c1,xdot_d1,ydot_c1,ydot_d1,zdot_c1,zdot_d1);
%% Dynamic Gain scheduling
%position_visualization_icrf(ti2,x_c2,x_d2,y_c2,y_d2,z_c2,z_d2,xdot_c2,xdot_d2,ydot_c2,ydot_d2,zdot_c2,zdot_d2);
%% PSO
%position_visualization_icrf(ti3,x_c3,x_d3,y_c3,y_d3,z_c3,z_d3,xdot_c3,xdot_d3,ydot_c3,ydot_d3,zdot_c3,zdot_d3);
%% ALO
%position_visualization_icrf(ti4,x_c4,x_d4,y_c4,y_d4,z_c4,z_d4,xdot_c4,xdot_d4,ydot_c4,ydot_d4,zdot_c4,zdot_d4);
%% GWO
%position_visualization_icrf(ti5,x_c5,x_d5,y_c5,y_d5,z_c5,z_d5,xdot_c5,xdot_d5,ydot_c5,ydot_d5,zdot_c5,zdot_d5);
%% WOA
%position_visualization_icrf(ti6,x_c6,x_d6,y_c6,y_d6,z_c6,z_d6,xdot_c6,xdot_d6,ydot_c6,ydot_d6,zdot_c6,zdot_d6);
    

%%%% Compare response for all PID tuning methods
%%position_visualization_comp_hill(t500,t20,x1,x2,x3,x4,x5,x6,1,"Position","X","[m]");
%%position_visualization_comp_hill(t500,t20,y1,y2,y3,y4,y5,y6,3,"Position","Y","[m]");
%%position_visualization_comp_hill(t500,t20,z1,z2,z3,z4,z5,z6,5,"Position","Z","[m]");
%%position_visualization_comp_hill(t500,t20,x_dot1,x_dot2,x_dot3,x_dot4,x_dot5,...
%%    x_dot6,7,"Velocity","X","[m/s]");
%%position_visualization_comp_hill(t500,t20,y_dot1,y_dot2,y_dot3,y_dot4,y_dot5,...
%%    y_dot6,9,"Velocity","Y","[m/s]");
%%position_visualization_comp_hill(t500,t20,z_dot1,z_dot2,z_dot3,z_dot4,z_dot5,...
%%    z_dot6,11,"Velocity","Z","[m/s]");

%% 2) Batch simulate and save
%numel(modelList)

%function [filename1,filename2,filename3] = run_scenario(mdl,sim_time,trim)
    
    filename1 = [mdl '_stepdata.mat'];
    filename2 = [mdl '_hilldata.mat'];
    filename3 = [mdl '_icrfdata.mat'];
    %% Statistical Data collection
    Num = 100;
    rng(1,"twister");
    sma = 6878140 + (200).*rand(Num,1);              %semim-major axis in metres
    ecc = 0;                                         % eccentricity
    incl = 97.4065;                                  % inclination in degree
    RAAN = 0.0000 + (0.0006).*rand(Num,1);           % ascending node in degree
    AP   = 0.0000 + (0.0001).*rand(Num,1);           % argument of periapsis in degree
    TA   = 0.0000 + (0.0008358) .*rand(Num,1);       % true anomaly in degrees        
    

    for n = 1:Num
        a  = sma(n);        %semim-major axis
        e =  ecc;           % eccentricity
        inc =  incl;        % inclination
        Omega = RAAN(n);    % ascending node
        omega = AP(n);      % argument of periapsis
        f = TA(n);          % true anomaly
    
        % Open simulation model
        init_model = 'initial_position.slx';
        open_system(init_model);
        out = sim(init_model);
        simout_Data_hill_init = out.hill_initial.Data; % Extract initial values
        simout_Data_icrf_init = out.icrf_initial.Data; % Extract initial values
    
        % Extract X, Y, Z values
        hill_pos_x = simout_Data_hill_init(:, 1);
        hill_vel_x = simout_Data_hill_init(:, 4);
    
        hill_pos_y = simout_Data_hill_init(:, 2);
        hill_vel_y = simout_Data_hill_init(:, 5);
    
        hill_pos_z = simout_Data_hill_init(:, 3);
        hill_vel_z = simout_Data_hill_init(:, 6);
    
    
        icrf_pos_x = simout_Data_icrf_init(:, 1);
        icrf_vel_x = simout_Data_icrf_init(:, 4);
    
        icrf_pos_y = simout_Data_icrf_init(:, 2);
        icrf_vel_y = simout_Data_icrf_init(:, 5);
    
        icrf_pos_z = simout_Data_icrf_init(:, 3);
        icrf_vel_z = simout_Data_icrf_init(:, 6);
       
        % Initial values in hill frame for state space model in Outer Controller
        OC_x_init = [hill_pos_x(1);hill_vel_x(1)];
        OC_y_init = [hill_pos_y(2);hill_vel_y(2)];
        OC_z_init = [hill_pos_z(3);hill_vel_z(3)];
    
        % Initial values in ICRF frame for state space model in Inner Controller
        IC_x_init = [icrf_pos_x(1);icrf_vel_x(1)];
        IC_y_init = [icrf_pos_y(2);icrf_vel_y(2)];
        IC_z_init = [icrf_pos_z(3);icrf_vel_z(3)];
    
        % Open simulation model
        run_model = mdl;
        open_system(run_model);
        % Set simulation time
        set_param(run_model, 'StopTime', num2str(sim_time));    
        % Simulation
        tic;
        out = sim(run_model);
        elapsedTime = toc;
    
        disp('simulation complete ');     
        fprintf('Simulation of %s took %.2f seconds.\n', run_model, elapsedTime);
    
        % Load Simulink output data
        controller_output = out.controller_out.Data; % Extract simulation output
        
        % Extract X, Y, Z values
        t = out.controller_out.Time;
        
        x(:,n) = controller_output(:, 1);
        y(:,n) = controller_output(:, 2);
        z(:,n) = controller_output(:, 3);
        x_dot(:,n) = controller_output(:, 4);
        y_dot(:,n) = controller_output(:, 5);
        z_dot(:,n) = controller_output(:, 6);

        % Save Step Response
        stepResults = stepinfo(x(:,n),t);
        settling_time_x(n) = stepResults.SettlingTime;
        overshoot_x(n) = stepResults.Overshoot;
        undershoot_x(n) = stepResults.Undershoot;
        rise_time_x(n) =stepResults.RiseTime;

        stepResults = stepinfo(y(:,n),t);
        settling_time_y(n) = stepResults.SettlingTime;
        overshoot_y(n) = stepResults.Overshoot;
        undershoot_y(n) = stepResults.Undershoot;
        rise_time_y(n) =stepResults.RiseTime;

        stepResults = stepinfo(z(:,n),t);
        settling_time_z(n) = stepResults.SettlingTime;
        overshoot_z(n) = stepResults.Overshoot;
        undershoot_z(n) = stepResults.Undershoot;
        rise_time_z(n) =stepResults.RiseTime;

        stepResults = stepinfo(x_dot(:,n),t);
        settling_time_x_dot(n) = stepResults.SettlingTime;
        overshoot_x_dot(n) = stepResults.Overshoot;
        undershoot_x_dot(n) = stepResults.Undershoot;
        rise_time_x_dot(n) =stepResults.RiseTime;

        stepResults = stepinfo(y_dot(:,n),t);
        settling_time_y_dot(n) = stepResults.SettlingTime;
        overshoot_y_dot(n) = stepResults.Overshoot;
        undershoot_y_dot(n) = stepResults.Undershoot;
        rise_time_y_dot(n) =stepResults.RiseTime;

        stepResults = stepinfo(z_dot(:,n),t);
        settling_time_z_dot(n) = stepResults.SettlingTime;
        overshoot_z_dot(n) = stepResults.Overshoot;
        undershoot_z_dot(n) = stepResults.Undershoot;
        rise_time_z_dot(n) =stepResults.RiseTime;
        
        spacecraft_output = out.spacecraft_out.Data; % Extract simulation output
        
        % Extract X, Y, Z values
        t1 = out.spacecraft_out.Time;
        x_c(:,n) = spacecraft_output(:, 1);
        x_d(:,n) = spacecraft_output(:, 2);
        y_c(:,n) = spacecraft_output(:, 3);
        y_d(:,n) = spacecraft_output(:, 4);
        z_c(:,n) = spacecraft_output(:, 5);
        z_d(:,n) = spacecraft_output(:, 6);
    
        xdot_c(:,n) = spacecraft_output(:, 7);
        xdot_d(:,n) = spacecraft_output(:, 8);
        ydot_c(:,n) = spacecraft_output(:, 9);
        ydot_d(:,n) = spacecraft_output(:, 10);
        zdot_c(:,n) = spacecraft_output(:, 11);
        zdot_d(:,n) = spacecraft_output(:, 12);
        
        disp('loop complete ')
        close_system(run_model,0);
        close_system(init_model,0);
    end
    
    idx = t<=trim;
    time1 = t(idx);
    time = repmat(time1, 1, size(x,2));
    x = x(idx,:);
    y = y(idx,:);
    z = z(idx,:);
    x_dot = x_dot(idx,:);
    y_dot= y_dot(idx,:);
    z_dot= z_dot(idx,:);
    

    %%save(filename,"time","x","y","z","x_dot","y_dot","z_dot");
    
    save(filename1, 'time', 'settling_time_x', 'settling_time_y','settling_time_z',...
        'settling_time_x_dot','settling_time_y_dot','settling_time_z_dot',...
        'rise_time_x','rise_time_y','rise_time_z','rise_time_x_dot',...
        'rise_time_y_dot','rise_time_z_dot','overshoot_x','overshoot_y',...
        'overshoot_z','overshoot_x_dot','overshoot_y_dot',...
        'overshoot_z_dot','undershoot_x','undershoot_y','undershoot_z',...
        'undershoot_x_dot','undershoot_y_dot','undershoot_z_dot');

    save(filename2,"time","x","y","z","x_dot","y_dot","z_dot");
    save(filename3,"t1","x_c","x_d","y_c","y_d","z_c","z_d","xdot_c","xdot_d","ydot_c","ydot_d","zdot_c","zdot_d");           
    
    
    

%end
