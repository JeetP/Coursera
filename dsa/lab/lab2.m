c;clear all;close all;
Init_Plotting_Style
load data;
dev_time = TIME - TIME(1);
dev_step = SETPT - SETPT(1);
dev_dist = DIST - DIST(1);

kp;taup;kd,taud;

A = [-1/taup 0;0 -1/taud];
B = [kp/taup 0;0 kd/taud];
C = [1 1];
Kc, Taui;

nt = length(time);
Xt = zeros(2,nt);
zt = zeros(1,nt);
y_hat = zeros(1,nt);
u_hat = zeros(1,nt);
error  = zeros(1,nt);
for k = 1:nt-1
	    yhat(k) =  Cmat*xt(:,k);
	        error = dev_step(k) - yhat(k);
		    u_hat = Kc*error(k)*kc/Ti*zt(k);
		        hk = dev(k+1) -dev(k);
			    vk = [ut_hat(k) dev_dist(k)]';
			        Xt(:,k+1) = (eye(2) + hk*A_mat)*Xt(:,k)+hk*B_mat*Vk;
				    zt(k+1) = zt(k) + hk*error(k);
				        end

					    yt_hat = C*mat*Xt(:,nt);
					        error(nt) = dev_steppt(nt) - yt_hat(nt);
						    ut_hat(nt) = kc*error(nt)+kc/Ti*zt(nt);

						        YTHAT=yt_hat+SETPT(1)
							    



