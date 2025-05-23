function timestamp_flip = RespFeedback(expinfo, Trial, expTrial, givenAnswer,f, response, when)
if ~exist('Marker','var') || isempty(Marker)
    Marker = 0;
end

if ~exist('flip','var')
    flip = 0;
elseif isempty(flip)
    flip = 0;
end

if ~exist('angle','var')
    angle = 0;
elseif isempty(angle)
    angle = 0;
end

%Linien von unten nach oben 
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.xCenter-1.5*expinfo.GridSize, expinfo.yCenter - 1.5*expinfo.GridSize,expinfo.xCenter-1.5*expinfo.GridSize, expinfo.yCenter + 1.5*expinfo.GridSize ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.xCenter-0.5*expinfo.GridSize, expinfo.yCenter - 1.5*expinfo.GridSize, expinfo.xCenter-0.5*expinfo.GridSize,expinfo.yCenter + 1.5*expinfo.GridSize,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.xCenter+0.5*expinfo.GridSize, expinfo.yCenter - 1.5*expinfo.GridSize,  expinfo.xCenter+0.5*expinfo.GridSize, expinfo.yCenter + 1.5*expinfo.GridSize ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.xCenter+1.5*expinfo.GridSize, expinfo.yCenter - 1.5*expinfo.GridSize,  expinfo.xCenter+1.5*expinfo.GridSize, expinfo.yCenter + 1.5*expinfo.GridSize ,2);

% horizontale Linien von links nach rechts 
Screen('DrawLine', expinfo.window ,expinfo.Colors.black ,expinfo.xCenter-1.5*expinfo.GridSize, expinfo.yCenter - 1.5*expinfo.GridSize, expinfo.xCenter+1.5*expinfo.GridSize, expinfo.yCenter - 1.5*expinfo.GridSize ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.xCenter-1.5*expinfo.GridSize, expinfo.yCenter - 0.5*expinfo.GridSize, expinfo.xCenter+1.5*expinfo.GridSize,  expinfo.yCenter - 0.5*expinfo.GridSize ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.xCenter-1.5*expinfo.GridSize, expinfo.yCenter + 0.5*expinfo.GridSize, expinfo.xCenter+1.5*expinfo.GridSize,  expinfo.yCenter + 0.5*expinfo.GridSize ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black, expinfo.xCenter-1.5*expinfo.GridSize, expinfo.yCenter + 1.5*expinfo.GridSize, expinfo.xCenter+1.5*expinfo.GridSize, expinfo.yCenter + 1.5*expinfo.GridSize ,2);

%Screen('Flip',expinfo.window);
Screen('DrawText', expinfo.window ,'+',expinfo.xCenter-0.25*expinfo.GridSize ,expinfo.yCenter-0.5*expinfo.GridSize, expinfo.Colors.black);
TextCenteredOnPos1(expinfo,'?', expinfo.XPos(Trial(expTrial).ProbePos(f)),expinfo.YPos(Trial(expTrial).ProbePos(f)),expinfo.Colors.black )

%Box0 
%Links oben nach nach rechts oben 
%Links unten nach rechts unten 
%Links oben nach Links unten 
%Rechts oben nach rechts unten 
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_0(1), expinfo.RespYRange(1), expinfo.RespXRange_0(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_0(1), expinfo.RespYRange(2), expinfo.RespXRange_0(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_0(1), expinfo.RespYRange(1), expinfo.RespXRange_0(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_0(2), expinfo.RespYRange(1), expinfo.RespXRange_0(2), expinfo.RespYRange(2) ,2);

%Box1
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_1(1), expinfo.RespYRange(1), expinfo.RespXRange_1(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_1(1), expinfo.RespYRange(2), expinfo.RespXRange_1(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_1(1), expinfo.RespYRange(1), expinfo.RespXRange_1(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_1(2), expinfo.RespYRange(1), expinfo.RespXRange_1(2), expinfo.RespYRange(2) ,2);

%Box2
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_2(1), expinfo.RespYRange(1), expinfo.RespXRange_2(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_2(1), expinfo.RespYRange(2), expinfo.RespXRange_2(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_2(1), expinfo.RespYRange(1), expinfo.RespXRange_2(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_2(2), expinfo.RespYRange(1), expinfo.RespXRange_2(2), expinfo.RespYRange(2) ,2);

%Box3
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_3(1), expinfo.RespYRange(1), expinfo.RespXRange_3(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_3(1), expinfo.RespYRange(2), expinfo.RespXRange_3(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_3(1), expinfo.RespYRange(1), expinfo.RespXRange_3(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_3(2), expinfo.RespYRange(1), expinfo.RespXRange_3(2), expinfo.RespYRange(2) ,2);

%Box4
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_4(1), expinfo.RespYRange(1), expinfo.RespXRange_4(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_4(1), expinfo.RespYRange(2), expinfo.RespXRange_4(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_4(1), expinfo.RespYRange(1), expinfo.RespXRange_4(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_4(2), expinfo.RespYRange(1), expinfo.RespXRange_4(2), expinfo.RespYRange(2) ,2);

%Box5
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_5(1), expinfo.RespYRange(1), expinfo.RespXRange_5(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_5(1), expinfo.RespYRange(2), expinfo.RespXRange_5(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_5(1), expinfo.RespYRange(1), expinfo.RespXRange_5(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_5(2), expinfo.RespYRange(1), expinfo.RespXRange_5(2), expinfo.RespYRange(2) ,2);

%Box6
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_6(1), expinfo.RespYRange(1), expinfo.RespXRange_6(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_6(1), expinfo.RespYRange(2), expinfo.RespXRange_6(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_6(1), expinfo.RespYRange(1), expinfo.RespXRange_6(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_6(2), expinfo.RespYRange(1), expinfo.RespXRange_6(2), expinfo.RespYRange(2) ,2);

%Box7
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_7(1), expinfo.RespYRange(1), expinfo.RespXRange_7(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_7(1), expinfo.RespYRange(2), expinfo.RespXRange_7(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_7(1), expinfo.RespYRange(1), expinfo.RespXRange_7(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_7(2), expinfo.RespYRange(1), expinfo.RespXRange_7(2), expinfo.RespYRange(2) ,2);

%Box8
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_8(1), expinfo.RespYRange(1), expinfo.RespXRange_8(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_8(1), expinfo.RespYRange(2), expinfo.RespXRange_8(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_8(1), expinfo.RespYRange(1), expinfo.RespXRange_8(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_8(2), expinfo.RespYRange(1), expinfo.RespXRange_8(2), expinfo.RespYRange(2) ,2);

%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_9(1), expinfo.RespYRange(1), expinfo.RespXRange_9(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_9(1), expinfo.RespYRange(2), expinfo.RespXRange_9(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_9(1), expinfo.RespYRange(1), expinfo.RespXRange_9(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RespXRange_9(2), expinfo.RespYRange(1), expinfo.RespXRange_9(2), expinfo.RespYRange(2) ,2);

for g = 1: 10
  TextCenteredOnPosOutGr(expinfo, expinfo.RespVektor(g), expinfo.RespBox(g),expinfo.maxY - 0.5*expinfo.respbox - expinfo.bottomEdge, expTrial ,Trial, g ,expinfo.Colors.black);
end

%Box0 
%Links oben nach nach rechts oben 
%Links unten nach rechts unten 
%Links oben nach Links unten 
%Rechts oben nach rechts unten 
if response==1
if  givenAnswer == 0
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_0(1), expinfo.RespYRange(1), expinfo.RespXRange_0(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_0(1), expinfo.RespYRange(2), expinfo.RespXRange_0(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_0(1), expinfo.RespYRange(1), expinfo.RespXRange_0(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_0(2), expinfo.RespYRange(1), expinfo.RespXRange_0(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer == 1
%Box1
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_1(1), expinfo.RespYRange(1), expinfo.RespXRange_1(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_1(1), expinfo.RespYRange(2), expinfo.RespXRange_1(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_1(1), expinfo.RespYRange(1), expinfo.RespXRange_1(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_1(2), expinfo.RespYRange(1), expinfo.RespXRange_1(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer == 2
%Box2
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_2(1), expinfo.RespYRange(1), expinfo.RespXRange_2(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_2(1), expinfo.RespYRange(2), expinfo.RespXRange_2(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_2(1), expinfo.RespYRange(1), expinfo.RespXRange_2(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_2(2), expinfo.RespYRange(1), expinfo.RespXRange_2(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer == 3
%Box3
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_3(1), expinfo.RespYRange(1), expinfo.RespXRange_3(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_3(1), expinfo.RespYRange(2), expinfo.RespXRange_3(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_3(1), expinfo.RespYRange(1), expinfo.RespXRange_3(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_3(2), expinfo.RespYRange(1), expinfo.RespXRange_3(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer == 4
%Box4
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_4(1), expinfo.RespYRange(1), expinfo.RespXRange_4(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_4(1), expinfo.RespYRange(2), expinfo.RespXRange_4(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_4(1), expinfo.RespYRange(1), expinfo.RespXRange_4(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_4(2), expinfo.RespYRange(1), expinfo.RespXRange_4(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer == 5
%Box5
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_5(1), expinfo.RespYRange(1), expinfo.RespXRange_5(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_5(1), expinfo.RespYRange(2), expinfo.RespXRange_5(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_5(1), expinfo.RespYRange(1), expinfo.RespXRange_5(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_5(2), expinfo.RespYRange(1), expinfo.RespXRange_5(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer == 6
%Box6
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_6(1), expinfo.RespYRange(1), expinfo.RespXRange_6(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_6(1), expinfo.RespYRange(2), expinfo.RespXRange_6(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_6(1), expinfo.RespYRange(1), expinfo.RespXRange_6(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_6(2), expinfo.RespYRange(1), expinfo.RespXRange_6(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer == 7
%Box7
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_7(1), expinfo.RespYRange(1), expinfo.RespXRange_7(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_7(1), expinfo.RespYRange(2), expinfo.RespXRange_7(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_7(1), expinfo.RespYRange(1), expinfo.RespXRange_7(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_7(2), expinfo.RespYRange(1), expinfo.RespXRange_7(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer == 8
%Box8
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_8(1), expinfo.RespYRange(1), expinfo.RespXRange_8(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_8(1), expinfo.RespYRange(2), expinfo.RespXRange_8(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_8(1), expinfo.RespYRange(1), expinfo.RespXRange_8(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_8(2), expinfo.RespYRange(1), expinfo.RespXRange_8(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer == 9
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_9(1), expinfo.RespYRange(1), expinfo.RespXRange_9(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_9(1), expinfo.RespYRange(2), expinfo.RespXRange_9(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_9(1), expinfo.RespYRange(1), expinfo.RespXRange_9(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.blue , expinfo.RespXRange_9(2), expinfo.RespYRange(1), expinfo.RespXRange_9(2), expinfo.RespYRange(2) ,2);
end
end
Screen('DrawingFinished', expinfo.window);

if ~exist('when','var') || isempty(when)
    % Flip window immediately
    timestamp_flip = Screen('Flip',expinfo.window);
else
    % Flip synced to timestamp entered
    timestamp_flip = Screen('Flip',expinfo.window,when);
end
end

% 
% Wait for a keystroke and then close the screen
% ListenChar(-1);
% KbStrokeWait;
% sca;
% ListenChar(); 

