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
f = 10*0.001;
beta = 2*(cos(t*f)+1.5);

% Get the predation curve
N1=linspace(0,2./alpha,200);  %for dN1/dt =0
y2=(N1./(1+N1.^2));            %Predation

% Drawing loop
fig = figure;
btnPanel = uipanel('Parent', fig, 'Units', 'normal', 'Position', [0 5/6 1 1/6]);
pltPanel = uipanel('Parent', fig, 'Units', 'normal', 'Position', [0 0 1 5/6]);
isoAxes = axes('Parent', pltPanel, 'Units', 'normal', 'Position', [1/10 3/5 4/5 7/20]);
hysAxes = axes('Parent', pltPanel, 'Units', 'normal', 'Position', [1/10 1/10 4/5 7/20]);
stopBtn = uicontrol('Parent', btnPanel, 'Style', 'togglebutton',...
    'String', 'Stop Animation', 'Value', 0, 'Position', [20 20 100 30]); 

% Format the graphs
axis(isoAxes, [0 10 0 1]);
legend(isoAxes)
xlabel(isoAxes, 'Population N')
ylabel(isoAxes, 'Rate')

axis(hysAxes, [0.2 1 0 8]);
xlabel(hysAxes, '1/\beta')
ylabel(hysAxes, 'Population N')

% Index into time and beta arrays
i = 1;

while 1
    while ~get(stopBtn, 'Value')
        y1=(1./beta(i))*(1-alpha.*N1);    %'Growth'

        % Clear axes
        cla(isoAxes);
        hold(isoAxes, 'on');

        % Draw predation and growth curves
        plot(isoAxes, N1,y1,'DisplayName','growth');
        plot(isoAxes, N1,y2,'DisplayName','predation');

        % Draw marker on isocline graph=
        gMark = 1/beta(i)*(1-alpha*N(i));
        pMark = N(i)/(1+N(i)^2);
        aMark = (gMark+pMark)/2;

        scatter(isoAxes, N(i), aMark, 100, 'DisplayName', 'Population Marker');

        % Draw hysteresis curve
        cla(hysAxes);
        hold(hysAxes, 'on');

        plot(hysAxes, 1./beta(1:i), N(1:i));
        scatter(hysAxes, 1/beta(i), N(i), 100, 'o');

        % Next point
        i = i+5;
        pause(0.1);

        % Loop on the second cycle
        if t(i) >= 2000*2*pi
           idxs = find(t > 1000*2*pi);
           i = idxs(1);
        end
    end
    set(stopBtn, 'String', 'Resume Animation');
    % Poll on starting animation again
    while get(stopBtn, 'Value')
        pause(0.1);
    end
    set(stopBtn, 'String', 'Stop Animation');
end
