%% Contact Rate
%{
Calculate daily contact rate as a function of a few
Covid model parameters.
%}
function ct = ContactRate(t, params)
c0 = params(1).c0;
cb = params(1).cb;
r1 = params(1).r1;

ct = (c0-cb)*exp(-r1*t)+cb;
end