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
 expinfo.maxiter =1000;

expinfo.SetSize = [3:5];
expinfo.Stimuli = [0:9];
expinfo.maxsetsize = 5;
expinfo.conditionInfo=5;
expinfo.nPracTrials_1=3;
expinfo.nPracTrials_2=10;
expinfo.nExpTrials_Binding=30;
expinfo.nExpTrials_Updating=90;
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
    SampleMatrix(i,1) = i; % Trial Nummer
    if isPractice==1
        if expinfo.Block==1
            for i = 1:3
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            end
        elseif expinfo.Block==2
            if i ==1
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i ==2
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i ==3
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=3; %Updating-Steps
            end
      elseif expinfo.Block==3
            if i ==1
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i ==2
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i ==3
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=3; %Updating-Steps
            end
        end
    elseif isPractice==2
        if expinfo.Block==1
            if i <=3
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i <=6
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i >6
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            end
        else
            if i ==1
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i ==2
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i ==3
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,5)=3; %Updating-Steps
            elseif i ==4
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i ==5
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i ==6
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,5)=4; %Updating-Steps
            elseif i ==7
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i ==8
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i ==9
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,5)=5; %Updating-Steps
            elseif i ==10
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,5)=5; %Updating-Steps
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
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i <=20
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            elseif i <=30
                SampleMatrix(i,2)=1; %Block
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,4)=0; %Updating-Type
                SampleMatrix(i,5)=0; %Updating-Steps
            end
        elseif expinfo.Block==2
            if i<=10
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=20
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i<=30
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=3; %Updating-Steps
            elseif i<=40
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=50
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i<=60
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=4; %Updating-Steps
            elseif i<=70
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=80
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i>80
                SampleMatrix(i,2)=2; %Block
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,4)=1; %Updating-Type
                SampleMatrix(i,5)=5; %Updating-Steps
            end
            
        elseif expinfo.Block==3
            if i<=10
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=20
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i<=30
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=3; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=3; %Updating-Steps
            elseif i<=40
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=50
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i<=60
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=4; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=4; %Updating-Steps
            elseif i<=70
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=1; %Updating-Steps
            elseif i<=80
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=2; %Updating-Steps
            elseif i<=90
                SampleMatrix(i,2)=3; %Block
                SampleMatrix(i,3)=5; %Setsize
                SampleMatrix(i,4)=2; %Updating-Type
                SampleMatrix(i,5)=5; %Updating-Steps
            end
        end
        
    end
end

%%


% Nun werden die Positionen in die Trials eingebaut
% Positionen dürfen sich nicht wiederholen 
% Es darf keine 5 vorkommen, da da das Fadenkreuz präsentiert wird 
 for i = 1: size(SampleMatrix,1)
     for j=expinfo.conditionInfo+max(expinfo.SetSize)+1:expinfo.conditionInfo+max(expinfo.SetSize)+SampleMatrix(i,3)%erste Spalte nach den Infos:so viele Spalten weiter, die die set size definiert ist für Trial i
         test = 0;
         while test == 0
             SampleMatrix(i,expinfo.conditionInfo+max(expinfo.SetSize)+1:expinfo.conditionInfo+max(expinfo.SetSize)+SampleMatrix(i,3)) = randi([1 9],1, SampleMatrix(i,3)); % Stim 1
             if length(unique(SampleMatrix(i,expinfo.conditionInfo+max(expinfo.SetSize)+1:expinfo.conditionInfo+max(expinfo.SetSize)+SampleMatrix(i,3)))) == length(SampleMatrix(i,expinfo.conditionInfo+max(expinfo.SetSize)+1:expinfo.conditionInfo+max(expinfo.SetSize)+SampleMatrix(i,3)))...
                     && all(SampleMatrix(i,expinfo.conditionInfo+max(expinfo.SetSize)+1:expinfo.conditionInfo+max(expinfo.SetSize)+SampleMatrix(i,3))~=5)
                test = 1;
             end
         end
     end
 end

 %Für Updating mit arithmetischer Operation: Art der operation 
 %1 = Addition 
 %2 = Subtraktion
 for i = 1:size(SampleMatrix, 1)
     if SampleMatrix(i,4)==2 %Wenn Updating Typ 2, also aritmetische Operation
         test=0;
         while test==0
             for j =expinfo.conditionInfo+2*max(expinfo.SetSize)+1:expinfo.conditionInfo+2*max(expinfo.SetSize)+SampleMatrix(i,5)%erste Spalte nach den Infos:so viele Spalten weiter, wie Updatingsteps definiert sind für Trial i
                 SampleMatrix(i,expinfo.conditionInfo+2*max(expinfo.SetSize)+1:expinfo.conditionInfo+2*max(expinfo.SetSize)+SampleMatrix(i,5)) = randi([1 2],1, SampleMatrix(i,5)); % Stim 1
             end
             a = sum(SampleMatrix(:,expinfo.conditionInfo+2*max(expinfo.SetSize)+1:expinfo.conditionInfo+2*max(expinfo.SetSize)+5) ==1);
             b = sum(SampleMatrix(:,expinfo.conditionInfo+2*max(expinfo.SetSize)+1:expinfo.conditionInfo+2*max(expinfo.SetSize)+5) ==2);
             sum(a);
             sum(b);
             if sum(a) == sum(b) || sum(a)== sum(b)+1 || sum(a)== sum(b)-1
                 test =1;
             end 
         end
     end
 end





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
    Trial(trial).MemPos1 = TrialMatrix(trial,11);
    Trial(trial).MemPos2 = TrialMatrix(trial,12);
    Trial(trial).MemPos3 = TrialMatrix(trial,13);
    Trial(trial).MemPos4 = TrialMatrix(trial,14);
    Trial(trial).MemPos5 = TrialMatrix(trial,15);
    Trial(trial).UpdateTyp1 = TrialMatrix(trial,16);
    Trial(trial).UpdateTyp2 = TrialMatrix(trial,17);
    Trial(trial).UpdateTyp3 = TrialMatrix(trial,18);
    Trial(trial).UpdateTyp4 = TrialMatrix(trial,19);
    Trial(trial).UpdateTyp5 = TrialMatrix(trial,20);
    %create Vektors with all informatuíon 
    Trial(trial).MemPos = [Trial(trial).MemPos1 Trial(trial).MemPos2 Trial(trial).MemPos3 Trial(trial).MemPos4 Trial(trial).MemPos5];
    Trial(trial).Operation = [Trial(trial).UpdateTyp1 Trial(trial).UpdateTyp2 Trial(trial).UpdateTyp3 Trial(trial).UpdateTyp4 Trial(trial).UpdateTyp5];
  %remove unnecessary information 
    Trial(trial).MemPos(Trial(trial).MemPos<0) = [];
    Trial(trial).Operation(Trial(trial).Operation<0) = [];
end


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
    if expinfo.Block ~= 1 %remeber: Block 1 is just Binding, hence no Updating
      test=0;
        while test ==0
            %define updating position
            %needs to be defined first, bc possible Updatong items depend
            %on location
            Trial(trial).UpdatePos(1:Trial(trial).UpdatingSteps) = datasample(Trial(trial).MemPos, Trial(trial).UpdatingSteps,'Replace',false);
            if all(histc(Trial(trial).UpdatePos, unique(Trial(trial).UpdatePos))<2)  %check if there is any repeating value
                test=1;
            end
        end
    end   
end

%save correct response for binding trials 
%correct response for updating trial is saved elsewhere, because
%it needs to be embedded in the loop which prossesses the updating numbers 


%Correct response and Update Stimuli for updating
for trial = 1:length(Trial)
    for e = 1: Trial(trial).UpdatingSteps
        if expinfo.Block == 2 %Updating differs depending on Condition
            test= 0;
            while test ==0
                Trial(trial).MemSet =  randi([0 9],1,Trial(trial).MemSetSize);
                Trial(trial).Update = randi([0 9],1,Trial(trial).UpdatingSteps);
                Trial(trial).ProbePos = randsample(Trial(trial).MemPos,Trial(trial).MemSetSize);
               for p = 1:Trial(trial).MemSetSize
                    if ismember(Trial(trial).ProbePos(p), Trial(trial).UpdatePos)
                        k = find(Trial(trial).UpdatePos== Trial(trial).ProbePos(p));
                        Trial(trial).CorrResp(p)= Trial(trial).Update(k);
                    else
                        k = find(Trial(trial).MemPos== Trial(trial).ProbePos(p));
                        Trial(trial).CorrResp(p)= Trial(trial).MemSet(k);
                    end
                end
                if ~any(intersect(Trial(trial).Update(1:Trial(trial).UpdatingSteps), Trial(trial).MemSet)) && length(unique(Trial(trial).Update(1:Trial(trial).UpdatingSteps))) == Trial(trial).UpdatingSteps && length(unique(Trial(trial).CorrResp)) == Trial(trial).MemSetSize && length(unique(Trial(trial).MemSet)) == Trial(trial).MemSetSize...
                        && ~isequal(Trial(trial).ProbePos, Trial(trial).MemPos)
                    test =1;
                end
            end
        end
    end
end



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
                        && length(unique(Trial(trial).MemSet)) == Trial(trial).MemSetSize...
                        && ~isequal(Trial(trial).ProbePos, Trial(trial).MemPos)
                    test =1;
                end
            end
        end
    end
end



                        && length(unique(Trial(trial).Update(1:Trial(trial).UpdatingSteps))) == Trial(trial).UpdatingSteps...



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


  