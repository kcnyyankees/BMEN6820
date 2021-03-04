%% Reproductive Rate
%{
Calculate daily reproduction ratio as a function of 
- ct: contact rate
- dt: diagnosis rate
and other parameters of Covid model.
%}
function rt = ReproductionRatio(ct, dt, params)
beta = params(1).beta;
e = params(1).e;
q = params(1).q;
theta = params(1).theta;
alpha = params(1).alpha;
gammaI = params(1).gammaI;
gammaA = params(1).gammaA;
S0 = params(1).S0;

rt = beta*e*ct*(1-q)./(dt+alpha+gammaI) + beta*ct*theta*(1-e)*(1-q)/gammaA;
rt = rt * S0;
end