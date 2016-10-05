function dist = computeTotalDistance( trajectory, line )
    
    format long;
    %init
    dist = 0.0;
    trajectory_size = size(trajectory);
    trajectory_size = trajectory_size(1);
    line_size = size(line);
    line_size = line_size(1);
    min_dist_calculate = 9999.9;
    
    for traj_index = 1:trajectory_size
        for line_index = 1:line_size
            dist_calculate = (trajectory(traj_index, 1) - line(line_index, 1))^2 + ...
                (trajectory(traj_index, 2) - line(line_index, 2))^2;
            
            if (dist_calculate <= min_dist_calculate)
                min_dist_calculate = dist_calculate;
            end
        end 
        dist = dist + min_dist_calculate;
        min_dist_calculate = 9999.9;
    end
    %fprintf('The distance dist is %6.4f\n',dist);
end

