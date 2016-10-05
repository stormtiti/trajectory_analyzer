% generate trajectory array
% param x the position of the robot
% param y the position of  the robot
% param theta the orientation of the robot
% param vx the x velocity of the robot
% param vy the y velocity of the robot
% param vtheta the theta velocity of the robot
% param vx_samp the x velocity used to seed the trajectory
% param vy_samp the y velocity used to seed the trajectory
% param vtheta_samp the theta velocity used to seed the trajectory
% param acc_x the x acceleration limit of the robot
% param acc_y the y acceleration limit of the robot
% param acc_theta the theta acceleration limit of robot
% param sim_time the number of seconds each trajectory is rolled-out
% param sim_granularity the distance between simulation points
% return trajectory array
function [ trajectory ] = generateTrajectories( x, ...
                                                y, ...
                                                theta, ...
                                                vx, ...
                                                vy, ...
                                                vtheta, ...
                                                vx_samp, ...
                                                vy_samp, ...
                                                vtheta_samp, ...
                                                acc_x, ...
                                                acc_y, ...
                                                acc_theta, ...
                                                sim_time, ...
                                                sim_granularity)
    format long;
    x_i = x;
    y_i = y;
    theta_i = theta;
    
    vx_i = vx;
    vy_i = vy;
    vtheta_i = vtheta;
    
    num_steps = sim_time / sim_granularity + 0.5;

    if ( num_steps == 0 )
        num_steps = 1;
    end
    
    dt = sim_time / num_steps;
    % convert to integer
    num_steps = int16 (num_steps);
    % fprintf ( 'num_steps = %d.\n', num_steps );
    % fprintf ( 'dt = %f.\n', dt );
    
    % initial trajectory array size
    trajectory = zeros(1,3);

    %fprintf("The num_steps is %8.2f\n", num_steps);
    
    % loop for generate trajectory point
    for i = 1:num_steps
        trajectory(i,:) = [x_i, y_i, theta_i];

        vx_i = computeNewVelocity( vx_samp, vx_i, acc_x, dt );
        vy_i = computeNewVelocity( vy_samp, vy_i, acc_y, dt );
        vtheta_i = computeNewVelocity( vtheta_samp, vtheta_i, acc_theta, dt );
        
        x_i = computeNewXPosition( x_i, vx_i, vy_i, theta_i, dt );
        y_i = computeNewYPosition( y_i, vx_i, vy_i, theta_i, dt );
        theta_i = computeNewThetaPosition( theta_i, vtheta_i, dt ); 

    end
end

