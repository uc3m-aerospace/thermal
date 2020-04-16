%{
# Thermal integrator

This function integrates the thermal model equations and returns the
temperature of each node for each time step.

INPUTS:

* model: structure with the thermal mathematical model parameters
* scenario: structure with the thermal scenario parameters
* (other parameters): other parameters will be directly passed to the ode45
  integrator

OUTPUTS:

* t: vector with all the integration times
* T: matrix with all the node temperatures over time

All units are SI units.

Mario Merino <mario.merino@uc3m.es>, 2020
%}
function [t,T] = integrator(model,scenario,tspan,options)

% Prepare ode45 options, if none provided
if ~exist('options','var')
    options = odeset('AbsTol',1e-8,'RelTol',1e-8);
end

% Integration
[t,T] = ode45(@(t,T)thermal.dT_dt(t,T,model,scenario),tspan,scenario.ic,options);


