% This function waits for a response and saves the
function [Trial, ACC, waitingTime] = getresponse(expinfo, Trial, expTrial,e)
% Start iternal MATLAB stop-clock

tic

% If timestamp for onset latency is not provided read out current system
% time. Attention this is just a work around and leads to biased reaction
% times
if ~exist('start','var')
    start = GetSecs;
end

% Initialise the response variables
Trial(expTrial).ACC = [0 0 0 0 ];
Trial(expTrial).RT = [0 0 0 0 ];
Trial(expTrial).response = [0 0 0 0];

% clear Buffer of Keyboard
while toc < 0.1; KbCheck;  end
% io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port

% read out keyboard until valid key is pressed or maximal allowed response
% time is reached
ScreenCleared = 0;
while toc < expinfo.MaxRT
  % Read keyboard
    [keyIsDown,timeSecs,keyCode] = KbCheck;
    
    if keyIsDown
        % get pressed Key
        pressedKey = KbName(keyCode);
                % Abbruch des Experiments
        if  strcmp(pressedKey,expinfo.AbortKey)
            closeexp(expinfo.window);
        end  
        % Testen ob die Taste zu den erlaubten Antwort-Tasten geh�rt
        
        if strlength(pressedKey) ~= 1
            response = -9;
            break
        elseif length(pressedKey) > 1
            response = -9;
            break
        else
            if any(pressedKey,expinfo.RespKeys)
                response = 1;
                if pressedKey == Trial(expTrial).CorResp(e)
                    if  Trial(expTrial).CorResp == 0
                        %io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_0);
                    elseif  Trial(expTrial).CorResp == 1
                        %io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_1);
                    elseif Trial(expTrial).CorResp == 2
                        %io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_2);
                    elseif Trial(expTrial).CorResp == 3
                        %io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_3);
                    elseif Trial(expTrial).CorResp == 4
                        %io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_4);
                    elseif Trial(expTrial).CorResp == 5
                        %io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_5);
                    elseif Trial(expTrial).CorResp == 6
                        %io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_6);
                    elseif Trial(expTrial).CorResp == 7
                        %io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_7);
                    elseif Trial(expTrial).CorResp == 8
                        %io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_8);
                    elseif Trial(expTrial).CorResp == 9
                        %io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_9);
                    end
                end
                   
                end
                break; % Dann soll die Loop abgebrochen werden
            end            
    else
        response = 0;
    end 
end

Trial(expTrial).keyPressed = timeSecs;

if response == 1 % Wenn eine erlaubte Taste gedr�ckt wurde
    Trial(expTrial).RT(f) = timeSecs - start; % Berechnung der Reaktionszeit
   % Test wether the correct response was given
    if pressedKey==Trial(expTrial).CorResp(e)
        ACC = 1;
        Trial(expTrial).ACC(f)=1;
    else
        ACC = 0;
        Trial(expTrial).ACC(f)=0;
    end
    
    Trial(expTrial).response(f) = pressedKey;
elseif  response == 0  % Wenn keine erlaubte Antwort gegeben wurde -> Miss
    Trial(expTrial).RT(e) = expinfo.MaxRT;
    ACC = -2;
    Trial(expTrial).ACC(e)=-2;
    Trial(expTrial).response(e) = -2;
    %    io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.Miss);
else % Wenn keine erlaubte Taste gegeben wurde
    Trial(expTrial).RT(e) = expinfo.MaxRT;
    ACC = -9;
    Trial(expTrial).ACC(e)=-2;
    Trial(expTrial).response = -9;
    %io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.IncorrResp);
end


    if Trial(expTrial).RT(e) < expinfo.ProbeDuration
        waitingTime = (expinfo.ProbeDuration - RT)+0.5;
    else
        waitingTime = 0.5;
    end


while KbCheck; end % clear buffer
FlushEvents('keyDown');

%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uni-heidelberg.de