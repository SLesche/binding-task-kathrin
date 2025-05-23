% This function loads all settings for the experiment

function expinfo = ExpSettings(expinfo)
%% Get Date an time for this session
expinfo.DateTime = datetime('now');

expinfo.DateTime.Format = 'dd-MMM-yyyy';
expinfo.Date = cellstr(expinfo.DateTime);
expinfo.Date = expinfo.Date{1};

expinfo.DateTime.Format = 'hh:mm:ss';
expinfo.Time = cellstr(expinfo.DateTime);
expinfo.Time = expinfo.Time{1};

%% Specify Stimulus and Text properties (Size, Position, etc.)
expinfo.stimulussize = 40; % in Pixel bzw. Point


%% Secify number of general instruction slides
expinfo.InstStopGenerally = 6;

%% Timing - fixed in all trials
expinfo.Fix_Duration = 1; % Dauer des Fixationskreuzes zu Beginn eines Trials
expinfo.Fix_jitter = 0.0;

expinfo.MinISIduration = 0.5; % Minimale Dauer des Inter-Stimulus-Intervalls (ISI)
expinfo.ISIjitter = 0.0; % ISI Jitter = Intervall in dem das ISI variieren darf

expinfo.MaxRT = 1000; 

expinfo.MinITIduration = 1.5; % Minimale Dauer des Inter-Trial-Intervalls (ITI)
expinfo.ITIjitter =0.0; %ITI Jitter


expinfo.CueDuration = 1;
expinfo.StimDuration =1.5; 
expinfo.ProbeDuration =1; 
expinfo.FeedbackDuration = 1;

%% Specify Response Keys used in the experiment
expinfo.LeftKey = 'd';
expinfo.RightKey = 'l';
expinfo.AbortKey = 'q';
expinfo.RespKeys = {'d' 'l'};
expinfo.ResponseMapping = [1 2];

%% Defining trials to be conducted
% Specify how many trials should be conducted

expinfo.nPracTrials = 2;
expinfo.nExpTrials = 14;
expinfo.expBlocks = 1;

%% Colors

expinfo.Colors.bgColor = [255 255 255]; % white
expinfo.Colors.green =  [0 178 30];
expinfo.Colors.red = [255 25 32];
expinfo.Colors.gray =  [140 140 140];
expinfo.Colors.black = [0 0 0];

%% Size of Grid
expinfo.GridSize1 = 0.25;
expinfo.GridSize2 = 0.41665;
expinfo.GridSize3 = 0.58325;
expinfo.GridSize4 = 0.75;

%% Stimulus Positions in Grid

expinfo.XPos1 = [(expinfo.xCenter - 1/6*expinfo.maxX)];
expinfo.YPos1 =[(expinfo.yCenter + 1/6*expinfo.maxY)]; 
expinfo.XPos2 = [expinfo.xCenter];
expinfo.YPos2 = [(expinfo.yCenter + 1/6*expinfo.maxY)]; 
expinfo.XPos3 = [(expinfo.xCenter + 1/6*expinfo.maxX) ];
expinfo.YPos3 =  [(expinfo.yCenter + 1/6*expinfo.maxY)]; 
expinfo.XPos4 = [(expinfo.xCenter - 1/6*expinfo.maxX)];
expinfo.YPos4 = [ expinfo.yCenter]; 
expinfo.XPos5 = [expinfo.xCenter];
expinfo.YPos5 =[expinfo.yCenter]; 
expinfo.XPos6 = [(expinfo.xCenter + 1/6*expinfo.maxX)];
expinfo.YPos6 = [expinfo.yCenter]; 
expinfo.XPos7 = [(expinfo.xCenter - 1/6*expinfo.maxX) ];
expinfo.YPos7 =[(expinfo.yCenter - 1/6*expinfo.maxY)]; 
expinfo.XPos8 = [expinfo.xCenter ];
expinfo.YPos8 = [ (expinfo.yCenter - 1/6*expinfo.maxY)]; 
expinfo.XPos9 = [(expinfo.xCenter + 1/6*expinfo.maxX)];
expinfo.YPos9 = [ (expinfo.yCenter - 1/6*expinfo.maxY)]; 
expinfo.XPos = [expinfo.XPos1 expinfo.XPos2 expinfo.XPos3 expinfo.XPos4 expinfo.XPos5 expinfo.XPos6 expinfo.XPos7 expinfo.XPos8 expinfo.XPos9];
expinfo.YPos = [expinfo.YPos1 expinfo.YPos2 expinfo.YPos3 expinfo.YPos4 expinfo.YPos5 expinfo.YPos6 expinfo.YPos7 expinfo.YPos8 expinfo.YPos9];

%%  X Positions Outgrid-Probes
expinfo.OutGridPos2 = [(expinfo.xCenter-1/24*expinfo.maxX) (expinfo.xCenter+1/24*expinfo.maxX)];
expinfo.OutGridPos3 = [(expinfo.xCenter-1/12*expinfo.maxX) (expinfo.xCenter) (expinfo.xCenter+1/12*expinfo.maxX)];
expinfo.OutGridPos4 = [(expinfo.xCenter-3/24*expinfo.maxX) (expinfo.xCenter-1/24*expinfo.maxX) (expinfo.xCenter+1/24*expinfo.maxX) (expinfo.xCenter+3/24*expinfo.maxX)];
expinfo.OutGridPos5 = [(expinfo.xCenter-2/12*expinfo.maxX) (expinfo.xCenter-1/12*expinfo.maxX) (expinfo.xCenter) (expinfo.xCenter+1/12*expinfo.maxX) (expinfo.xCenter+2/12*expinfo.maxX)];
expinfo.OutGridPos6 = [(expinfo.xCenter-5/24*expinfo.maxX) (expinfo.xCenter-3/24*expinfo.maxX) (expinfo.xCenter-1/24*expinfo.maxX) (expinfo.xCenter+1/24*expinfo.maxX) (expinfo.xCenter+3/24*expinfo.maxX) (expinfo.xCenter+5/24*expinfo.maxX)]; 

%% Range Grids

expinfo.Renage1 = [expinfo.maxX*expinfo.GridSize1 expinfo.maxY*expinfo.GridSize3 expinfo.maxX*expinfo.GridSize2 expinfo.maxY*expinfo.GridSize4];
expinfo.Renage2 = [expinfo.maxX*expinfo.GridSize2 expinfo.maxY*expinfo.GridSize3 expinfo.maxX*expinfo.GridSize3 expinfo.maxY*expinfo.GridSize4];
expinfo.Renage3 = [expinfo.maxX*expinfo.GridSize3 expinfo.maxY*expinfo.GridSize3 expinfo.maxX*expinfo.GridSize4 expinfo.maxY*expinfo.GridSize4];
expinfo.Renage4 = [expinfo.maxX*expinfo.GridSize1 expinfo.maxY*expinfo.GridSize2 expinfo.maxX*expinfo.GridSize2 expinfo.maxY*expinfo.GridSize3];
expinfo.Renage5 = [expinfo.maxX*expinfo.GridSize2 expinfo.maxY*expinfo.GridSize2 expinfo.maxX*expinfo.GridSize3 expinfo.maxY*expinfo.GridSize3];
expinfo.Renage6 = [expinfo.maxX*expinfo.GridSize3 expinfo.maxY*expinfo.GridSize2 expinfo.maxX*expinfo.GridSize4 expinfo.maxY*expinfo.GridSize3];
expinfo.Renage7 = [expinfo.maxX*expinfo.GridSize1 expinfo.maxY*expinfo.GridSize1 expinfo.maxX*expinfo.GridSize2 expinfo.maxY*expinfo.GridSize2];
expinfo.Renage8 = [expinfo.maxX*expinfo.GridSize2 expinfo.maxY*expinfo.GridSize1 expinfo.maxX*expinfo.GridSize3 expinfo.maxY*expinfo.GridSize2];
expinfo.Renage9 = [expinfo.maxX*expinfo.GridSize3 expinfo.maxY*expinfo.GridSize1 expinfo.maxX*expinfo.GridSize4 expinfo.maxY*expinfo.GridSize2];

%% Y position Outgrid
expinfo.OutGridY = expinfo.maxY*0.85;

%% Outgrid Range from central Point

expinfo.RangeFromCentral = 20;

%% Fonts
expinfo.Fonts.textFont  = expinfo.Fonts.sansSerifFont;

%% Specify Instruction folder
expinfo.InstFolder      = 'Instructions/';
expinfo.InstExtension   = '.JPG';
expinfo.DataFolder      = 'DataFiles/';

%% datafiles and messages
pracFile = 'prac.txt'; % extension for the practice trial data
expFile  = 'exp.txt';  % extension fot the expreimental trial data

% Adjusting the file-names to a different name for each subject
expinfo.pracFile = [expinfo.DataFolder,expinfo.taskName,'APM_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),pracFile];
expinfo.expFile  = [expinfo.DataFolder,expinfo.taskName,'APM_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),expFile];

end 
%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uni-heidelberg.de
