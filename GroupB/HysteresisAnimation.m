%% Animation showing hysteresis effect 

% Two graphs are displayed:
% - isocline 
% - 1/beta

% A point moves on each of the graphs to demonstrate the hysteresis cycle

% First we simulate with cycling beta
alpha = 0.12;
tend = 2e4;
N0 = 1.5;

% Beta is calculated in the model function...
[t,N]=ode45('Spruce_Budworm_ODE_modBeta',[0 tend],N0,[],alpha);

% And must be recalculated outside of it as well (for drawing graphs)
f = 0.001;
beta = 2*(cos(t*f)+1.5);

% Get the predation curve
N1=linspace(0,2./alpha,200);  %for dN1/dt =0
y2=(N1./(1+N1.^2));            %Predation

% Drawing loop
figure;

% Index into time and beta arrays
i = 1;

% Infinite loop! User must press Control-C at the prompt 
% to terminate animation
while 1
    y1=(1./beta(i))*(1-alpha.*N1);    %'Growth'
    
    % Clear axes
    axsIso = subplot(2,1,1);
    cla(axsIso);
    hold on;
    
    % Draw predation and growth curves
    plot(N1,y1,'DisplayName','growth');
    plot(N1,y2,'DisplayName','predation');
    
    % Draw marker on isocline graph
    gMark = 1/beta(i)*(1-alpha*N(i));
    pMark = N(i)/(1+N(i)^2);
    aMark = (gMark+pMark)/2;
    
    scatter(N(i), aMark, 100, 'DisplayName', 'Population Marker');
    
    % Format the graphs
    axis([0 10 0 1]);
    legend()
    xlabel('Population N')
    ylabel('Rate')
    
    % Draw hysteresis curve
    axsHyst = subplot(2,1,2);
    cla(axsHyst);
    hold on;
    
    scatter(1./beta(1:i), N(1:i), '.');
    scatter(1/beta(i), N(i), 100, 'o');
    
    % Format the graphs
    axis([0.2 1 0 8]);
    xlabel('1/\beta')
    ylabel('Population N')
    
    % Next point
    i = i+100;
    pause(0.2);
    
    % Loop on the second cycle
    if t(i) >= 2000*2*pi
       idxs = find(t > 1000*2*pi);
       i = idxs(1);
    end
end
