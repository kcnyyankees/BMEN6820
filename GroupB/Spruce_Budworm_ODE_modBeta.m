function Np = Spruce_Budworm_ODE_modBeta(t,N,flag,alpha) 
	%Spruce_Budworm_ODE defines the ODEs for the Spruce_Budworm Oscillator
    %call using Spruce_Budworm_ODE(t,N,flag,alpha,beta), 
    %where 'flag' denotes the location where parameters are set
        %INPUT parameters:
        %t is  time
        %alpha is the predation term (alpha <1 indicates predation ...
        %      is less than carrying capacity
        %beta is the relative rate of predation to growth.
    %OUTPUT:
    %N is the population of spruce budworms
    %Np=zeros(size(N)
    f = 0.001;
    beta = 2*(cos(f*t)+1.5);
    Np=N*(1-alpha*N)-beta*(N*N)/(1+N*N);
end
