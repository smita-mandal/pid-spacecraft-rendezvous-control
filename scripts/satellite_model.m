clear

%% This file loads the initial configuration for the rendezvous mission
%% based on the satellite models selected

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
Ax = [0,1;(3*(omega_T^2)),0]
Bx = [0;1/m0]
Cx = eye(2)
Dx = 0;

% Controller gains
Ki_x= 1;
Kp_x =1;
Kd_x =20;


% Reachability/Controllability m0atrix
Wx = ctrb(Ax, Bx)
det(Wx)

%% systen model for Y axis
Ay = [0,1;0,0]
By = [0;1/m0]
Cy = eye(2)
Dy = 0;

% Controller Gains
Ki_y= 0.5;
Kp_y =1;
Kd_y =20;

% Reachability/Controllability matrix
Wy = ctrb(Ay, By)
det(Wy)

%% systen model for Z axis
Az = [0,1;(-(omega_T^2)),0]
Bz = [0;1/m0]
Cz = eye(2)
Dz = 0;

% Controller Gains
Ki_z= 0.05;
Kp_z =0.5;
Kd_z =20;

% Reachability/Controllability matrix
Wz = ctrb(Az, Bz)
det(Wz)

%%#######################################################################
%%#####################################################################
%% Inner Loop Controller

% System Model for x-axis
Ax_i = [0,1;0,0]
Bx_i = [0;1/m0]
Cx_i = eye(2)
Dx_i = [0;0];

% Controller gains
Ki_x_i= 1;
Kp_x_i= 1;
Kd_x_i=10;


% Reachability/Controllability matrix
Wx_i = ctrb(Ax_i, Bx_i)
det(Wx_i)

% systen model for Y axis
Ay_i = [0,1;0,0]
By_i = [0;1/m0]
Cy_i = eye(2)
Dy_i = [0;0];

% Controller Gains
Ki_y_i= 1;
Kp_y_i =1;
Kd_y_i =10;

% Reachability/Controllability matrix
Wy_i = ctrb(Ay_i, By_i)
det(Wy_i)

% systen model for Z axis
Az_i = [0,1;0,0]
Bz_i = [0;1/m0]
Cz_i = eye(2)
Dz_i = [0;0];

% Controller Gains
Ki_z_i= 1;
Kp_z_i =1;
Kd_z_i =10;

% Reachability/Controllability matrix
Wz_i = ctrb(Az_i, Bz_i)
det(Wz_i)




%%#########################################################################
%%############################ Future Development Code ####################
%%#########################################################################
%%% Mission Set up
%epochYear = 2000;
%epochMonth = 1;
%epochDay = 1;
%epochHour = 12;
%epochMinute = 0;
%epochSecond = 0;
%epoch = datetime(epochYear,epochMonth,epochDay, ...
%    epochHour,epochMinute,epochSecond);
%
%
%
%%% Open simulation model
%%model = 'SpaceRendezvousAndDocking.slx';
%%open_system(model);
%
%%% Visulization
%simOut = sim('new_final.slx')
%
%startTime = epoch;
%stopTime = startTime + days(1);
%sampleTime = seconds(stopTime - startTime)/35311;
%sc = satelliteScenario(startTime,stopTime,sampleTime);
%
%chaserPos = simOut.yout{1}.Values;
%chaserAtt = simOut.yout{3}.Values;
%targetPos = simOut.yout{5}.Values;
%targetAtt = simOut.yout{7}.Values;
%
%chaser = satellite(sc,chaserPos,Name='Chaser');
%pointAt(chaser,chaserAtt);
%chaserDockingPort = conicalSensor(chaser,MountingLocation=[0.5;0;0]);
%
%target = satellite(sc,targetPos,Name='Target');
%pointAt(target,targetAtt);
%targetDockingPort = conicalSensor(target,MountingLocation=[0.5;0;0]);
%
%v = satelliteScenarioViewer(sc,CameraReferenceFrame='Inertial');
%chaser.Visual3DModel = "SmallSat.glb";
%chaser.Visual3DModelScale = 0.8;
%target.Visual3DModel = "SmallSat.glb";
%target.Visual3DModelScale = 0.8;
%coordinateAxes([chaser target],Scale=2);
%hide(chaser.Orbit);
%hide(target.Orbit);
%
%play(sc);
%camtarget(v,chaser);
%
%
%