function [Trial] = MakeTrial(expinfo, isPractice)
%  clear all
% %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% expinfo.Fix_Duration = 2;
% expinfo.Fix_jitter = 0.1;
% expinfo.MinISIduration = 1.5;
% expinfo.ISIjitter = 0.1;
% expinfo.Stimjitter = 0.05;
% expinfo.MinTarget = 1;
% expinfo.MaxRT = 6;
% expinfo.MinITIduration =1;
% expinfo.StimDuration = 0.2 ;
% expinfo.ProbeDuration = 0.5;
% expinfo.ITIjitter =0.5;
% expinfo.Fixjitter =0.5;
% isPractice =0;
% expinfo.Block=1;
% 
% expinfo.maxIter=1000;
% expinfo.SetSize_binding = [5:7];
% expinfo.SetSize_updating = [4:6];
% expinfo.Stimuli = [0:9];
% expinfo.maxsetsize = 7;
% expinfo.UpdatingSteps= [0, 1, 2, max(expinfo.SetSize_updating) ];
% expinfo.conditionInfo=5;
% expinfo.nPracTrials_1=3;
% 
% expinfo.nExpTrials_Binding=60;
% expinfo.nExpTrials_Updating=100;
% expinfo.subject=2;
% 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Je nach Block haben wir eine unterschiedliche Anzahl von Stimuli
% Block1 = Binding
% Block2 = Updating
% Block3 = Updating mit Operation

    rng(expinfo.subject)
    if expinfo.Block==1
        expinfo.nExpTrials = expinfo.nExpTrials_Binding;
    else
        expinfo.nExpTrials = expinfo.nExpTrials_Updating;
    end
    
    if isPractice ==1
        SampleMatrix = repmat(-9, expinfo.nPracTrials_1, 5);
    elseif isPractice ==0
        SampleMatrix = repmat(-9, expinfo.nExpTrials, 5);
    end
    %%
    %Matrix mit Informationen füllen
    for i = 1: size(SampleMatrix,1)
        SampleMatrix(i,1)=i; %Block
    end
    
    if expinfo.Block==1
        SampleMatrix(:,2)=1; %Block
        SampleMatrix(:,4)=0; %Updating-Type
        SampleMatrix(:,5)=0; %Updating-Steps
    elseif expinfo.Block==2
        SampleMatrix(:,2)=2; %Block
        SampleMatrix(:,4)=1; %Updating-Type
    elseif expinfo.Block==3
        SampleMatrix(:,2)=2; %Block
        SampleMatrix(:,4)=2; %Updating-Type
    end
    
    
for i = 1: size(SampleMatrix,1)
    SampleMatrix(i,1)=i;
    if expinfo.Block==1
        if isPractice==1
            if i ==1
            SampleMatrix(i,3)=3; %Setsize
            elseif i == 2
                SampleMatrix(i,3)=4; %Setsize
            elseif i ==3
                SampleMatrix(i,3)=5; %Setsize
            end
        elseif isPractice==0
            if i  <=4
                SampleMatrix(i,3)=2; %Setsize
            elseif i<=8
                SampleMatrix(i,3)=3; %Setsize
            elseif i <=12
                SampleMatrix(i,3)=4; %Setsize
            elseif i <=16
                SampleMatrix(i,3)=5; %Setsize
            elseif i <=20
                SampleMatrix(i,3)=6; %Setsize
              elseif i >20
                SampleMatrix(i,3)=7; %Setsize
            end
        end
    elseif expinfo.Block~=1
        if isPractice==1
            if i ==1
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i ==2
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i ==3
                SampleMatrix(i,3)=6; %Setsize
                SampleMatrix(i,5)=3; %Updating-Steps
            end
        elseif isPractice==0
            if i <= expinfo.number_2_1
                SampleMatrix(i,3)=2; %Setsize
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2
                SampleMatrix(i,3)=2; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2 + expinfo.number_3_1
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i <=  expinfo.number_2_1 + expinfo.number_2_2 + expinfo.number_3_1 + expinfo.number_3_2
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2 + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,5)=3; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2 + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3 + expinfo.number_4_1
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2 + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3 + expinfo.number_4_1 + expinfo.number_4_2
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,5)=3; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,5)=4; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4...
                    + expinfo.number_5_1
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4...
                    + expinfo.number_5_1 + expinfo.number_5_2
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4...
                    + expinfo.number_5_1 + expinfo.number_5_2  + expinfo.number_5_3
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,5)=3; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4...
                    + expinfo.number_5_1 + expinfo.number_5_2  + expinfo.number_5_3  + expinfo.number_5_4
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,5)=4; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4...
                    + expinfo.number_5_1 + expinfo.number_5_2  + expinfo.number_5_3  + expinfo.number_5_4 + expinfo.number_5_5
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,5)=5; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4...
                    + expinfo.number_5_1 + expinfo.number_5_2  + expinfo.number_5_3  + expinfo.number_5_4 + expinfo.number_5_5...
                    + expinfo.number_6_1
                SampleMatrix(i,3)=6; %Setsize
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4...
                    + expinfo.number_5_1 + expinfo.number_5_2  + expinfo.number_5_3  + expinfo.number_5_4 + expinfo.number_5_5...
                    + expinfo.number_6_1 + expinfo.number_6_2
                SampleMatrix(i,3)=6; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4...
                    + expinfo.number_5_1 + expinfo.number_5_2  + expinfo.number_5_3  + expinfo.number_5_4 + expinfo.number_5_5...
                    + expinfo.number_6_1 + expinfo.number_6_2  + expinfo.number_6_3
                SampleMatrix(i,3)=6; %Setsize
                SampleMatrix(i,5)=3; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4...
                    + expinfo.number_5_1 + expinfo.number_5_2  + expinfo.number_5_3  + expinfo.number_5_4 + expinfo.number_5_5...
                    + expinfo.number_6_1 + expinfo.number_6_2  + expinfo.number_6_3  + expinfo.number_6_4
                SampleMatrix(i,3)=6; %Setsize
                SampleMatrix(i,5)=4; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4...
                    + expinfo.number_5_1 + expinfo.number_5_2  + expinfo.number_5_3  + expinfo.number_5_4 + expinfo.number_5_5...
                    + expinfo.number_6_1 + expinfo.number_6_2  + expinfo.number_6_3  + expinfo.number_6_4 + expinfo.number_6_5
                SampleMatrix(i,3)=6; %Setsize
                SampleMatrix(i,5)=5; %Updating-Steps
            elseif i <= expinfo.number_2_1 + expinfo.number_2_2...
                    + expinfo.number_3_1 + expinfo.number_3_2 + expinfo.number_3_3...
                    + expinfo.number_4_1 + expinfo.number_4_2  + expinfo.number_4_3  + expinfo.number_4_4...
                    + expinfo.number_5_1 + expinfo.number_5_2  + expinfo.number_5_3  + expinfo.number_5_4 + expinfo.number_5_5...
                    + expinfo.number_6_1 + expinfo.number_6_2  + expinfo.number_6_3  + expinfo.number_6_4 + expinfo.number_6_5 + expinfo.number_6_6
                SampleMatrix(i,3)=6; %Setsize
                SampleMatrix(i,5)=6; %Updating-Steps
            end
        end
    end
end
    %%
    
%     for i= 1:size(SampleMatrix,1)
%         if SampleMatrix(i,5)>0
%             SampleMatrix(i,6) = 1;
%         else
%             SampleMatrix(i,6) = 0;
%         end
%     end
    
    if isPractice == 1
        TrialMatrix= SampleMatrix;
    else
%         test = 0;
%         while test==0
            TrialMatrix = SampleMatrix(randperm(size(SampleMatrix,1)),:);
%             if expinfo.Block~=1
%                 for i= 2:size(SampleMatrix,1)
%                     TrialMatrix(1,7) = 0;
%                     if TrialMatrix(i,6) == TrialMatrix(i-1,6)
%                         TrialMatrix(i,7) = TrialMatrix(i-1,7)+1;
%                     else
%                         TrialMatrix(i,7) = 0;
%                     end
%                 end
%                 if all(TrialMatrix(:,7)<3) && TrialMatrix(1,5)>0
%                     test=1;
%                 end
%             else
%                 test =1;
%             end
%         end
    end
    
    
    %Informationen einbauen
    for trial = 1: size(TrialMatrix,1)
        if isPractice == 1
            Trial(trial).TaskDescription = 'Promotion_Task_Exp';
        else
            Trial(trial).TaskDescription = 'Promotion_Task_Prac';
        end
        Trial(trial).Subject = expinfo.subject;
        Trial(trial).TrialNum = trial;
        Trial(trial).Block = TrialMatrix(trial,2);
        Trial(trial).MemSetSize = TrialMatrix(trial,3);
        Trial(trial).UpdatingType = TrialMatrix(trial,4);
        Trial(trial).UpdatingSteps = TrialMatrix(trial,5);
        %create Vektors with all informatuíon
        %remove unnecessary information
    end
    
    for trial = 1:length(Trial)
        if expinfo.Block==3
            test2=0;
            while test2==0
                Trial(trial).MemPos = randi([1 9],1,Trial(trial).MemSetSize);
                Trial(trial).Operation = randi([1 2],1,Trial(trial).UpdatingSteps); % Stim 1
                a = sum([Trial(:).Operation] ==1);
                b = sum([Trial(:).Operation] ==2);
                if length(unique(Trial(trial).MemPos)) == Trial(trial).MemSetSize...
                        && all(Trial(trial).MemPos~=5)...
                        && (a == b || a == b+1 || a == b-1)
                    test2=1;
                end
            end
        end
    end
    
    
    %memPos für Block 1 und 2, memPos für Block drei wird später definiert
    for trial = 1:length(Trial)
        if expinfo.Block~=3
            test2=0;
            while test2==0
                Trial(trial).MemPos = randi([1 9],1,Trial(trial).MemSetSize);
                if length(unique(Trial(trial).MemPos)) == Trial(trial).MemSetSize...
                        && all(Trial(trial).MemPos~=5)
                    test2=1;
                end
            end
        end
    end
    
    %Memset für Block 1
    for trial = 1:length(Trial)
        if expinfo.Block == 1 %Updating differs depending on Condition
            test= 0;
            while test ==0
                Trial(trial).MemSet =  randi([0 9],1,Trial(trial).MemSetSize);
                Trial(trial).ProbePos = randsample(Trial(trial).MemPos,Trial(trial).MemSetSize);
                for p = 1:Trial(trial).MemSetSize
                    k = find(Trial(trial).MemPos== Trial(trial).ProbePos(p));
                    Trial(trial).CorrResp(p)= Trial(trial).MemSet(k);
                end
                if  length(unique(Trial(trial).MemSet)) == Trial(trial).MemSetSize...
                        && ~isequal(Trial(trial).ProbePos, Trial(trial).MemPos)
                    test =1;
                    
                end
            end
        end
    end
    
    
    
    %Introduce Updating items
    
    for trial = 1: length(Trial)
        if expinfo.Block == 2 %remeber: Block 1 is just Binding, hence no Updating
            test=0;
            while test ==0
                %define updating position
                %needs to be defined first, bc possible Updatong items depend
                %on location
                if Trial(trial).UpdatingSteps ==0
                    Trial(trial).UpdatePos = 0;
                    test=1;
                else
                    Trial(trial).UpdatePos(1:Trial(trial).UpdatingSteps) = datasample(Trial(trial).MemPos, Trial(trial).UpdatingSteps,'Replace',false);
                    if all(histc(Trial(trial).UpdatePos, unique(Trial(trial).UpdatePos))<2) && ~isequal(Trial(trial).UpdatePos, Trial(trial).MemPos)  %check if there is any repeating value
                        test=1;
                    end
                end
            end
        end
    end
    
    
    
    %save correct response for binding trials
    %correct response for updating trial is saved elsewhere, because
    %it needs to be embedded in the loop which prossesses the updating numbers
    %Correct response and Update Stimuli for updating
    
    for trial = 1:length(Trial)
        if expinfo.Block==2
            test= 0;
            while test ==0
                if Trial(trial).UpdatingSteps ==0
                    Trial(trial).MemSet =  randi([0 9],1,Trial(trial).MemSetSize);
                    Trial(trial).Update = 0;
                    Trial(trial).ProbePos = randsample(Trial(trial).MemPos,Trial(trial).MemSetSize);
                    for p = 1:Trial(trial).MemSetSize
                        k = find(Trial(trial).MemPos== Trial(trial).ProbePos(p));
                        Trial(trial).CorrResp(p)= Trial(trial).MemSet(k);
                    end
                    if  length(unique(Trial(trial).MemSet)) == Trial(trial).MemSetSize...
                            && ~isequal(Trial(trial).ProbePos, Trial(trial).MemPos)
                        test =1;
                    end
                else
                    Trial(trial).MemSet =  randi([0 9],1,Trial(trial).MemSetSize);
                    Trial(trial).Update = randi([0 9],1,Trial(trial).UpdatingSteps);
                    Trial(trial).ProbePos = randsample(Trial(trial).MemPos,Trial(trial).MemSetSize);
                    for p = 1:Trial(trial).MemSetSize
                        if ismember(Trial(trial).ProbePos(p), Trial(trial).UpdatePos)
                            k = find(Trial(trial).UpdatePos== Trial(trial).ProbePos(p));
                            Trial(trial).CorrResp(p)= Trial(trial).Update(k);
                        else
                            l = find(Trial(trial).MemPos== Trial(trial).ProbePos(p));
                            Trial(trial).CorrResp(p)= Trial(trial).MemSet(l);
                        end
                    end
                    for e = 1:Trial(trial).UpdatingSteps
                        m = find(Trial(trial).MemPos== Trial(trial).UpdatePos(e));
                        if Trial(trial).Update(e) ~= Trial(trial).MemSet(m)
                            Trial(trial).test(e)=0;
                        else
                            Trial(trial).test(e)=1;
                        end
                    end
                    if all(Trial(trial).test == 0)...
                            && length(unique(Trial(trial).Update(1:Trial(trial).UpdatingSteps))) == Trial(trial).UpdatingSteps...
                            && length(unique(Trial(trial).CorrResp)) == Trial(trial).MemSetSize...
                            && length(unique(Trial(trial).MemSet)) == Trial(trial).MemSetSize...
                            && ~isequal(Trial(trial).ProbePos, Trial(trial).MemPos)
                        test =1;
                    end
                end
            end
        end
    end
    
    
    
    for trial = 1:length(Trial)
        if expinfo.Block == 3
            test=0;
            while test==0
                Trial(trial).UpdatePos(1:Trial(trial).UpdatingSteps) = datasample(Trial(trial).MemPos, Trial(trial).UpdatingSteps,'Replace',false);
                Trial(trial).Update =  randi([1 9],1,Trial(trial).UpdatingSteps);
                Trial(trial).MemSet =  randi([0 9],1,Trial(trial).MemSetSize);
                Trial(trial).ProbePos = randsample(Trial(trial).MemPos,Trial(trial).MemSetSize);
                %Probeposition and correct response by condition
                %define probe position
                for p = 1: Trial(trial).MemSetSize
                    if ismember(Trial(trial).ProbePos(p), Trial(trial).UpdatePos)
                        k = find(Trial(trial).UpdatePos== Trial(trial).ProbePos(p));
                        m = find(Trial(trial).MemPos == Trial(trial).ProbePos(p));
                        if Trial(trial).Operation(k)==1 %Addition
                            Trial(trial).CorrResp(p)= Trial(trial).MemSet(m) + Trial(trial).Update(k);
                        elseif Trial(trial).Operation(k)==2 %Subtraktion
                            Trial(trial).CorrResp(p)= Trial(trial).MemSet(m) -Trial(trial).Update(k);
                        end
                    else
                        n = find(Trial(trial).MemPos== Trial(trial).ProbePos(p));
                        Trial(trial).CorrResp(p)= Trial(trial).MemSet(n);
                    end
                end
                if all(Trial(trial).CorrResp <= 9) && all(Trial(trial).CorrResp >= 0)  ...
                        && length(unique(Trial(trial).MemSet)) == Trial(trial).MemSetSize...
                        && length(unique(Trial(trial).CorrResp)) == Trial(trial).MemSetSize...
                        && length(unique(Trial(trial).Update(1:Trial(trial).UpdatingSteps))) == Trial(trial).UpdatingSteps...
                        && ~isequal(Trial(trial).ProbePos, Trial(trial).MemPos) ...
                        test =1;
                end
            end
        end
    end
    
    
    for trial = 1: size(TrialMatrix,1)
        for i = 1: Trial(trial).MemSetSize
            Trial(trial).ISI(i) = expinfo.MinISIduration;
            Trial(trial).StimDuration(i) = expinfo.StimDuration;
        end
    end
    
    
    for trial = 1: size(Trial,2)
        Trial(trial).ITI = expinfo.MinITIduration;
        Trial(trial).FIX = expinfo.Fix_Duration;
    end
    
    if expinfo.Block~=1
        for trial = 1: size(Trial,2)
            for e = 1: Trial(trial).UpdatingSteps
                Trial(trial).UpdateDuration(e) = expinfo.StimDuration;
                Trial(trial).ISI_Update(e) = expinfo.MinISIduration;
            end
        end
    end
    
    
    if expinfo.Block~=3
        for trial = 1: size(Trial,2)
            Trial(trial).Operation =-9;
        end
    end
    
    
    
%     for trial = 1: size(Trial,2)
%         Trial(trial).MemSetMarker = expinfo.Marker.MemSet(1:Trial(trial).MemSetSize);
%         Trial(trial).ISIMarker = expinfo.Marker.ISI(1:Trial(trial).MemSetSize);
%     end
%     
%     if expinfo.Block==1
%         for trial = 1: size(Trial,2)
%             for e = 1:Trial(trial).MemSetSize
%                 l = find(Trial(trial).MemPos== Trial(trial).ProbePos(e));
%                 Trial(trial).CueMarker(e) = expinfo.Marker.Cue(l);
%             end
%         end
%     end
%     
%     if expinfo.Block~=1
%         for trial = 1: size(Trial,2)
%             if Trial(trial).UpdatingSteps>0
%                 for e = 1:Trial(trial).UpdatingSteps
%                     m = find(Trial(trial).MemPos == Trial(trial).UpdatePos(e));
%                     Trial(trial).UpdateMarker(e) = expinfo.Marker.Update(m);
%                     for u = 1:Trial(trial).MemSetSize
%                         k = find(Trial(trial).MemPos == Trial(trial).ProbePos(u));
%                         Trial(trial).CueMarker(u) = expinfo.Marker.Cue(k);
%                     end
%                 end
%             else
%                 for e = 1:Trial(trial).MemSetSize
%                     l = find(Trial(trial).MemPos== Trial(trial).ProbePos(e));
%                     Trial(trial).CueMarker(e) = expinfo.Marker.Cue(l);
%                 end
%                 
%             end
%         end
%     end  
% end

