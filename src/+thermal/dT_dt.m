%{
# Thermal model differential equations

This function returns dT/dt for each thermal node

INPUTS:
 
* T: vector with current temperature for each node
* model: structure with the thermal mathematical model parameters
* scenario: structure with the thermal scenario parameters

OUTPUTS:

* dT_dt: vector with the temperature derivatives for each node 

All units are SI units.

Mario Merino <mario.merino@uc3m.es>, 2020
%}
function dT_dt = dT_dt(~,T,model,scenario)

sigma = 5.67e-8; % Stefan-Boltzmann constant [W/(m^2*K^4)]

% Extenal and internal heat loads
Q =   model.radiation.Asun .*(scenario.Qsun + scenario.Qalbedo) ...
    + model.radiation.Espace.*scenario.Qplanetary ...
    + scenario.Qi;

% Conduction load to each node
C(model.nodes.n,1) = 0;
for i = 1:model.nodes.n
    for j = 1:model.nodes.n
        C(i) = C(i) - model.conduction.conductance(i,j) * (T(i) - T(j));
    end
end

% Radiation load to each node
R(model.nodes.n,1) = 0;
for i = 1:model.nodes.n
    for j = 1:model.nodes.n
        R(i) = R(i) - sigma * model.radiation.AF(i,j)*model.radiation.Eij(i,j) * (T(i)^4 - T(j)^4);
    end
end

% Radiation loss to free space
Rspace = -sigma*model.radiation.Espace.*model.radiation.AFspace.*T.^4;

% Temperature derivative for each node
dT_dt = (Q + C + R + Rspace) ./ model.nodes.capacity;
