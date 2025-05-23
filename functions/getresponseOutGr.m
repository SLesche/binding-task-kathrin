% This function waits for a response and saves the

function [Trial, ACC, givenAnswer, response] = getresponseOutGr(expinfo, Trial, expTrial, f)
% Start iternal MATLAB stop-clock

 tic
% If timestamp for onset latency is not provided read out current system
% time. Attention this is just a work around and leads to biased reaction
% times


start = GetSecs;

waitingTime = 0;   

% Initialise the response variables
Trial(expTrial).ACC(f) = 0;
Trial(expTrial).response(f)  = 0;
Trial(expTrial).RT(f)  = 0;
Trial(expTrial).Answer(f)  = 0;
wrongkey = 0;

while toc < 0.1; KbCheck;  end
% read out keyboard until valid key is pressed or maximal allowed response
% time is reached

ShowCursor(0);
while toc < expinfo.MaxRT
    [cursorX, cursorY, RespButton] = GetMouse(expinfo.window); % Read Mouse
    [keyIsDown,time,keyCode] = KbCheck; % Read Keyboard for termination
    
    % Abbruch des Experiments
    if keyIsDown == 1
        pressedKey = KbName(keyCode);
         wrongkey=1;
        %         if strlength(pressedKey) ~= 1
        %             wrongkey = 1;
        %             break
        %         elseif length(pressedKey) > 1
        %             wrongkey = 1;
        %             break
        %         else
        if  strcmp(pressedKey,expinfo.AbortKey)
            closeexp(expinfo.window);
        end
    end
    
     if RespButton(1) == 1
       if      (cursorX >=  expinfo.RespXRange_0(1) && cursorX <=expinfo.RespXRange_0(2) && cursorY >= expinfo.RespYRange(1)  && cursorY <=  expinfo.RespYRange(2)) || ...
                (cursorX >=  expinfo.RespXRange_1(1) && cursorX <=expinfo.RespXRange_1(2) && cursorY >= expinfo.RespYRange(1)  && cursorY <=  expinfo.RespYRange(2))  || ...
                (cursorX >=  expinfo.RespXRange_2(1) && cursorX <=expinfo.RespXRange_2(2) && cursorY >= expinfo.RespYRange(1)  && cursorY <=  expinfo.RespYRange(2))  || ...
                (cursorX >=  expinfo.RespXRange_3(1) && cursorX <=expinfo.RespXRange_3(2) && cursorY >= expinfo.RespYRange(1)  && cursorY <=  expinfo.RespYRange(2))  || ...
                (cursorX >=  expinfo.RespXRange_4(1) && cursorX <=expinfo.RespXRange_4(2) && cursorY >= expinfo.RespYRange(1)  && cursorY <=  expinfo.RespYRange(2))  || ...
                (cursorX >=  expinfo.RespXRange_5(1) && cursorX <=expinfo.RespXRange_5(2) && cursorY >= expinfo.RespYRange(1)  && cursorY <=  expinfo.RespYRange(2))  || ...
                (cursorX >=  expinfo.RespXRange_6(1) && cursorX <=expinfo.RespXRange_6(2) && cursorY >= expinfo.RespYRange(1)  && cursorY <=  expinfo.RespYRange(2))  || ...
                (cursorX >=  expinfo.RespXRange_7(1) && cursorX <=expinfo.RespXRange_7(2) && cursorY >= expinfo.RespYRange(1)  && cursorY <=  expinfo.RespYRange(2))  || ...
                (cursorX >=  expinfo.RespXRange_8(1) && cursorX <=expinfo.RespXRange_8(2) && cursorY >= expinfo.RespYRange(1)  && cursorY <=  expinfo.RespYRange(2))  || ...
                (cursorX >=  expinfo.RespXRange_9(1) && cursorX <=expinfo.RespXRange_9(2) && cursorY >= expinfo.RespYRange(1)  && cursorY <=  expinfo.RespYRange(2))           
            
            answerX = cursorX;
            answerY = cursorY;
            timeSecs = GetSecs;
            response = 1;
            break; % Dann soll die Loop abgebrochen werden
        end
     else
         response = 0;
     end
end



if  RespButton(1) == 1 && response == 1% Wenn eine erlaubte Taste gedr�ckt wurde
    
    RT = timeSecs - start; % Berechnung der Reaktionszeit
    
    % Antwortbereiche codieren
    if  answerX >=    expinfo.RespXRange_0(1) && answerY >= expinfo.RespYRange(1) && answerX <= expinfo.RespXRange_0(2)  && answerY <= expinfo.RespYRange(2)
        givenAnswer = 0;
    elseif answerX >= expinfo.RespXRange_1(1) && answerY >= expinfo.RespYRange(1) && answerX <= expinfo.RespXRange_1(2)  && answerY <= expinfo.RespYRange(2)
        givenAnswer = 1;
    elseif answerX >= expinfo.RespXRange_2(1) && answerY >= expinfo.RespYRange(1) && answerX <= expinfo.RespXRange_2(2)  && answerY <= expinfo.RespYRange(2)
        givenAnswer = 2;
    elseif answerX >= expinfo.RespXRange_3(1)  && answerY >= expinfo.RespYRange(1) && answerX <= expinfo.RespXRange_3(2) && answerY <= expinfo.RespYRange(2)
        givenAnswer = 3;
    elseif answerX >= expinfo.RespXRange_4(1)  && answerY >= expinfo.RespYRange(1) && answerX <= expinfo.RespXRange_4(2) && answerY <= expinfo.RespYRange(2)
        givenAnswer = 4;
    elseif answerX >= expinfo.RespXRange_5(1) && answerY >= expinfo.RespYRange(1) && answerX <=   expinfo.RespXRange_5(2)  && answerY <= expinfo.RespYRange(2)
        givenAnswer = 5;
    elseif answerX >= expinfo.RespXRange_6(1) && answerY >= expinfo.RespYRange(1) && answerX <=   expinfo.RespXRange_6(2)  && answerY <= expinfo.RespYRange(2)
        givenAnswer = 6;
    elseif answerX >= expinfo.RespXRange_7(1) && answerY >= expinfo.RespYRange(1) &&  answerX <=  expinfo.RespXRange_7(2)  && answerY <= expinfo.RespYRange(2)
        givenAnswer = 7;
    elseif answerX >= expinfo.RespXRange_8(1) && answerY >= expinfo.RespYRange(1) && answerX <=   expinfo.RespXRange_8(2)  && answerY <= expinfo.RespYRange(2)
        givenAnswer = 8;
    elseif answerX >= expinfo.RespXRange_9(1) && answerY >= expinfo.RespYRange(1) &&  answerX <=  expinfo.RespXRange_9(2)  && answerY <= expinfo.RespYRange(2)
        givenAnswer = 9;
    end
    

    % Test wether the correct response was given
    if givenAnswer == Trial(expTrial).CorrResp(f)
        ACC = 1;
%         io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp);
    else
        ACC = 0;
%         io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.IncorrResp);
    end        
else  % Wenn keine erlaubte Antwort gegeben wurde -> Miss
    RT = expinfo.MaxRT;
    if wrongkey == 0
        ACC = -2;
        givenAnswer = 0;
%         io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.IncorrResp)
    else
        ACC = -3;
        givenAnswer = 0;
%         io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.IncorrResp)
    end
end

    Trial(expTrial).ACC(f) = ACC;
    Trial(expTrial).RT(f) = RT;
    Trial(expTrial).Answer(f) = givenAnswer;
    Trial(expTrial).response(f) = response;
%  
%     if RT < expinfo.MaxRT
%         waitingTime = (expinfo.MaxRT - RT)+0.2;
%     else
%         waitingTime = 0.2;
%     end

% while KbCheck; end % clear buffer
% HideCursor();
FlushEvents();
end


%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uni-heidelberg.de