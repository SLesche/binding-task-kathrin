function [Trial] = MakeTrial(expinfo, isPractice)
clear all
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 expinfo.Fix_Duration = 0.4; 
 expinfo.Fix_jitter = 0.2;
 expinfo.MinISIduration = 0.5; 
 expinfo.ISIjitter = 0.1; 
 expinfo.Stimjitter = 0.1; 
 expinfo.MinTarget = 1;
 expinfo.MaxRT = 3; 
 expinfo.MinITIduration =1;
 expinfo.StimDuration = 1.5 ;
 expinfo.ProbeDuration = 1.5;
 expinfo.ITIjitter =0.5;
 expinfo.Fixjitter =0.5;
 isPractice =0;
 expinfo.Block=2;
 expinfo.maxiter =1000;

 expinfo.maxiter=100;
expinfo.SetSize_binding = [5:7];
expinfo.SetSize_updating = [4:6];
expinfo.Stimuli = [0:9];
expinfo.maxsetsize = 7;
expinfo.UpdatingSteps= [0, 1, 2, max(expinfo.SetSize_updating) ];
expinfo.conditionInfo=5;
expinfo.nPracTrials_1=3;
expinfo.nPracTrials_2_Binding=30;
expinfo.nPracTrials_2_Updating=120;
expinfo.nExpTrials_Binding=30;
expinfo.nExpTrials_Updating=12;
expinfo.subject=1;

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Je nach Block haben wir eine unterschiedliche Anzahl von Stimuli 
% Block1 = Binding 
% Block2 = Updating
% Block3 = Updating mit Operation 

rng(expinfo.subject)
if expinfo.Block==1
    expinfo.nExpTrials =expinfo.nExpTrials_Binding;
    expinfo.nPracTrials_2 = expinfo.nPracTrials_2_Binding;
else
    expinfo.nExpTrials =expinfo.nExpTrials_Updating;
    expinfo.nPracTrials_2 = expinfo.nPracTrials_2_Updating;
end

if isPractice ==1
    SampleMatrix = repmat(-9, expinfo.nPracTrials_1);
elseif isPractice ==2
    SampleMatrix = repmat(-9, expinfo.nPracTrials_2);
elseif isPractice ==0
    SampleMatrix = repmat(-9, expinfo.nExpTrials);
end
%%
%Matrix mit Informationen füllen


for i = 1: size(SampleMatrix,1)
    SampleMatrix(i,1) = i; % Trial Nummer
    if isPractice==1
        if expinfo.Block==1
            if i ==1
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=2; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i ==2
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i ==3
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            end
        elseif expinfo.Block==2
            if i ==1
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=2; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i ==2
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i ==3
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            end
        elseif expinfo.Block==3
            if i ==1
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=2; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i ==2
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i ==3
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            end
        end
    elseif isPractice==2
        if expinfo.Block==1
            if i <=10
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=2; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i <=20
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i >20
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            end
        else
            if i <=10
                SampleMatrix(i,3)=2; %Setsize
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=20
                SampleMatrix(i,3)=2; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i<=30
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i <=40
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i <=55
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,5)=3; %Updating-Steps
            elseif i <=70
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,5)=3; %Updating-Steps
            elseif i <= 80
                SampleMatrix(i,3)=2; %Setsize
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i <= 90
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i <= 120
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,5)=0; %Updating-Steps
            end
        end
        if expinfo.Block==2
            for i = 1:size(SampleMatrix,1)
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,4)=1; %Updating-Type
            end
        elseif expinfo.Block==3
            for i = 1:size(SampleMatrix,1)
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,4)=2; %Updating-Type
            end
        end
    elseif isPractice ==0
        if expinfo.Block==1
            if i <=10
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=expinfo.SetSize_binding(1); %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i <=20
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=expinfo.SetSize_binding(2); %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i >20
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=expinfo.SetSize_binding(3); %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            end
        elseif expinfo.Block==2
            if i<=1/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(1); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=2/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(1); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i<=3/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(1); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=4; %Updating-Steps
            elseif i<=4/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(1); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i<=5/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=6/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i<=7/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=5; %Updating-Steps
            elseif i<=8/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i<=9/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=10/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i<=11/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=6; %Updating-Steps
            elseif i>11/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            end
            
        elseif expinfo.Block==3
            if i<=1/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(1); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i<=2/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(1); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=3/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(1); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i<=4/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(1); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=4; %Updating-Steps
            elseif i<=5/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i<=6/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=7/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i<=8/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=5; %Updating-Steps
            elseif i<=9/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i<=10/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=11/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i>11/12*expinfo.nExpTrials_Updating
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=6; %Updating-Steps
            end
        end
        
    end
end

%%



% Nun wird die Sample Matrix in eine TrialMatrix übertragen, sodass, die
% Trials randomisiert präsentiert werden
if isPractice == 1
    TrialMatrix= SampleMatrix;
else
    trialsSelected = 0;
    TrialMatrix = zeros(size(SampleMatrix,1),size(SampleMatrix,2));
    for trial = 1:size(SampleMatrix,1)
        test = 0;
        iter = 0;%falls noch bedingungen eingebaut werden sollen
        while test == 0
            RandRow = randsample(size(SampleMatrix,1),1);
            test =1;
        end
        if test == 1
            TrialMatrix(trial,:) = SampleMatrix(RandRow,:);
            SampleMatrix(RandRow,:) = [];
            trialsSelected = trialsSelected + 1;
        else
            break
        end
    end
end

%Informationen einbauen 
for trial = 1: size(TrialMatrix,1)
    if isPractice == 1
        Trial(trial).TaskDescription = 'Promotion_Task_Exp';
    else
        Trial(trial).TaskDescription = 'Promotion_Task_Prac';
    end
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
%             a = sum([Trial(:).Operation] ==1);
%             b = sum([Trial(:).Operation] ==2);
            if length(unique(Trial(trial).MemPos)) == Trial(trial).MemSetSize...
                && all(Trial(trial).MemPos~=5)
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


for trial = 1: length(Trial)
    if expinfo.Block == 2 %remeber: Block 1 is just Binding, hence no Updating
        if Trial(trial).UpdatingSteps ==0
            Trial(trial).StimPos = Trial(trial).MemPos;
        else
            test=0;
            while test ==0
                Trial(trial).StimPos = cat(2,Trial(trial).UpdatePos ,Trial(trial).MemPos);
                Trial(trial).StimPos= Trial(trial).StimPos(randperm(length(Trial(trial).StimPos)));
                [uniqueA i] = unique(Trial(trial).StimPos, 'first');
                index= find(not(ismember(1:numel(Trial(trial).StimPos),i)));
                for e = 1: Trial(trial).UpdatingSteps
                    Duplicates= find(Trial(trial).StimPos == Trial(trial).StimPos(index(e)));
                    if ((Duplicates(2) - Duplicates(1)) > 1) && ((Duplicates(2) - Duplicates(1)) < 4)
                        Trial(trial).test(e)=1;
                    else
                        Trial(trial).test(e)=0;
                    end
                end
                if all(Trial(trial).test==1)
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
                Trial(trial).MemSet =  randi([0 9],1,length(Trial(trial).StimPos));
                Trial(trial).Update = 0;
                Trial(trial).ProbePos = randsample(Trial(trial).StimPos,Trial(trial).MemSetSize);
                for p = 1:Trial(trial).MemSetSize
                    k = find(Trial(trial).StimPos== Trial(trial).ProbePos(p));
                    Trial(trial).CorrResp(p)= Trial(trial).MemSet(k);
                end
                if  length(unique(Trial(trial).MemSet)) == Trial(trial).MemSetSize...
                        && ~isequal(Trial(trial).ProbePos, Trial(trial).StimPos)
                    test =1;
                end
            else
                Trial(trial).MemSet =  randi([0 9],1,Trial(trial).MemSetSize);
                Trial(trial).Update = randi([0 9],1,Trial(trial).UpdatingSteps);
                Trial(trial).StimSet = cat(2,Trial(trial).Update ,Trial(trial).MemSet);
                Trial(trial).ProbePos = randsample(Trial(trial).MemPos,Trial(trial).MemSetSize);
                for p = 1:length(Trial(trial).StimPos)
                    if ismember(Trial(trial).ProbePos(p), Trial(trial).UpdatePos)
                        k = find(Trial(trial).StimPos == Trial(trial).ProbePos(p));
                        Trial(trial).CorrResp(p)= Trial(trial).MemSet(k(2));
                    else
                        l = find(Trial(trial).StimPos== Trial(trial).ProbePos(p));
                        Trial(trial).CorrResp(p)= Trial(trial).MemSet(l);
                    end
                end
                for e = 1:Trial(trial).UpdatingSteps                    
                [uniqueA i] = unique(Trial(trial).StimPos, 'first');
                index= find(not(ismember(1:numel(Trial(trial).StimPos),i)));
                   Duplicates= find(Trial(trial).StimPos == Trial(trial).StimPos(index(e)));
                    if Trial(trial).MemSet(Duplicates(1)) ~= Trial(trial).MemSet(Duplicates(2))...
                            &&  Trial(trial).MemSet(uniqueA)
                        Trial(trial).test(e)=1;
                    else
                        Trial(trial).test(e)=0;
                    end
    
                        if Trial(trial).Update(e) ~= Trial(trial).MemSet(m)
                            Trial(trial).test2(e)=0;
                        else
                            Trial(trial).test2(e)=1;
                        end
                end
                if all(Trial(trial).test2 == 0)...
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




% for trial = 1:length(Trial)
%     if expinfo.Block==2
%         test= 0;
%         while test ==0
%             if Trial(trial).UpdatingSteps ==0
%                 Trial(trial).MemSet =  randi([0 9],1,Trial(trial).MemSetSize);
%                 Trial(trial).Update = 0;
%                 Trial(trial).ProbePos = randsample(Trial(trial).MemPos,Trial(trial).MemSetSize);
%                 for p = 1:Trial(trial).MemSetSize
%                     k = find(Trial(trial).MemPos== Trial(trial).ProbePos(p));
%                     Trial(trial).CorrResp(p)= Trial(trial).MemSet(k);
%                 end
%                 if  length(unique(Trial(trial).MemSet)) == Trial(trial).MemSetSize...
%                         && ~isequal(Trial(trial).ProbePos, Trial(trial).MemPos)
%                     test =1;
%                 end
%             else
%                 Trial(trial).MemSet =  randi([0 9],1,Trial(trial).MemSetSize);
%                 Trial(trial).Update = randi([0 9],1,Trial(trial).UpdatingSteps);
%                 Trial(trial).ProbePos = randsample(Trial(trial).MemPos,Trial(trial).MemSetSize);
%                 for p = 1:Trial(trial).MemSetSize
%                     if ismember(Trial(trial).ProbePos(p), Trial(trial).UpdatePos)
%                         k = find(Trial(trial).UpdatePos== Trial(trial).ProbePos(p));
%                         Trial(trial).CorrResp(p)= Trial(trial).Update(k);
%                     else
%                         l = find(Trial(trial).MemPos== Trial(trial).ProbePos(p));
%                         Trial(trial).CorrResp(p)= Trial(trial).MemSet(l);
%                     end
%                 end
%                 for e = 1:Trial(trial).UpdatingSteps
%                     m = find(Trial(trial).MemPos== Trial(trial).UpdatePos(e));
%                         if Trial(trial).Update(e) ~= Trial(trial).MemSet(m)
%                             Trial(trial).test(e)=0;
%                         else
%                             Trial(trial).test(e)=1;
%                         end
%                 end
%                 if all(Trial(trial).test == 0)...
%                         && length(unique(Trial(trial).Update(1:Trial(trial).UpdatingSteps))) == Trial(trial).UpdatingSteps...
%                         && length(unique(Trial(trial).CorrResp)) == Trial(trial).MemSetSize...
%                         && length(unique(Trial(trial).MemSet)) == Trial(trial).MemSetSize...
%                         && ~isequal(Trial(trial).ProbePos, Trial(trial).MemPos)
%                     test =1;
%                 end
%             end
%         end
%     end
% end


for trial = 1:length(Trial)
    if expinfo.Block == 3
        test=0;
        while test==0
            Trial(trial).UpdatePos(1:Trial(trial).UpdatingSteps) = datasample(Trial(trial).MemPos, Trial(trial).UpdatingSteps,'Replace',false);
            Trial(trial).Update =  randi([1 9],1,Trial(trial).UpdatingSteps);
            Trial(trial).MemSet =  randi([0 9],1,Trial(trial).MemSetSize);
            Trial(trial).ProbePos = randsample(Trial(trial).MemPos,Trial(trial).MemSetSize);
            %Probeposition and correct response by condition
            %definde probe position
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
        Trial(trial).ISI(i) = expinfo.MinISIduration+rand(1)*expinfo.ISIjitter;
        Trial(trial).StimDuration(i) = expinfo.StimDuration+rand(1)*expinfo.Stimjitter;
    end
end

      
for trial = 1: size(Trial,2)
    Trial(trial).ITI = expinfo.MinITIduration+rand(1)*expinfo.ITIjitter;
    Trial(trial).FIX = expinfo.Fix_Duration+rand(1)*expinfo.Fixjitter;
end

if expinfo.Block~=1
    for trial = 1: size(Trial,2)
          for e = 1: Trial(trial).UpdatingSteps
            Trial(trial).UpdateDuration(e) = expinfo.StimDuration+rand(1)*expinfo.Stimjitter;
            Trial(trial).ISI_Update(e) = expinfo.MinISIduration+rand(1)*expinfo.ISIjitter;
        end
    end
end
    

if expinfo.Block~=3
    for trial = 1: size(Trial,2)
        Trial(trial).Operation =-9;
    end
end



for trial = 1: size(Trial,2)
    Trial(trial).MemSetMarker = expinfo.Marker.MemSet(1:Trial(trial).MemSetSize);
    Trial(trial).ISIMarker = expinfo.Marker.ISI(1:Trial(trial).MemSetSize);
end
    
if expinfo.Block==1    
    for trial = 1: size(Trial,2)
        for e = 1:Trial(trial).MemSetSize
            l = find(Trial(trial).MemPos== Trial(trial).ProbePos(e));
            Trial(trial).CueMarker(e) = expinfo.Marker.Cue(l);
        end   
    end
end

if expinfo.Block~=1
    for trial = 1: size(Trial,2)
        if Trial(trial).UpdatingSteps>0
            for e = 1:Trial(trial).UpdatingSteps
                m = find(Trial(trial).MemPos == Trial(trial).UpdatePos(e));
                Trial(trial).UpdateMarker(e) = expinfo.Marker.Update(m);
                for u = 1:Trial(trial).MemSetSize
                    k = find(Trial(trial).MemPos == Trial(trial).ProbePos(u));
                    Trial(trial).CueMarker(u) = expinfo.Marker.Cue(k);
                end
            end
        else
            for e = 1:Trial(trial).MemSetSize
                l = find(Trial(trial).MemPos== Trial(trial).ProbePos(e));
                Trial(trial).CueMarker(e) = expinfo.Marker.Cue(l);
            end
            
        end
    end
end

    


  