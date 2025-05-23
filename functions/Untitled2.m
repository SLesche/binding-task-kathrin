  Trial(trial).Probe_1 = num2str(Trial(trial).Probe_1);
   Trial(trial).Probe_2 = num2str(Trial(trial).Probe_2);
   Trial(trial).Probe_3 = num2str(Trial(trial).Probe_3);
   Trial(trial).Probe_4 = num2str(Trial(trial).Probe_4);
   Trial(trial).Probe_5 = num2str(Trial(trial).Probe_5);
   Trial(trial).Probe_6 = num2str(Trial(trial).Probe_6);
   
   
   Trial(trial).ProbeVector = [Trial(trial).Probe_1 Trial(trial).Probe_2 Trial(trial).Probe_3 Trial(trial).Probe_4 Trial(trial).Probe_5 Trial(trial).Probe_6];
   
   Trial(trial).CorResp = [num2str(Trial(trial).CorrResp_1) num2str(Trial(trial).CorrResp_2) num2str(Trial(trial).CorrResp_3) num2str(Trial(trial).CorrResp_4) num2str(Trial(trial).CorrResp_5) num2str(Trial(trial).CorrResp_6)];
 
   Trial(trial).Probe1 = [Trial(trial).ProbeSet1_1 Trial(trial).ProbeSet2_1 Trial(trial).ProbeSet3_1 Trial(trial).ProbeSet4_1 Trial(trial).ProbeSet5_1 Trial(trial).ProbeSet6_1];
   Trial(trial).Probe2 = [Trial(trial).ProbeSet1_2 Trial(trial).ProbeSet2_2 Trial(trial).ProbeSet3_2 Trial(trial).ProbeSet4_2 Trial(trial).ProbeSet5_2 Trial(trial).ProbeSet6_2];
   Trial(trial).Probe3 = [Trial(trial).ProbeSet1_3 Trial(trial).ProbeSet2_3 Trial(trial).ProbeSet3_3 Trial(trial).ProbeSet4_3 Trial(trial).ProbeSet5_3 Trial(trial).ProbeSet6_3];
   Trial(trial).Probe4 = [Trial(trial).ProbeSet1_4 Trial(trial).ProbeSet2_4 Trial(trial).ProbeSet3_4 Trial(trial).ProbeSet4_4 Trial(trial).ProbeSet5_4 Trial(trial).ProbeSet6_4];
   Trial(trial).Probe5 = [Trial(trial).ProbeSet1_5 Trial(trial).ProbeSet2_5 Trial(trial).ProbeSet3_5 Trial(trial).ProbeSet4_5 Trial(trial).ProbeSet5_5 Trial(trial).ProbeSet6_5];
   Trial(trial).Probe6 = [Trial(trial).ProbeSet1_6 Trial(trial).ProbeSet2_6 Trial(trial).ProbeSet3_6 Trial(trial).ProbeSet4_6 Trial(trial).ProbeSet5_6 Trial(trial).ProbeSet6_6];
      
    Trial(trial).FixMarker = expinfo.Marker.Fixation(Trial(trial).Task);
    Trial(trial).ISIMarker = expinfo.Marker.ISI(Trial(trial).Task);
    Trial(trial).ProbeStimMaker = expinfo.Marker.Target(Trial(trial).Task);
    
% Präsentation der Probes

for f = 1: Trial(expTrial).SetSize
    WaitSecs(expinfo.MinISIduration);
    
    ScreenGrid(expinfo);
           
        if f == 1
            Probes = Trial(expTrial).Probe1;
        elseif f == 2
            Probes = Trial(expTrial).Probe2;
        elseif   f == 3
            Probes = Trial(expTrial).Probe3;
        elseif f == 4
            Probes = Trial(expTrial).Probe4;
        elseif f == 5
            Probes = Trial(expTrial).Probe5;
        elseif f == 6
            Probes = Trial(expTrial).Probe6;
        end
        
        if Trial(expTrial).SetSize == 2
            XPos = expinfo.OutGridPos2;
        elseif   Trial(expTrial).SetSize == 3
            XPos = expinfo.OutGridPos3;
        elseif Trial(expTrial).SetSize == 4
            XPos = expinfo.OutGridPos4;
        elseif Trial(expTrial).SetSize == 5
            XPos = expinfo.OutGridPos5;
        elseif Trial(expTrial).SetSize == 6
            XPos = expinfo.OutGridPos6;
        end
          
        for g = 1: Trial(expTrial).SetSize
            if g == Trial(expTrial).SetSize
                TextCenteredOnPos1(expinfo, '?',expinfo.Pos(str2double(Trial(expTrial).ProbeVector(f))*2-1),expinfo.Pos(str2double(Trial(expTrial).ProbeVector(f))*2),expinfo.Colors.black);
            end
            TextCenteredOnPosOutGr(expinfo, Probes(g), XPos(g),expinfo.OutGridY, expTrial ,Trial, g ,expinfo.Colors.black);
        end
        
        [Trial, ACC, waitingTime] = getresponseOutGr(expinfo, Trial, expTrial, Probes , f);
        WaitSecs(waitingTime);

       'PracTrials'==Trial
       e=1;
   PracTrials(1).MemPos = [Trial(trial).Pos1 Trial(trial).Pos2 Trial(trial).Pos3 Trial(trial).Pos4 Trial(trial).Pos5 Trial(trial).Pos6];
 TextCenteredOnPos(expinfo,num2str(PracTrials(1).MemSet(e)),expinfo.Pos(2*PracTrials(1).Pos(e)-1),expinfo.Pos(2*PracTrials(1).Pos(e)), expinfo.Colors.black);
