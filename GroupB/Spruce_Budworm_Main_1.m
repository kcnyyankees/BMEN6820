function Spruce_Budworm_Main_1(alpha,beta,N1_0,tend)

%calls  Spruce_Budworm_ODE(t,N,flag,alpha,beta)
%where 'flag' denotes the location where parameters are set
%INPUT parameters:
    %alpha is the predation term 
    %beta is the relative rate of predation to growth.
    %N1_0 is the initial budworm population
    %tend is the simulation duration
    %OUTPUT:
    %N is the population of spruce budworms
       
N0=N1_0;          %Specifies initial condition from input list

clf      %IMPORTANT - Clear existing Figure

%Creates the growth and predation curves
 N1=linspace(0,2./alpha,200);  %for dN1/dt =0
 y1=(1./beta)*(1-alpha.*N1);    %'Growth'
 y2=(N1./(1+N1.^2));            %Predation

%Simulates the differential equation
[t,N]=ode45('Spruce_Budworm_ODE',[0 tend],N0,[],alpha,beta);
 
% Creates Plots
subplot(2,1,1)
 plot(N1,y1,N1,y2);
 axis([0 max(N1) 0 max([y1,y2])]);
 xlabel('Population N')
 ylabel('Rate')
 legend('growth', 'predation')
 title({'Spruce Budworm Parameters';
      ['alpha=',num2str(alpha),', beta=',num2str(beta),...
      ', N(0)=',num2str(N0)]
      })

subplot(2,1,2)
 plot(t,N);
    xlabel('time')
    ylabel('Population N')
    axis([0 tend 0 1/alpha]);

end

