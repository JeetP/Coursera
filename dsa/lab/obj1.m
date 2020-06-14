
function fofx = obj_fn(X)
global ttime ytk_1 delta
K = X(1);  tau = X(2);
nd = length(ttime);
yhat = zeros(nd,1);
error = zeros(nd,1);
fofx = 0;

for k=1:nd
	    yhat(k) = K * delta * (1-exp(-1*(ttime(k)/(tau))));
	        error(k) = ytk_1(k)- yhat(k);
		    fofx = fofx + error(k)^2;
	    end
	        
