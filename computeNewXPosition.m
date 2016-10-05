% brief compute x position based on velocity
% param xi the current x position
% param vx the current x velocity
% param vy the current y velocity
% param theta the current orientation
% param dt the time step to take
% return x return the new x position
function x = computeNewXPosition( xi, vx, vy, theta, dt )
  format long;
  x = xi + ( vx * cos ( theta ) + vy * cos ( pi/2 + theta ) ) * dt;
end