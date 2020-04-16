%{
# Thermal scenario set up function.

OUTPUT:

This function returns a structure with 

* initial temperature of each node
* internal dissipation of each node
* solar irradiation on each node
* albedo irradiation on each node
* planetary IR irradiation on each node

All units are SI units.

This function can be used as a template when creating new scenarios.

Mario Merino <mario.merino@uc3m.es>, 2020
%}
function scenario = thermal_scenario

%% Scenario name, description, date
scenario.info.name = 'Template'; % name
scenario.info.date = '20200415'; % date
scenario.info.description = 'Just a template scenario file. Copy and modify this file'; % description

%% Nodes 
scenario.nodes.n = 3; % Number of nodes. Must be consistent with the following

%% Initial condition
scenario.ic = ... % Initial condition for the temperature of each node [K]
[
    300
    300
    300
];

%% Internal dissipation
scenario.Qi = ... % Power dissipated in each node [W]
[
    0
    10
    0
];

%% Solar irradiation
scenario.Qsun = ... % Solar irradiation [W]
1366* ...
[
    0.5
    0
    0
];

%% Albedo irradiation
scenario.Qalbedo = ... % Solar irradiation [W]
0.3*1366*0.1* ...
[
    0.25
    0
    0.25
];

%% planetary IR irradiation
scenario.Qplanetary = ... % Solar irradiation [W]
237*(6371/8000)^2* ...
[
    0.25
    0
    0.25
];