function [ time,temperature,t ] = cure( init,time_init,temp_lim,wait,tolerance,heating)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    options = odeset('RelTol',tolerance,'AbsTol',[tolerance]);
    span=[time_init time_init+60];

while(true)
    sol = ode45(@heat,span,init,options);
    time=linspace(span(1),span(2),span(2)/tolerance);
    temperature=deval(sol,time,1);
    if heating
        if find(temperature>=temp_lim);
            x=find(temperature>=temp_lim);
            t=time(x(1));
            [T,Y] = ode45(@heat,[time_init (time(x(1))+wait)],init,options);
            time=T;
            temperature=Y(:,1);
            break
        end
    else
        if find(temperature<=temp_lim);
            x=find(temperature<=temp_lim);
            t=time(x(1));
            [T,Y] = ode45(@heat,[time_init time(x(1))],init,options);
            time=T;
            temperature=Y(:,1);
            break
        end
    end
    span(2)=span(2)+60;
end


end

