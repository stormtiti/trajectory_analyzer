% brief compute orientation based on velocity
% param thetai the current orientation
% param vth the current theta velocity
% param dt the time step to take
% return theta return the new orientation
function theta = computeNewThetaPosition( thetai, vth, dt )
  format long;
  theta = thetai + vth * dt;
end
