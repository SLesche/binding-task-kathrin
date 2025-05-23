function RespReac(expinfo, Trial, expTrial, givenAnswer)

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
  

%Box0 
%Links oben nach nach rechts oben 
%Links unten nach rechts unten 
%Links oben nach Links unten 
%Rechts oben nach rechts unten 
if givenAnswer=0
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_0(1), expinfo.RespYRange(1), expinfo.RespXRange_0(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_0(1), expinfo.RespYRange(2), expinfo.RespXRange_0(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_0(1), expinfo.RespYRange(1), expinfo.RespXRange_0(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_0(2), expinfo.RespYRange(1), expinfo.RespXRange_0(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer=1
%Box1
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_1(1), expinfo.RespYRange(1), expinfo.RespXRange_1(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_1(1), expinfo.RespYRange(2), expinfo.RespXRange_1(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_1(1), expinfo.RespYRange(1), expinfo.RespXRange_1(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_1(2), expinfo.RespYRange(1), expinfo.RespXRange_1(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer=2
%Box2
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_2(1), expinfo.RespYRange(1), expinfo.RespXRange_2(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_2(1), expinfo.RespYRange(2), expinfo.RespXRange_2(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_2(1), expinfo.RespYRange(1), expinfo.RespXRange_2(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_2(2), expinfo.RespYRange(1), expinfo.RespXRange_2(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer=3
%Box3
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_3(1), expinfo.RespYRange(1), expinfo.RespXRange_3(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_3(1), expinfo.RespYRange(2), expinfo.RespXRange_3(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_3(1), expinfo.RespYRange(1), expinfo.RespXRange_3(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_3(2), expinfo.RespYRange(1), expinfo.RespXRange_3(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer=4
%Box4
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_4(1), expinfo.RespYRange(1), expinfo.RespXRange_4(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_4(1), expinfo.RespYRange(2), expinfo.RespXRange_4(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_4(1), expinfo.RespYRange(1), expinfo.RespXRange_4(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_4(2), expinfo.RespYRange(1), expinfo.RespXRange_4(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer=5
%Box5
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_5(1), expinfo.RespYRange(1), expinfo.RespXRange_5(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_5(1), expinfo.RespYRange(2), expinfo.RespXRange_5(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_5(1), expinfo.RespYRange(1), expinfo.RespXRange_5(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_5(2), expinfo.RespYRange(1), expinfo.RespXRange_5(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer=6
%Box6
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_6(1), expinfo.RespYRange(1), expinfo.RespXRange_6(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_6(1), expinfo.RespYRange(2), expinfo.RespXRange_6(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_6(1), expinfo.RespYRange(1), expinfo.RespXRange_6(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_6(2), expinfo.RespYRange(1), expinfo.RespXRange_6(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer=7
%Box7
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_7(1), expinfo.RespYRange(1), expinfo.RespXRange_7(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_7(1), expinfo.RespYRange(2), expinfo.RespXRange_7(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_7(1), expinfo.RespYRange(1), expinfo.RespXRange_7(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_7(2), expinfo.RespYRange(1), expinfo.RespXRange_7(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer=8
%Box8
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_8(1), expinfo.RespYRange(1), expinfo.RespXRange_8(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_8(1), expinfo.RespYRange(2), expinfo.RespXRange_8(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_8(1), expinfo.RespYRange(1), expinfo.RespXRange_8(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_8(2), expinfo.RespYRange(1), expinfo.RespXRange_8(2), expinfo.RespYRange(2) ,2);

elseif givenAnswer=9
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_9(1), expinfo.RespYRange(1), expinfo.RespXRange_9(2), expinfo.RespYRange(1) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_9(1), expinfo.RespYRange(2), expinfo.RespXRange_9(2), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_9(1), expinfo.RespYRange(1), expinfo.RespXRange_9(1), expinfo.RespYRange(2) ,2);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RespXRange_9(2), expinfo.RespYRange(1), expinfo.RespXRange_9(2), expinfo.RespYRange(2) ,2);
end

    

%Screen('Flip',expinfo.window);

end

% Screen('Flip', expinfo.window);
% Wait for a keystroke and then close the screen
% ListenChar(-1);
% KbStrokeWait;
% sca;
% ListenChar(); 

