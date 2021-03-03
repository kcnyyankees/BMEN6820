%% Part 2

alpha = 0.12;
tend = 2e4;
N0 = 1.5;
[t,N]=ode45('Spruce_Budworm_ODE_modBeta',[0 tend],N0,[],alpha);

f = 0.001;
beta = 2*(cos(t*f)+1.5);

% Count the number of cycles
% The number of cycles is actually the same as the number of periods
% of the cyclic beta
% This is actually just confirmation
nCycles = 0;
halfCycle = 0;

for i=1:length(beta)
    if ~halfCycle && beta(i) > 4.5
        nCycles = nCycles + 1;
        halfCycle = 1;
    elseif halfCycle && beta(i) < 1.5
        halfCycle = 0;
    end 
end

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

title(sprintf("%d Cycles", nCycles));

sgtitle({'Cyclic Beta'; ...
     ['Parameters: \alpha=', num2str(alpha), ' N(0)=', num2str(N0)]});


