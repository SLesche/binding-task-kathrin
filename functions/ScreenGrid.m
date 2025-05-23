function timestamp_flip = ScreenGrid(expinfo, when, Marker, flip)

if ~exist('Marker','var') || isempty(Marker)
    Marker = 0;
end

if ~exist('flip','var') || isempty(flip)
    flip = 0;
end


% vertikale Linien von unten nach oben 
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


% Flip Screen
if ~exist('when','var')
    % Flip window immediately
    timestamp_flip = Screen('Flip',expinfo.window);
elseif isempty(when)
    % Flip window immediately
    timestamp_flip = Screen('Flip',expinfo.window);
else
    % Flip synced to timestamp entered
    timestamp_flip = Screen('Flip',expinfo.window,when);
end


end

% Screen('Flip', expinfo.window);
% Wait for a keystroke and then close the screen
% ListenChar(-1);
% KbStrokeWait;
% sca;
% ListenChar(); 

