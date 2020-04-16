%{
Unit tests for the function/class/package referenced by the name of this
file.

NOTES:
* The function/class/package to be tested must be in the Matlab path. 
* You can run the tests by running 'runtests' on this test file directory.  

Mario Merino <mario.merino@uc3m.es>, 2020
%}
function tests = test_thermal
    tests = functiontests(localfunctions);     
end

%----------------------------------------------------------------------
%----------------------------------------------------------------------
%----------------------------------------------------------------------
 
function test_sphere(testcase)  
    % A very simple test case: an isothermal sphere under the Sun with
    % alpha = 1 and epsilon = 0.5. Checks if Temperature goes to the
    % expected stationary value
    
    model = test_sphere.model1;
    scenario = test_sphere.scenario1;
    
    [~,T] = thermal.integrator(model,scenario,[0,10000]);
    
    sigma = 5.67e-8; % Stefan-Boltzmann constant [W/(m^2*K^4)]
    reference_solution = (1366/4/sigma * model.radiation.Asun/model.radiation.Espace)^(1/4);
    
    assertEqual(testcase,T(end),reference_solution,'AbsTol',1e-4);
end
 
% More tests can be added by copying the function above and modifying it