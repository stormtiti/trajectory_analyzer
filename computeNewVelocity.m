% brief compute velocity based on acceleration
% param vg the desired velocity, what we're accelerating up to
% param vi the current velocity
% param a_max an acceleration limit
% param dt the time step to take
% return velocity return the new velocity
function velocity = computeNewVelocity( vg, vi, a_max, dt )
  format long;
  if (( vg - vi ) >= 0 ) 
      velocity = min ( vg , vi + a_max * dt );
  else
      velocity = max ( vg , vi - a_max * dt );
  end
end