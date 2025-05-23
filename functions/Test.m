function [Trial] = MakeTrial(expinfo, isPractice)
clear all
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 expinfo.Fix_Duration = 0.4; 
 expinfo.Fix_jitter = 0.2;
 expinfo.MinISIduration = 0.5; 
 expinfo.ISIjitter = 0.1; 
 expinfo.MinTarget = 1;
 expinfo.MaxRT = 3; 
 expinfo.MinITIduration =1;
 expinfo.StimDuration = 1.5 ;
 expinfo.ProbeDuration = 1.5;
 expinfo.ITIjitter =0.5;
 isPractice = 0;
 expinfo.Block=3;

 expinfo.maxiter=100;
expinfo.SetSize_binding = [5:8];
expinfo.SetSize_updating = [5:7];
expinfo.Stimuli = [0:9];
expinfo.maxsetsize = 5;
expinfo.UpdatingSteps= [1 2 5 7];
expinfo.conditionInfo=5;
expinfo.nPracTrials_1=3;
expinfo.nPracTrials_2=10;
expinfo.nExpTrials_Binding=40;
expinfo.nExpTrials_Updating=110;
 expinfo.subject=7;

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Je nach Block haben wir eine unterschiedliche Anzahl von Stimuli 
% Block1 = Binding 
% Block2 = Updating
% Block3 = Updating mit Operation 

rng(expinfo.subject)
if expinfo.Block==1
    expinfo.nExpTrials =expinfo.nExpTrials_Binding;
else
    expinfo.nExpTrials =expinfo.nExpTrials_Updating;
end


if isPractice ==1
    SampleMatrix = repmat(-9, expinfo.nPracTrials_1,3+8*expinfo.maxsetsize);
elseif isPractice ==2
    SampleMatrix = repmat(-9, expinfo.nPracTrials_2,3+8*expinfo.maxsetsize);
elseif isPractice ==0
    SampleMatrix = repmat(-9, expinfo.nExpTrials,3+8*expinfo.maxsetsize);
end
%%
%Matrix mit Informationen füllen


for i = 1: size(SampleMatrix,1)
    if expinfo.Block==3
        if i<=10
            SampleMatrix(i,2)=3; %Block
            SampleMatrix(i,3)=expinfo.SetSize_updating(1); %Setsize
            SampleMatrix(i,4)=2; %Updating-Type
            SampleMatrix(i,5)=1; %Updating-Steps
        elseif i<=20
            SampleMatrix(i,2)=3; %Block
            SampleMatrix(i,3)=expinfo.SetSize_updating(1); %Setsize
            SampleMatrix(i,4)=2; %Updating-Type
            SampleMatrix(i,5)=2; %Updating-Steps
        elseif i<=30
            SampleMatrix(i,2)=3; %Block
            SampleMatrix(i,3)=expinfo.SetSize_updating(1); %Setsize
            SampleMatrix(i,4)=2; %Updating-Type
            SampleMatrix(i,5)=5; %Updating-Steps
        elseif i<=40
            SampleMatrix(i,2)=3; %Block
            SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
            SampleMatrix(i,4)=2; %Updating-Type
            SampleMatrix(i,5)=1; %Updating-Steps
        elseif i<=50
            SampleMatrix(i,2)=3; %Block
            SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
            SampleMatrix(i,4)=2; %Updating-Type
            SampleMatrix(i,5)=2; %Updating-Steps
        elseif i<=60
            SampleMatrix(i,2)=3; %Block
            SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
            SampleMatrix(i,4)=2; %Updating-Type
            SampleMatrix(i,5)=5; %Updating-Steps
        elseif i<=70
            SampleMatrix(i,2)=3; %Block
            SampleMatrix(i,3)=expinfo.SetSize_updating(2); %Setsize
            SampleMatrix(i,4)=2; %Updating-Type
            SampleMatrix(i,5)=6; %Updating-Steps
        elseif i<=80
            SampleMatrix(i,2)=3; %Block
            SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
            SampleMatrix(i,4)=2; %Updating-Type
            SampleMatrix(i,5)=1; %Updating-Steps
        elseif i<=90
            SampleMatrix(i,2)=3; %Block
            SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
            SampleMatrix(i,4)=2; %Updating-Type
            SampleMatrix(i,5)=2; %Updating-Steps
        elseif i<=100
            SampleMatrix(i,2)=3; %Block
            SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
            SampleMatrix(i,4)=2; %Updating-Type
            SampleMatrix(i,5)=5; %Updating-Steps
        elseif i>100
            SampleMatrix(i,2)=3; %Block
            SampleMatrix(i,3)=expinfo.SetSize_updating(3); %Setsize
            SampleMatrix(i,4)=2; %Updating-Type
            SampleMatrix(i,5)=7; %Updating-Steps
        end
    end
end


%%

% Nun wird die Sample Matrix in eine TrialMatrix übertragen, sodass, die
% Trials randomisiert präsentiert werden
if isPractice == 1 ||isPractice == 2
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
end

for trial = 1:length(Trial)
    if expinfo.Block == 3
        test=0;
        while test ==0
            Trial(trial).MemPos = randi([0 9],1,Trial(trial).MemSetSize);
            if length(unique(Trial(trial).MemPos))==Trial(trial).MemSetSize
                test=1;
            end
        end
    end
end

for trial = 1:length(Trial)
    if expinfo.Block == 3
        test=0;
        while test ==0
            Trial(trial).Memset = randi([0 9],1,Trial(trial).MemSetSize);
            if length(unique(Trial(trial).Memset))==Trial(trial).MemSetSize
                test=1;
            end
        end
    end
end

for trial = 1:length(Trial)
    if expinfo.Block == 3
        test=0;
        while test ==0
            Trial(trial).Update = randi([0 9],1,Trial(trial).UpdatingSteps);
            if length(unique(Trial(trial).Update))==Trial(trial).UpdatingSteps...
                test=1;
            end
        end
    end
end

for trial = 1:length(Trial)
    if expinfo.Block == 3
        test=0;
        while test==0
            Trial(trial).ProbePos = datasample(Trial(trial).MemPos,Trial(trial).MemSetSize,'Replace',false);
             Trial(trial).UpdatePos = datasample(Trial(trial).ProbePos,Trial(trial).UpdatingSteps,'Replace',false);
          if  ~isequal(Trial(trial).ProbePos, Trial(trial).MemPos)
                test=1;
            end
        end
    end
end


for trial = 1:length(Trial)
    if expinfo.Block == 3
        test=0;
        while test==0
            Trial(trial).ProbePos = datasample(Trial(trial).MemPos,Trial(trial).MemSetSize,'Replace',false);
             Trial(trial).UpdatePos = datasample(Trial(trial).ProbePos,Trial(trial).UpdatingSteps,'Replace',false);
          if  ~isequal(Trial(trial).ProbePos, Trial(trial).MemPos)
                test=1;
            end
        end
    end
end

                Trial(trial).Operation = randi([1 2],1,Trial(trial).UpdatingSteps); % Stim 1
                a = sum([Trial(:).Operation] ==1);
                b = sum([Trial(:).Operation] ==2);





for trial = 1:length(Trial)
    for e = 1: Trial(trial).UpdatingSteps
        if expinfo.Block == 3
            test=0;
            while test ==0
                l= find(Trial(trial).MemPos == Trial(trial).UpdatePos(e));
                Trial(trial).Update =  randi([0 9],1,Trial(trial).UpdatingSteps);
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
                if all(Trial(trial).CorrResp <= 9)...
                        && all(Trial(trial).CorrResp >= 0)...
                        && length(unique(Trial(trial).CorrResp)) == Trial(trial).MemSetSize...
                        && length(unique(Trial(trial).Update(1:Trial(trial).UpdatingSteps))) == Trial(trial).UpdatingSteps...
                        && length(unique(Trial(trial).MemSet)) == Trial(trial).MemSetSize...
                        && ~isequal(Trial(trial).ProbePos, Trial(trial).MemPos)
                    test =1;
                end
            end
        end
    end
end






Trial(trial).ISI1 = 0;
Trial(trial).ISI2 = 0;
Trial(trial).ISI3 = 0;
Trial(trial).ISI4 = 0;
Trial(trial).ISI5 = 0;
Trial(trial).ISI6 = 0;


for trial = 1: size(TrialMatrix,1)
    for i = 1: Trial(trial).MemSetSize
        
        if  i == 1
            Trial(trial).ISI1 = expinfo.MinISIduration+rand(1)*expinfo.ISIjitter;
        elseif  i == 2
            Trial(trial).ISI2 = expinfo.MinISIduration+rand(1)*expinfo.ISIjitter;
        elseif  i == 3
            Trial(trial).ISI3 = expinfo.MinISIduration+rand(1)*expinfo.ISIjitter;
        elseif  i == 4
            Trial(trial).ISI4 = expinfo.MinISIduration+rand(1)*expinfo.ISIjitter;
        elseif  i == 5
            Trial(trial).ISI5 = expinfo.MinISIduration+rand(1)*expinfo.ISIjitter;
        else
            Trial(trial).ISI6 = expinfo.MinISIduration+rand(1)*expinfo.ISIjitter;
        end
    end
end

if expinfo.Block~=3
    for trial = 1: size(TrialMatrix,1)
        Trial(trial).Operation =-9;
    end
end


for trial = 1: size(TrialMatrix,1)
    Trial(trial).StimDuration = expinfo.StimDuration;
    Trial(trial).ProbeDuration = expinfo.ProbeDuration;
    Trial(trial).ITI = expinfo.MinITIduration+rand(1)*expinfo.ITIjitter;
    Trial(trial).FIX = expinfo.Fix_Duration+rand(1)*expinfo.Fix_jitter;
end


end


  