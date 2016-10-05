% brief compute y position based on velocity
% param yi the current y position
% param vx the current x velocity
% param vy the current y velocity
% param theta the current orientation
% param dt the time step to take
% return y return the new y position
function y = computeNewYPosition( yi, vx, vy, theta, dt )
  format long;
  y = yi + ( vx * sin (theta) + vy * sin ( pi/2 + theta ) ) * dt;
end
