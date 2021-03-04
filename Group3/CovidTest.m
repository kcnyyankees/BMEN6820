%% Covid model test

t = linspace(0,25,100);

params = struct([]);

% Contact rate
params(1).c0 = 14.781;
params(1).cb = 2.9253;
params(1).r1 = 1.3768;

% Diagnosis rate
params(1).deltaI0 = 0.13266;
params(1).deltaIF = 1/0.3654;
params(1).r2 = 0.3283;

% Reproduction ratio
params(1).beta = 2.1011e-8;
params(1).e = 0.86834;
params(1).q = 1.2858e-5;
params(1).theta = 1.6003;
params(1).alpha = 1.7826e-5;
params(1).gammaI = 0.33029;
params(1).gammaA = 0.13978;

% Full model
params(1).lambda = 1/14;
params(1).sigma = 1/7;
params(1).deltaQ = 0.1259;
params(1).gammaH = 0.11624;

% Initial Conditions
params(1).S0 = 11081000;
E0 = 600;
I0 = 410;
A0 = 30;
Sq0 = 739;
Eq0 = 20;
H0 = 41;
R0 = 2; 

tend = 100;
N0 = [params(1).S0, E0, I0, A0, Sq0, Eq0, H0, R0];

[t,N] = ode45(@CovidModel, [0, tend], N0, [], params);