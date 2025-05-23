% This function displays one trial of a Simon Task

function Trial = DisplayTrial(expinfo, Trial, expTrial, isPractice)
%% Trial Procedure
Trial(expTrial).time_ITI = ScreenGrid(expinfo,[],[]);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_ITI,Trial(expTrial).ITI);

% io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SetSize(Trial(expTrial).MemSetSize));
% WaitSecs(0.05);
% io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port

% Presentation of Memset
for e = 1: Trial(expTrial).MemSetSize
    ScreenGrid2(expinfo)
    Trial(expTrial).time_memset = TextCenteredOnPos(expinfo,num2str(Trial(expTrial).MemSet(e)),expinfo.XPos(Trial(expTrial).MemPos(e)),expinfo.YPos(Trial(expTrial).MemPos(e)), expinfo.Colors.black , next_flip);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_memset,Trial(expTrial).StimDuration(e));
    WaitSecs(0.05);
%   io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port
    clearRect(expinfo)
    Trial(expTrial).time_ISI = ScreenGrid(expinfo, next_flip, []); %show empty Screen
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_ISI,Trial(expTrial).ISI(e));
end


%Presentation of Updating Stimuli
if expinfo.Block ==2 %simmple pdating
%     if Trial(expTrial).UpdatingSteps == 0
%         io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.Updatings(1));
%         WaitSecs(0.1);
%         io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
%     else
%         io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.Updatings(Trial(expTrial).UpdatingSteps+1));
%         WaitSecs(0.1);
%         io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
%     end
    for e = 1: Trial(expTrial).UpdatingSteps
        ScreenGrid2(expinfo)
        Trial(expTrial).time_update = TextCenteredOnPos(expinfo,num2str(Trial(expTrial).Update(e)),expinfo.XPos(Trial(expTrial).UpdatePos(e)),expinfo.YPos(Trial(expTrial).UpdatePos(e)), expinfo.Colors.black , next_flip);
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_update,Trial(expTrial).UpdateDuration(e));
%       WaitSecs(0.05);
%       io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port
        clearRect(expinfo)
        Trial(expTrial).time_ISI_Update = ScreenGrid(expinfo, next_flip); %show empty Screen
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_ISI_Update,Trial(expTrial).ISI_Update(e)); 
    end
elseif expinfo.Block ==3 %arithmetic Updating
%         if Trial(expTrial).UpdatingSteps == 0
%         io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.Updatings(1));
%         WaitSecs(0.1);
%         io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
%     else
%         io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.Updatings(Trial(expTrial).UpdatingSteps+1));
%         WaitSecs(0.1);
%         io64(expinfo.ioObj, expinfo.PortAddress,0);% Stop Writing to Output Port
%     end
    for e = 1: Trial(expTrial).UpdatingSteps
        ScreenGrid2(expinfo)
        if Trial(expTrial).Operation(e)==1 %Addition
            Trial(expTrial).time_update = TextCenteredOnPos(expinfo,['+' num2str(Trial(expTrial).Update(e))],expinfo.XPos(Trial(expTrial).UpdatePos(e)),expinfo.YPos(Trial(expTrial).UpdatePos(e)), expinfo.Colors.black, next_flip);
        else %Subtraktion
            Trial(expTrial).time_update = TextCenteredOnPos(expinfo,['-' num2str(Trial(expTrial).Update(e))],expinfo.XPos(Trial(expTrial).UpdatePos(e)),expinfo.YPos(Trial(expTrial).UpdatePos(e)), expinfo.Colors.black, next_flip);
        end
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_update,Trial(expTrial).UpdateDuration(e));
%         WaitSecs(0.05);
%         io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port
        clearRect(expinfo)
        Trial(expTrial).time_ISI_Update = ScreenGrid(expinfo, next_flip); %show empty Screen
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_ISI_Update,Trial(expTrial).ISI_Update(e)); 
   end
end

% Presentation of Cue
% WaitSecs(expinfo.MinISIduration)%include for smooth change of scene
Trial(expTrial).time_call = TextCenteredOnPos(expinfo,'Abfrage!',expinfo.xCenter,expinfo.yCenter, expinfo.Colors.black, next_flip);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_call,expinfo.CueDuration);

%SetMouse(expinfo.xCenter, expinfo.yCenter, expinfo.window);
%Pobe Stimu

for f = 1: Trial(expTrial).MemSetSize
    ScreenGrid2(expinfo);
    RespGrid(expinfo, Trial, expTrial);
    Trial(expTrial).time_cue = TextCenteredOnPos(expinfo,'?', expinfo.XPos(Trial(expTrial).ProbePos(f)),expinfo.YPos(Trial(expTrial).ProbePos(f)),expinfo.Colors.black , next_flip);
%     WaitSecs(0.01);
%     io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port  
    [Trial, ACC, givenAnswer, response] = getresponseOutGr(expinfo, Trial, expTrial, f);
    Trial(expTrial).time_resp = RespFeedback(expinfo, Trial, expTrial, givenAnswer,f,response, []);
%     io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port  
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_resp,expinfo.RespFeedback);
   if isPractice == 1 % Show feedback in practice trials
        clearScreen(expinfo);
        if ACC == 1
           Trial(expTrial).time_feed = TextCenteredOnPos(expinfo,'Richtig',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green, next_flip);
        elseif ACC == 0
            Trial(expTrial).time_feed= TextCenteredOnPos(expinfo,'Falsch',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red, next_flip);
        elseif ACC == -2
            Trial(expTrial).time_feed= TextCenteredOnPos(expinfo,'zu langsam',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.black, next_flip);
        elseif ACC == -3
           Trial(expTrial).time_feed= TextCenteredOnPos(expinfo,'unerlaubte Taste',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red, next_flip);
        end
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_feed,expinfo.FeedbackDuration);
   end
end

clearScreen(expinfo,next_flip)

SaveTable = orderfields(Trial);
Data = struct2table(SaveTable,'AsArray',true);

if isPractice == 1
    if  expinfo.Block ==1
        writetable(Data,[expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Prac_Block_1','.csv']);
    elseif expinfo.Block ==2
        writetable(Data,[expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Prac_Block_2','.csv']);
    elseif expinfo.Block ==3
        writetable(Data,[expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Prac_Block_3','.csv']);
    end
else
    if  expinfo.Block ==1
        writetable(Data,[expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Exp_Block_1','.csv']);
    elseif expinfo.Block ==2
        writetable(Data,[expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Exp_Block_2','.csv']);
    elseif expinfo.Block ==3
        writetable(Data,[expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Exp_Block_3','.csv']);
    end
end
%
% % Clear Screen for ITI
% WaitSecs(Trial(expTrial).ITI);
%
%
% % %% Recording Data

% %
% if isPractice == 1
%     if  expinfo.Block ==1
%          fid = fopen([expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Prac_Block_1_test','.csv'], 'a');
%     elseif expinfo.Block ==2
%          fid = fopen([expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Prac_Block_2_test','.csv'], 'a');
%     elseif expinfo.Block ==3
%          fid = fopen([expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Prac_Block_3_test','.csv'], 'a');
%     end
% else
%     if  expinfo.Block ==1
%         fid = fopen([expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Exp_Block_1_test','.csv'], 'a');
%     elseif expinfo.Block ==2
%          fid = fopen([expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Exp_Block_2_test','.csv'], 'a');
%     elseif expinfo.Block ==3
%          fid = fopen([expinfo.DataFolder,'Subject_',num2str(expinfo.subject),'Exp_Block_3_test','.csv'], 'a');
%     end
% end
% 
% if expinfo.Block ==1
%  fprintf (fid, '%3d %3d %1d %1d %18s ', expinfo.subject, Trial(expTrial).TrialNum, Trial(expTrial).Block, isPractice ,Trial(expTrial).TaskDescription);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d %1d %1d', Trial(expTrial).MemSetSize, Trial(expTrial).UpdatingType, Trial(expTrial).UpdatingSteps, Trial(expTrial).MemSet1, Trial(expTrial).MemSet2, Trial(expTrial).MemSet3, Trial(expTrial).MemSet4);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).MemPos1, Trial(expTrial).MemPos2, Trial(expTrial).MemPos3, Trial(expTrial).MemPos4);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).UpdateTyp1, Trial(expTrial).UpdateTyp2, Trial(expTrial).UpdateTyp3, Trial(expTrial).UpdateTyp4, Trial(expTrial).UpdateTyp5);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).Operation1, Trial(expTrial).UpdateTyp2, Trial(expTrial).UpdateTyp3, Trial(expTrial).UpdateTyp4, Trial(expTrial).UpdateTyp5);
% 
%  fprintf (fid, '%1.3f %1.3f %1.3f %1.3f %1.3f ', Trial(expTrial).RT(1), Trial(expTrial).RT(2), Trial(expTrial).RT(3), Trial(expTrial).RT(4), Trial(expTrial).RT(5));
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).ACC(1), Trial(expTrial).ACC(2), Trial(expTrial).ACC(3), Trial(expTrial).ACC(4), Trial(expTrial).ACC(5));
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).response(1), Trial(expTrial).response(2), Trial(expTrial).response(3), Trial(expTrial).response(4), Trial(expTrial).response(5));
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).Answer(1), Trial(expTrial).Answer(2), Trial(expTrial).Answer(3), Trial(expTrial).Answer(4), Trial(expTrial).Answer(5));
% 
% if expinfo.Block ==2    
%  fprintf (fid, '%3d %3d %1d %1d ', expinfo.subject, Trial(expTrial).TrialNum, Trial(expTrial).Block, isPractice);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d %1d %1d', Trial(expTrial).MemSetSize, Trial(expTrial).UpdatingType, Trial(expTrial).UpdatingSteps, Trial(expTrial).MemSet1, Trial(expTrial).MemSet2, Trial(expTrial).MemSet3, Trial(expTrial).MemSet4);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).MemPos1, Trial(expTrial).MemPos2, Trial(expTrial).MemPos3, Trial(expTrial).MemPos4);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).UpdateTyp1, Trial(expTrial).UpdateTyp2, Trial(expTrial).UpdateTyp3, Trial(expTrial).UpdateTyp4, Trial(expTrial).UpdateTyp5);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).Operation1, Trial(expTrial).UpdateTyp2, Trial(expTrial).UpdateTyp3, Trial(expTrial).UpdateTyp4, Trial(expTrial).UpdateTyp5);
% 
%  fprintf (fid, '%1.3f %1.3f %1.3f %1.3f %1.3f ', Trial(expTrial).RT(1), Trial(expTrial).RT(2), Trial(expTrial).RT(3), Trial(expTrial).RT(4), Trial(expTrial).RT(5));
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).ACC(1), Trial(expTrial).ACC(2), Trial(expTrial).ACC(3), Trial(expTrial).ACC(4), Trial(expTrial).ACC(5));
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).response(1), Trial(expTrial).response(2), Trial(expTrial).response(3), Trial(expTrial).response(4), Trial(expTrial).response(5));
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).Answer(1), Trial(expTrial).Answer(2), Trial(expTrial).Answer(3), Trial(expTrial).Answer(4), Trial(expTrial).Answer(5));
% 
% if expinfo.Block ==3
% %  Print general information into data file
%  fprintf (fid, '%3d %3d %1d %1d %18s ', expinfo.subject, Trial(expTrial).TrialNum, Trial(expTrial).Block, isPractice ,Trial(expTrial).TaskDescription);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d %1d %1d', Trial(expTrial).MemSetSize, Trial(expTrial).UpdatingType, Trial(expTrial).UpdatingSteps, Trial(expTrial).MemSet1, Trial(expTrial).MemSet2, Trial(expTrial).MemSet3, Trial(expTrial).MemSet4);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).MemPos1, Trial(expTrial).MemPos2, Trial(expTrial).MemPos3, Trial(expTrial).MemPos4);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).UpdateTyp1, Trial(expTrial).UpdateTyp2, Trial(expTrial).UpdateTyp3, Trial(expTrial).UpdateTyp4, Trial(expTrial).UpdateTyp5);
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).Operation1, Trial(expTrial).UpdateTyp2, Trial(expTrial).UpdateTyp3, Trial(expTrial).UpdateTyp4, Trial(expTrial).UpdateTyp5);
% 
%  fprintf (fid, '%1.3f %1.3f %1.3f %1.3f %1.3f ', Trial(expTrial).RT(1), Trial(expTrial).RT(2), Trial(expTrial).RT(3), Trial(expTrial).RT(4), Trial(expTrial).RT(5));
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).ACC(1), Trial(expTrial).ACC(2), Trial(expTrial).ACC(3), Trial(expTrial).ACC(4), Trial(expTrial).ACC(5));
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).response(1), Trial(expTrial).response(2), Trial(expTrial).response(3), Trial(expTrial).response(4), Trial(expTrial).response(5));
%  fprintf (fid, '%1d %1d %1d %1d %1d %1d ', Trial(expTrial).Answer(1), Trial(expTrial).Answer(2), Trial(expTrial).Answer(3), Trial(expTrial).Answer(4), Trial(expTrial).Answer(5));
% end
% %  %Print new Line after each Trial
%  fprintf (fid, '\n');
%  fclose (fid);

% Flip again after ITI is over


end

%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uni-heidelberg.de