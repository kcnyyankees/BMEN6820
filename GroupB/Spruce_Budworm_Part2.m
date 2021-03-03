%% Part 2

% Params
% In this part beta is a function of time, perhaps due to fluctuations 
% in the number of parameters

alpha = 0.12;
tend = 2e4;
N0 = 1.5;

% Beta is calculated in the model function...
[t,N]=ode45('Spruce_Budworm_ODE_modBeta',[0 tend],N0,[],alpha);

% And must be recalculated outside of it as well (for drawing graphs)
f = 0.001;
beta = 2*(cos(t*f)+1.5);

% Count the number of cycles
% The number of cycles is actually the same as the number of periods
% of the cyclic beta
% This is actually just confirmation
nCycles = 0;
halfCycle = 0;

for i=1:length(beta)
    if ~halfCycle && beta(i) < 1.5
        nCycles = nCycles + 1;
        halfCycle = 1;
    elseif halfCycle && beta(i) > 4.5
        halfCycle = 0;
    end 
end

% Plot the suggested figures
figure;
subplot(3,1,1);
plot(t, beta);
xlabel('time');
ylabel('\beta');

subplot(3,1,2);
plot(t, N);
xlabel('time');
ylabel('Population');

subplot(3,1,3);
plot(1./beta, N);
xlabel('1/\beta');
ylabel('Population');

% Confirm number of cycles
title(sprintf("%d Cycles", nCycles));

% Title of entire plot
sgtitle({'Cyclic Beta'; ...
     ['Parameters: \alpha=', num2str(alpha), ' N(0)=', num2str(N0)]});


