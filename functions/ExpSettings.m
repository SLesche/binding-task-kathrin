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
%expinfo.ifi = Screen('GetFlipInterval', expinfo.window);
%% Specify Stimulus and Text properties (Size, Position, etc.)
expinfo.stimulussize = 40; % in Pixel bzw. Point


%% Initiate Input Output settings for Markers
% expinfo.ioObj = io64;
% expinfo.IOstatus = io64(expinfo.ioObj);
% expinfo.PortAddress = hex2dec('E010');
% io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port

%% Secify number of general instruction slides
expinfo.InstStopGenerally = 2;
expinfo.ExpStopPrac = 2;

%% Timing - fixed in all trials
expinfo.Fix_Duration = 2; % Dauer des Fixationskreuzes zu Beginn eines Trials
expinfo.Fixjitter = 0.1;

expinfo.MinISIduration = 1.5; % Minimale Dauer des Inter-Stimulus-Intervalls (ISI)
expinfo.ISIjitter = 0.1; % ISI Jitter = Intervall in dem das ISI variieren darf

expinfo.MaxRT = 6; 
expinfo.Stimjitter = 0.05;
expinfo.Probejitter = 0.1;
expinfo.MinITIduration = 1; % Minimale Dauer des Inter-Trial-Intervalls (ITI)
expinfo.ITIjitter =0.1; %ITI Jitter
expinfo.maxiter =1000;

expinfo.RespFeedback = 0.3;
expinfo.CueDuration = 0.5;
expinfo.StimDuration =0.2; 
expinfo.ProbeDuration =0.5; 
expinfo.FeedbackDuration = 0.8;
expinfo.waitingtime=0.2;

%% Specify Response Keys used in the experiment
expinfo.LeftKey = 'd';
expinfo.RightKey = 'l';
expinfo.AbortKey = 'q';
expinfo.StartKey = 'space';
expinfo.RespKeys =[1 2 3 4 5 6 7 8 9];
expinfo.ResponseMapping = [1 2 3 4 5 6 7 8 9];
expinfo.RespVektor=['0123456789'];
%% Defining trials to be conducted
% Specify how many trials should be conducted
expinfo.SetSize = [2:5];
expinfo.Stimuli = [0:9];
expinfo.maxsetsize = 5;

expinfo.SetSize_binding = [5:7];
expinfo.SetSize_updating = [4:6];
expinfo.UpdatingSteps= [0, 1, 2, max(expinfo.SetSize_updating) ];
expinfo.conditionInfo = 5;
expinfo.maxsetsize = 7;
expinfo.TaskOrders = 1;
% expinfo.TaskOrders = perms(1:6);
expinfo.blockorder = 1;
expinfo.nPracTrials_1=3;
expinfo.nPracTrials_2=7;
expinfo.numberBlocks = 3;
expinfo.nExpTrials_Binding=16;
expinfo.nExpTrials_Updating=40;


expinfo.Block =1;
expinfo.number_2_1 = 2;
expinfo.number_2_2 = 2;
expinfo.number_3_1 = 2;
expinfo.number_3_2 = 2;
expinfo.number_3_3 = 2;
expinfo.number_4_1 = 2;
expinfo.number_4_2 = 2;
expinfo.number_4_3 = 2;
expinfo.number_4_4 = 2;
expinfo.number_5_1 = 2;
expinfo.number_5_2 = 2;
expinfo.number_5_3 = 2;
expinfo.number_5_4 = 2;
expinfo.number_5_5 = 2;
expinfo.number_6_1 = 2;
expinfo.number_6_2 = 2;
expinfo.number_6_3 = 2;
expinfo.number_6_4 = 2;
expinfo.number_6_5 = 2;
expinfo.number_6_6 = 2;


%% Colors

expinfo.Colors.bgColor = [140 140 140]; % white
expinfo.Colors.green =  [0 178 30];
expinfo.Colors.red = [255 25 32];
expinfo.Colors.gray =  [140 140 140];
expinfo.Colors.black = [0 0 0];
expinfo.Colors.blue = [0 0 255];


%% Size of Grid
expinfo.GridSize1 = 0.25;
expinfo.GridSize2 = 0.41665;
expinfo.GridSize3 = 0.58325;
expinfo.bottomEdge = 100;
expinfo.GridSize = 45;
expinfo.respbox = 50;
expinfo.distance = 50;

%% Stimulus Positions in Grid

expinfo.XPos1 = [(expinfo.xCenter - expinfo.GridSize)];
expinfo.YPos1 =[(expinfo.yCenter + expinfo.GridSize)]; 
expinfo.XPos2 = [expinfo.xCenter];
expinfo.YPos2 = [(expinfo.yCenter + expinfo.GridSize)]; 
expinfo.XPos3 = [(expinfo.xCenter + expinfo.GridSize) ];
expinfo.YPos3 =  [(expinfo.yCenter + expinfo.GridSize)]; 
expinfo.XPos4 = [(expinfo.xCenter - expinfo.GridSize)];
expinfo.YPos4 = [ expinfo.yCenter]; 
expinfo.XPos5 = [expinfo.xCenter];
expinfo.YPos5 =[expinfo.yCenter]; 
expinfo.XPos6 = [(expinfo.xCenter + expinfo.GridSize)];
expinfo.YPos6 = [expinfo.yCenter]; 
expinfo.XPos7 = [(expinfo.xCenter - expinfo.GridSize) ];
expinfo.YPos7 =[(expinfo.yCenter - expinfo.GridSize)]; 
expinfo.XPos8 = [expinfo.xCenter ];
expinfo.YPos8 = [(expinfo.yCenter - expinfo.GridSize)]; 
expinfo.XPos9 = [(expinfo.xCenter + expinfo.GridSize)];
expinfo.YPos9 = [(expinfo.yCenter - expinfo.GridSize)]; 
expinfo.XPos = [expinfo.XPos1 expinfo.XPos2 expinfo.XPos3 expinfo.XPos4 expinfo.XPos5 expinfo.XPos6 expinfo.XPos7 expinfo.XPos8 expinfo.XPos9];
expinfo.YPos = [expinfo.YPos1 expinfo.YPos2 expinfo.YPos3 expinfo.YPos4 expinfo.YPos5 expinfo.YPos6 expinfo.YPos7 expinfo.YPos8 expinfo.YPos9];

%Response Box
expinfo.Resp0_X = expinfo.xCenter - 4.5*expinfo.distance-4.5*expinfo.respbox;
expinfo.Resp1_X = expinfo.xCenter -3.5*expinfo.distance-3.5*expinfo.respbox;
expinfo.Resp2_X = expinfo.xCenter -2.5*expinfo.distance-2.5*expinfo.respbox;
expinfo.Resp3_X = expinfo.xCenter -1.5*expinfo.distance-1.5*expinfo.respbox;
expinfo.Resp4_X = expinfo.xCenter -0.5*expinfo.distance-0.5*expinfo.respbox;
expinfo.Resp5_X = expinfo.xCenter +0.5*expinfo.distance+0.5*expinfo.respbox;
expinfo.Resp6_X = expinfo.xCenter +1.5*expinfo.distance+1.5*expinfo.respbox;
expinfo.Resp7_X = expinfo.xCenter +2.5*expinfo.distance+2.5*expinfo.respbox;
expinfo.Resp8_X = expinfo.xCenter +3.5*expinfo.distance+3.5*expinfo.respbox;
expinfo.Resp9_X = expinfo.xCenter +4.5*expinfo.distance+4.5*expinfo.respbox; 

expinfo.RespBox = [expinfo.Resp0_X  expinfo.Resp1_X expinfo.Resp2_X expinfo.Resp3_X expinfo.Resp4_X expinfo.Resp5_X expinfo.Resp6_X expinfo.Resp7_X expinfo.Resp8_X expinfo.Resp9_X];

%% Range Grids

expinfo.RespXRange_0 = [(expinfo.xCenter - 4.5*expinfo.distance -5*expinfo.respbox),(expinfo.xCenter - 4.5*expinfo.distance -4*expinfo.respbox)];
expinfo.RespXRange_1 = [(expinfo.xCenter - 3.5*expinfo.distance -4*expinfo.respbox),(expinfo.xCenter - 3.5*expinfo.distance -3*expinfo.respbox)];
expinfo.RespXRange_2 = [(expinfo.xCenter - 2.5*expinfo.distance -3*expinfo.respbox),(expinfo.xCenter - 2.5*expinfo.distance -2*expinfo.respbox)];
expinfo.RespXRange_3 = [(expinfo.xCenter - 1.5*expinfo.distance-2*expinfo.respbox),(expinfo.xCenter - 1.5*expinfo.distance-expinfo.respbox)];
expinfo.RespXRange_4 = [(expinfo.xCenter - 0.5*expinfo.distance -expinfo.respbox),(expinfo.xCenter - 0.5*expinfo.distance)];
expinfo.RespXRange_5 = [(expinfo.xCenter + 0.5*expinfo.distance),(expinfo.xCenter + 0.5*expinfo.distance +expinfo.respbox)];
expinfo.RespXRange_6 = [(expinfo.xCenter + 1.5*expinfo.distance +expinfo.respbox),(expinfo.xCenter + 1.5*expinfo.distance +2*expinfo.respbox)];
expinfo.RespXRange_7 = [(expinfo.xCenter + 2.5*expinfo.distance +2*expinfo.respbox),(expinfo.xCenter + 2.5*expinfo.distance +3*expinfo.respbox)];
expinfo.RespXRange_8 = [(expinfo.xCenter + 3.5*expinfo.distance +3*expinfo.respbox),(expinfo.xCenter + 3.5*expinfo.distance +4*expinfo.respbox)];
expinfo.RespXRange_9 = [(expinfo.xCenter + 4.5*expinfo.distance +4*expinfo.respbox),(expinfo.xCenter + 4.5*expinfo.distance +5*expinfo.respbox)];
expinfo.RespYRange = [expinfo.maxY - expinfo.bottomEdge-expinfo.respbox, expinfo.maxY - expinfo.bottomEdge];


%% Outgrid Range from central Point

expinfo.RangeFromCentral = 20;
%% Fonts
expinfo.Fonts.textFont  = expinfo.Fonts.sansSerifFont;
%% Specify Instruction folder
expinfo.InstFolder      = 'Instructions/';
expinfo.InstExtension   = '.JPG';
expinfo.DataFolder      = 'DataFiles/';

%% datafiles and messages
pracFile = 'prac.csv'; % extension for the practice trial data
expFile  = 'exp.csv';  % extension fot the expreimental trial data

% Adjusting the file-names to a different name for each subject
expinfo.pracFile = [expinfo.DataFolder,expinfo.taskName,'Bindating',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),pracFile];
expinfo.expFile  = [expinfo.DataFolder,expinfo.taskName,'Bindating',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),expFile];
expinfo.datafiles = [expinfo.DataFolder,expinfo.taskName,'Bindating',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),pracFile];





end 
%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uni-heidelberg.de
