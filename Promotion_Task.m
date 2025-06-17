%% Name of the experiment %%
% Its good practice to give a short desctiption of your experiment
clear all; % Start the experiment with empty workspace
clc; % Clear command window

% Create Folder for B Up Files if it does not exist
if ~exist('DataFiles', 'dir')
    mkdir DataFiles
end
% location for data backup

addpath('functions', 'Instructions', 'DataFiles');   
%% Enter Subject & Session ID + further    Info if needed %%
% Define a task name
TaskName = 'Binding_Task';

% Define variables to be specified when the experiment starts.
vars = {'sub','name'};
% The following variables can be specified:
    % Subject ID = 'sub'
    % Session Number = 'ses'
    % Test Run = 'test'
    % Instruction Language = 'lang'
    % Run practive = 'prac'
    % Subject's Age = 'age'
    % Subject's Gender = 'gender'
    % Subject's Sex = 'sex'

% Run provideInfo function. This opens up a dialoge box asking for the
% specified information. For all other variables default values are used.
expinfo = provideInfo(TaskName,vars);


%% Allgemeine Einstellungen & Start von PTB %%

% Open PTB windown
expinfo = startPTB(expinfo,expinfo.testExp); 

% Read in Exp Settings. This is only to keep your wrapper code tidy and
% structured. All Settings for the Experiment should be specified in this
% funtion. Rarely you will perform complex programming in this function.
% Rather you will define variables or experimental factors, etc.
expinfo = ExpSettings(expinfo); 

expinfo.Block =1;
ExpTrials_Binding =  MakeTrial(expinfo, 0);
% expinfo.Block =2;
% ExpTrials_Substitution =  MakeTrial(expinfo, 0);
% expinfo.Block =3;
% ExpTrials_Transformation =  MakeTrial(expinfo, 0);

% expinfo = getBio(expinfo, TaskName);
% Set priority for PTB processes to ensure best possible timing
topPriorityLevel = MaxPriority(expinfo.window);
Priority(topPriorityLevel);
% expinfo = getMarkers(expinfo, isPractice);
% 
%  io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.MatlabStart);
%  WaitSecs(0.1);
%  io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
%  

%% 1.General Instructions

% This is a loop running through the general instruction slides allowing to
% move back and forth within these slides. As soon as the last slide is
% finished you cannot move back.

 HelloParticipant(expinfo)

 
Screen('TextSize', expinfo.window, 30)

expinfo.Block = 1;
isPractice = 1;
% expinfo = getMarkers(expinfo, isPractice);
% 
%    io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.Block);
%    WaitSecs(0.1);
%    io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
%    
WaitSecs(0.1);
   
%    io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.Prac);
%    WaitSecs(0.1);
%    io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
   
PracTrials_1 = MakeTrial(expinfo, isPractice);

ExpSlideGenerally = 1;
while ExpSlideGenerally <= expinfo.ExpStopPrac
ExpSlide=[expinfo.InstFolder 'Prac_Block',num2str(expinfo.Block),'_Inst', num2str(ExpSlideGenerally) expinfo.InstExtension];
ima=imread(ExpSlide);

    % Put the File on the PTB window
    InstScreen = Screen('MakeTexture',expinfo.window,ima);
    Screen('DrawTexture', expinfo.window, InstScreen); % draw the scene
    Screen('Flip', expinfo.window);
    WaitSecs(0.3);
    
    % Wait for a key press of the right or left key to navigate back an
    % forth within the instructions
    if ExpSlideGenerally == 1
        [ForwardBackward] = BackOrNext(expinfo,1);
    else
        [ForwardBackward] = BackOrNext(expinfo,0);
    end
    ExpSlideGenerally = ExpSlideGenerally + ForwardBackward;
end

  for   practrials = 1: length(PracTrials_1) % Loop through the practice trials
        PracTrials_1 = DisplayTrial(expinfo, PracTrials_1, practrials, isPractice);
  end
    BackUp_PracTrial_1 = [expinfo.DataFolder,'Backup\',expinfo.taskName,'_Prac_Trials_',num2str(expinfo.subject),'_Binding'];
    save(BackUp_PracTrial_1,'PracTrials_1');
    BackUp_Expinfo_Prac_1 = [expinfo.DataFolder,'Backup\',expinfo.taskName,'_Expinfo_Prac_Trials_',num2str(expinfo.subject),'_Binding'];
    save(BackUp_Expinfo_Prac_1,'expinfo');
    

   
%% Exp Block
   
isPractice = 0;
ExpTrials =  ExpTrials_Binding;
   
ExpStart=[expinfo.InstFolder 'ExpStartBlock',num2str(expinfo.Block),'.jpg']; % Eine Folie, dass Exp startete und Aufgabenbeschreibung
ima=imread(ExpStart);
dImageWait(expinfo,ima);
   
%    io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.Exp);
%    WaitSecs(0.1);
%    io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
     
if expinfo.Block==1
%        io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.Block);
%        WaitSecs(0.1);
%        io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
    
    for expTrial = 1 : 1/2*length(ExpTrials) % Loop durch alle Experimental-Trials
        ExpTrials = DisplayTrial(expinfo, ExpTrials, expTrial, isPractice);
    end
    
%        io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.BreakStart);
%        WaitSecs(0.1);
%        io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
        
    Break=[expinfo.InstFolder 'Break.jpg']; % Eine Folie, dass Exp startete und Aufgabenbeschreibung
    ima=imread(Break);
    dImageWait(expinfo,ima);
    
%        io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.BreakEnd);
%        WaitSecs(0.1);
%        io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port

    for expTrial = 1/2*length(ExpTrials)+1: length(ExpTrials) % Loop durch alle Experimental-Trials
        ExpTrials = DisplayTrial(expinfo, ExpTrials, expTrial, isPractice);
    end
    
end
      
%    io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.BlockEnd);
%    WaitSecs(0.1);
%    io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
%     
   
   %save all information: i.e. the trial objects, and the expinfo structure.
   % This ensures that all information used within the experiment can be
   % accsessed later
   BackUp_Trial     = [expinfo.DataFolder,'Backup\',expinfo.taskName,'_ExpTrials_',num2str(expinfo.subject),'_Binding'];
   save(BackUp_Trial,'ExpTrials');
   BackUp_ExpInfo   = [expinfo.DataFolder,'Backup\',expinfo.taskName,'_Exp_ExpInfo_',num2str(expinfo.subject),'_Binding'];
   save(BackUp_ExpInfo,'expinfo');
   
   ExpBlockEnd=[expinfo.InstFolder 'ExpEndBlock.jpg'];
   ima=imread(ExpBlockEnd);
   dImageWait(expinfo,ima);
    
%    
%    io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.ExpEnd);
%    WaitSecs(0.1);
%    io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
  
   
   %% End Experiment
   
   % Display one final slide telling the participant that the experiment is
   % finished.
   ExpEnd=[expinfo.InstFolder 'ExpEnd.jpg'];
   ima=imread(ExpEnd, 'jpg');
   dImageWait(expinfo,ima);
   
   
   % io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.ExpEnd);
   % WaitSecs(0.1);
   % io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
   
   Priority(0); % Reset priority to low level
   closeexp(expinfo.window); % Close the experiment


%% End of Script
% This script was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uni-heidelberg.de
