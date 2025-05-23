function [expinfo] = getMarkers(expinfo, isPractice)
% This is a function that specifies EEG Markers for the experiment and
% saves them into the expinfo object, so that Markers can be accessed
% during the Experiment without any further computational load.

%% Specify Block Markers for Experiment

    Marker.MatlabStart = 1;
    Marker.ExpEnd = 2;
    Marker.BreakStart = 3;
    Marker.BreakEnd = 4;
    Marker.BlockEnd = 59;

%% Specify Stimulus Markers within each trial
% Markers for different Screens

if expinfo.Block ==1
    Marker.Block = 101;
    Marker.Prac = 50;
    Marker.Exp = 51; 
    for i = 1:expinfo.maxsetsize
        Marker.MemSet(i) = 10+(i);
        Marker.Update(i) = 20+(i);
        Marker.ISI(i) = 30+(i);
        Marker.Cue(i) = 40+(i);
    end
elseif expinfo.Block ==2
    Marker.Block = 102;
    Marker.Prac = 52;
    Marker.Exp = 53; 
    for i = 1:expinfo.maxsetsize
        Marker.MemSet(i) = 110+(i);
        Marker.Update(i) = 120+(i);
        Marker.ISI(i) = 130+(i);
        Marker.Cue(i) = 140+(i);
    end
elseif expinfo.Block ==3
    Marker.Block = 103;
    Marker.Prac = 54;
    Marker.Exp = 55; 
    for i = 1:expinfo.maxsetsize
        Marker.MemSet(i) = 210+(i);
        Marker.Update(i) = 220+(i);
        Marker.ISI(i) = 230+(i);
        Marker.Cue(i) = 240+(i);
    end
else
    Marker.MemSet = 0;
    Marker.Update =0;
    Marker.ISI= 0;
    Marker.Cue = 0;
end

Marker.CorrResp = 150;
Marker.IncorrResp = 250;

for i = 1:expinfo.maxsetsize
    Marker.SetSize(i)=60 + i;
    Marker.Updatings(i)=69 + i;
end


Marker.ITI = 90;
Marker.Miss = 5;
% end
%% Write Markers into expinfo object
expinfo.Marker = Marker;
end

