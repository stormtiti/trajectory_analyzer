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
function createTrajectories( x, ...
                             y, ...
                             theta, ...
                             vx, ...
                             vy, ...
                             vtheta, ...
                             acc_x, ...
                             acc_y, ...
                             acc_theta, ...
                             sim_time, ...
                             sim_granularity, ...
                             vx_samp, ...
                             vy_samp, ...
                             min_vel_theta, ...
                             max_vel_theta, ...
                             vtheta_samples, ...
                             line)
    
    format long;
    vtheta_samp = min_vel_theta;
    dvtheta = ( max_vel_theta - min_vel_theta ) / ( vtheta_samples - 1 );
        
    %foot_print_spec = [ -0.55 0.47
    %                    1.25 0.47
    %                    1.4 0.0
    %                    1.25, -0.47
    %                    -0.55, -0.47
    %                    -0.55 0.47 ];

    foot_print_spec = [ 0.18,0.2
                        0.23,0.15 
                        0.23,-0.15
                        0.18,-0.2
                        -0.18,-0.2
                        -0.23,-0.15
			-0.23,0.15
                        -0.18,0.2
                        0.18,0.2 ];


    foot_print(:,1) = x + (foot_print_spec(:,1)*cos(theta) - foot_print_spec(:,2)*sin(theta));
    foot_print(:,2) = y + (foot_print_spec(:,1)*sin(theta) + foot_print_spec(:,2)*cos(theta));

    figure;
    hold on; 
    plot(line(:,1), line(:,2), '.r');
    plot(foot_print(:,1), foot_print(:,2), '-g');


    %total_dist_all=zeros(vtheta_samples);

    max_total_dist=0.0;

    for i = 1:vtheta_samples
        traj = generateTrajectories( x, y, theta, vx, vy, vtheta, vx_samp, vy_samp, vtheta_samp, acc_x, acc_y, acc_theta, sim_time, sim_granularity);
        total_dist = computeTotalDistance( traj, line );
        
        if (max_total_dist<=total_dist)
            max_total_dist=total_dist;

	end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	total_dist_all(i)=total_dist;
        opt_vtheta_samp(i)=vtheta_samp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        hold on; 
	plot(traj(:,1), traj(:,2), '.b');

        if (max_total_dist<=total_dist)
            max_total_dist=total_dist;
            hold on; 
	    plot(traj(:,1), traj(:,2), '.r');
	end
        
        traj_end = size(traj);
        traj_end = traj_end(1);

        x_end = 2 * traj ( traj_end, 1 ) - traj ( traj_end - 1 , 1 );
        y_end = 2 * traj ( traj_end, 2 ) - traj ( traj_end - 1 , 2 ); 
        total_dist_str = [num2str(total_dist)];
        text(x_end, y_end, total_dist_str, 'FontSize',8, 'Color','b');

        set(gca,'XMinorTick','on','YMinorTick','on');
        axis equal;
        pause(0.01);
        vtheta_samp = vtheta_samp +  dvtheta;   
    end
    %hold on;
    fprintf('the total_dist_all are %6.4f\n',total_dist_all);
    %opt_total_dist=max(total_dist_all);
    %max_total_dist=max(total_dist_all);
    for i = 1:vtheta_samples
        if (total_dist_all(i)>=max_total_dist)

        hold on; 
	plot(opt_traj1(i) , opt_traj2(i) , '.r');
        fprintf('the i is %6.4f\n',i);
        end
    end

end
