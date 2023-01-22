function events = poisson_pr_time_unit(n_events)
    time_between = exprnd(1/5,[1,n_events]); %time between events occured follow exponential distribution
    event_time = zeros(1,length(time_between)) %what time each event occured in time units
    for i=1:length(time_between)
        event_time(i) = sum(time_between(1:i)) 
    end

    time_unit=1; %time unit is 1 second
    events=[]; %initializing events (how many events happened in each time unit)
    events_occ = 0; %events occured
    for i=1:length(event_time)
        if event_time(i) <= time_unit
            events_occ = events_occ + 1; 
        else
            events = [events events_occ];
            time_unit = time_unit + 1;
            events_occ = 1;
        end
    end
end
