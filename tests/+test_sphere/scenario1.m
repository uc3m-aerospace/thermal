%{
# Thermal scenario set up function.

OUTPUT:

This function returns a structure with 

* internal dissipation of each node
* solar irradiation on each node
* albedo irradiation on each node
* planetary IR irradiation on each node

All units are SI units.

This function can be used as a template when creating new scenarios.

Mario Merino <mario.merino@uc3m.es>, 2020
%}
function scenario = scenario1

%% Scenario name, description, date
scenario.info.name = 'One node'; % name
scenario.info.date = '20200415'; % date
scenario.info.description = 'A dumb example with one node only'; % description

%% Internal dissipation
scenario.Qi = ... % Power dissipated in each node [W]
[
    0
];

%% Solar irradiation
scenario.Qsun = ... % Solar irradiation [W]
1366* ...
[
    pi 
];

%% Albedo irradiation
scenario.Qalbedo = ... % Solar irradiation [W]
0.3*1366*0.1* ...
[
    0
];

%% planetary IR irradiation
scenario.Qplanetary = ... % Solar irradiation [W]
237*(6371/8000)^2* ...
[
    0
];