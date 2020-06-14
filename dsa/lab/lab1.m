
bal ttime ytk_1 delta  % Modification by Sachin Patwardhan
% Note: global statement need to be included in all filed that share the global variables                              
load IP2_Negative
Init_Plotting_Style
figure(1),plot(time,op,time,ip);
Ys = mean(op(1:50));
Us = ip(1);

%---------------------------------------%
%Aim is to make it at origin
utk = ip - ip(1);                  %Deviation Parameters
ytk = op - Ys;            
tk = time - time(1);
figure(2),plot(tk,ytk,tk,utk);

%---------------------------------------%

%Finding Initial Steady state Gain
Ysf = mean(op(end-50:end));
K_graph = (Ysf-Ys)/(ip(end)-ip(1))      %gain as ip(1) is 0 we can also replace ip(1) as 0
yc = 0.633*(Ysf - Ys);              % yc is y critical where it has reached 63% of steady state
if(Ysf>Ys)
	    n_c = find(ytk>yc,1);     %where it crosses yc
    else 
	        n_c = find(ytk<yc,1);
	end
	n_o = find(utk~=utk(1),1);
	tc = tk(n_c);                        %deviation output crosses yc
	t_o = tk(n_o);                       %time when step change was given
	%----------------------------------------%
	Tau_graph = tc-t_o
	ttime = tk(n_o:end)-tk(n_o);         %ttime is translated time
	ytk_1 =  ytk(n_o:end);
	delta =  ip(end) - ip(1);
	%--------------------------------------------------------%
	%%% Optimization code
	xopt = fminunc('obj_fn',[K_graph Tau_graph]);
	K_opt = xopt(1)
	Tau_opt = xopt(2)

	nd = length(ttime);
	yhat = zeros(nd,1);
	yhat_graph = zeros(nd,1);
	for k = 1:nd
		    yhat(k) = K_opt*delta*(1-exp(-1*(ttime(k)/(Tau_opt))));
		        
	    end

	    for k = 1:nd
		        yhat_graph(k) = K_graph*delta*(1-exp(-1*(ttime(k)/(Tau_graph))));
		end
		figure(3), plot(ttime,ytk_1+Ys,ttime,yhat+Ys,ttime,yhat_graph+Ys)
		title('Comparision of model step response IP2 Negative'),xlabel('Time (s)'),ylabel('Measured and Predicted Output')
		legend('Measured','Graphical Model','Optimal Model')
		timetp = ttime+tk(n_o);
		timetp2 = [tk(1:n_o-1);timetp];
		timetp3 = timetp2 + time(1);
		ytk_2 = [zeros(n_o-1,1);yhat];
		ytk_graph = [zeros(n_o-1,1);yhat_graph];
		ytk_3 = ytk_2 + Ys;
		ytk_graph = ytk_graph + Ys;
		figure(4), plot(time,op,timetp3,ytk_3,timetp3,ytk_graph);
		title('Comparision of model step response IP1 Positive'),xlabel('Time (s)'),ylabel('Temperature')
		legend('Measured','Graphical Model','Optimal Model')
		%-----------------------------------------------------------%    % modification by Sachin Patwardhanglobal ttime ytk_1 delta  % Modification by Sachin Patwardhan
		% Note: global statement need to be included in all filed that share the global variables                              
		load IP2_Negative
		Init_Plotting_Style
		figure(1),plot(time,op,time,ip);
		Ys = mean(op(1:50));
		Us = ip(1);

		%---------------------------------------%
		%Aim is to make it at origin
		utk = ip - ip(1);                  %Deviation Parameters
		ytk = op - Ys;            
		tk = time - time(1);
		figure(2),plot(tk,ytk,tk,utk);

		%---------------------------------------%

		%Finding Initial Steady state Gain
		Ysf = mean(op(end-50:end));
		K_graph = (Ysf-Ys)/(ip(end)-ip(1))      %gain as ip(1) is 0 we can also replace ip(1) as 0
		yc = 0.633*(Ysf - Ys);              % yc is y critical where it has reached 63% of steady state
		if(Ysf>Ys)
			    n_c = find(ytk>yc,1);     %where it crosses yc
		    else 
			        n_c = find(ytk<yc,1);
			end
			n_o = find(utk~=utk(1),1);
			tc = tk(n_c);                        %deviation output crosses yc
			t_o = tk(n_o);                       %time when step change was given
			%----------------------------------------%
			Tau_graph = tc-t_o
			ttime = tk(n_o:end)-tk(n_o);         %ttime is translated time
			ytk_1 =  ytk(n_o:end);
			delta =  ip(end) - ip(1);
			%--------------------------------------------------------%
			%%% Optimization code
			xopt = fminunc('obj_fn',[K_graph Tau_graph]);
			K_opt = xopt(1)
			Tau_opt = xopt(2)

			nd = length(ttime);
			yhat = zeros(nd,1);
			yhat_graph = zeros(nd,1);
			for k = 1:nd
				    yhat(k) = K_opt*delta*(1-exp(-1*(ttime(k)/(Tau_opt))));
				        
			    end

			    for k = 1:nd
				        yhat_graph(k) = K_graph*delta*(1-exp(-1*(ttime(k)/(Tau_graph))));
				end
				figure(3), plot(ttime,ytk_1+Ys,ttime,yhat+Ys,ttime,yhat_graph+Ys)
				title('Comparision of model step response IP2 Negative'),xlabel('Time (s)'),ylabel('Measured and Predicted Output')
				legend('Measured','Graphical Model','Optimal Model')
				timetp = ttime+tk(n_o);
				timetp2 = [tk(1:n_o-1);timetp];
				timetp3 = timetp2 + time(1);
				ytk_2 = [zeros(n_o-1,1);yhat];
				ytk_graph = [zeros(n_o-1,1);yhat_graph];
				ytk_3 = ytk_2 + Ys;
				ytk_graph = ytk_graph + Ys;
				figure(4), plot(time,op,timetp3,ytk_3,timetp3,ytk_graph);
				title('Comparision of model step response IP1 Positive'),xlabel('Time (s)'),ylabel('Temperature')
				legend('Measured','Graphical Model','Optimal Model')
				%-----------------------------------------------------------%    % modification by Sachin Patwardhan
