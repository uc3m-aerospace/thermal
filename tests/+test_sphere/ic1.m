%{
# Initial conditions helper function

OUTPUT:

This function returns a vector with the initial temperature of each node

All units are SI units.

This function can be used as a template when creating new initial conditions.
Since the initial temperature vector is just that (a vector), it can
be created by other means than with this ic function.

Mario Merino <mario.merino@uc3m.es>, 2020
%}
function ic = ic1
    
    %% Initial condition
    ic = ... % Initial condition for the temperature of each node [K]
    [
        300 
    ];
