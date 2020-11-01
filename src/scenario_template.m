%{
# Thermal load scenario set up helper function.

OUTPUT:

This function returns a structure with 
 
* internal dissipation of each node
* solar irradiation on each node
* albedo irradiation on each node
* planetary IR irradiation on each node

All units are SI units.

This function can be used as a template when creating new thermal load scenarios.
Each scenario function has an associated model function.
Since thethermal load scenario structure is just that (a structure), it can
be created by other means than with this scenario function.

Mario Merino <mario.merino@uc3m.es>, 2020
%}
function scenario = thermal_scenario

%% Scenario name, description, date
scenario.info.name = 'Template'; % name
scenario.info.date = '20200415'; % date
scenario.info.description = 'Just a template scenario file. Copy and modify this file'; % description

%% Internal dissipation
scenario.Qi = ... % Power dissipated in each node [W]
[
    0
    10
    0
];

%% Solar irradiation
scenario.Qsun = ... % Solar irradiation (solar irradiance * exposed area) [W]
1366* ...
[
    0.5
    0
    0
];

%% Albedo irradiation
scenario.Qalbedo = ... % Solar albedo irradiation (solar albedo irradiance * exposed area) [W]
0.3*1366*0.1* ...
[
    0.25
    0
    0.25
];

%% planetary IR irradiation
scenario.Qplanetary = ... % Planetary irradiation (planetary IR irradiance * exposed area) [W]
237*(6371/8000)^2* ...
[
    0.25
    0
    0.25
];