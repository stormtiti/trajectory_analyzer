% function createTrajectories( x, ...
%                              y, ...
%                              theta, ...
%                              vx, ...
%                              vy, ...
%                              vtheta, ...
%                              acc_x, ...
%                              acc_y, ...
%                              acc_theta, ...
%                              sim_time, ...
%                              sim_granularity, ...
%                              vx_samp, ...
%                              vy_samp, ...
%                              min_vel_theta, ...
%                              max_vel_theta, ...
%                              vtheta_samples)
% param x the position of the robot
% param y the position of  the robot
% param theta the orientation of the robot
% param vx the x velocity of the robot
% param vy the y velocity of the robot
% param vtheta the theta velocity of the robot
% param acc_x the x acceleration limit of the robot
% param acc_y the y acceleration limit of the robot
% param acc_theta the theta acceleration limit of robot
% param sim_time the number of seconds each trajectory is rolled-out
% param sim_granularity the distance between simulation points
% param vx_samp the x velocity used to seed the trajectory
% param vy_samp the y velocity used to seed the trajectory
% param sampling min_vel_theta the min theta velocity 
% param sampling max_vel_theta the max theta velocity
% param the number of sample between min_vel_theta and max_vel_theta


robot_x = 0.0;         % param x the position of the robot
robot_y = 0.7;         % param y the position of  the robot
robot_theta = -0.1;     % param theta the orientation of the robot

robot_vel_x = 0.4;     % param vx the x velocity of the robot
robot_vel_y = 0.0;     % param vy the y velocity of the robot
robot_vel_theta = 0.4; % param vtheta the theta velocity of the robot

acc_x = 0.5;           % param acc_x the x acceleration limit of the robot
acc_y = 0.0;           % param acc_y the y acceleration limit of the robot
acc_theta = 1.2;       % param acc_theta the theta acceleration limit of robot

sim_time = 3.6;        % param sim_time the number of seconds each trajectory is rolled-out
sim_granularity = 0.4; % param sim_granularity the distance between simulation points

vx_samp = 0.4;         % param vx_samp the x velocity used to seed the trajectory
vy_samp = 0.0;         % param vy_samp the y velocity used to seed the trajectory

min_vel_theta = -0.6;  % param sampling min_vel_theta the min theta velocity 
max_vel_theta = 0.6;   % param sampling max_vel_theta the max theta velocity
vtheta_samples = 30;   % param the number of sample between min_vel_theta and max_vel_theta
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

line_x = -3.0:0.1:3.0;         % x axis discretization
line_size = size(line_x);   
line_size = line_size(2);
line_y = ones(1, line_size) .* 1.0;  % y axis discretization
line = [line_x',line_y'];
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% call createTrajectories function
createTrajectories( robot_x, robot_y, robot_theta, ...                   % x ,y, theta
                    robot_vel_x, robot_vel_y, robot_vel_theta, ...       % vx, vy, vtheta
                    acc_x, acc_y, acc_theta, ...                         % acc_x, acc_y, acc_theta
                    sim_time, sim_granularity, ...                       % sim_time, sim_granularity
                    vx_samp, vy_samp, ...                                % vx_samp, vy_samp
                    min_vel_theta, max_vel_theta, vtheta_samples, ...    % min_vel_theta, max_vel_theta, vtheta_samples
                    line);
                
