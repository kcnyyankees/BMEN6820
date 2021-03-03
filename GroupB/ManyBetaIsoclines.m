%% Part 2 iii

% Graph many isoclines to show why hysteresis occurs

beta = [5,4.5,4,3.5,3,2.5,2,1.5,1];

%Creates the growth and predation curves
N1=linspace(0,2./alpha,200);  %for dN1/dt =0
y2=(N1./(1+N1.^2));            %Predation

figure;
hold on;
plot(N1,y2,'DisplayName','predation');

for i=1:length(beta)
     y1=(1./beta(i))*(1-alpha.*N1);    %'Growth'

     plot(N1,y1,'DisplayName',sprintf('growth \\beta=%.1f', beta(i)));
end

axis([0 10 0 max([y1,y2])]);
legend()
xlabel('Population N')
ylabel('Rate')