%This function serves to welcome the participant by their name

function expinfo = HelloParticipant(expinfo)
%% Get correct name
if strcmp(expinfo.subjectSex, 'm')
    Anrede = 'Lieber Herr ';
elseif strcmp(expinfo.subjectSex, 'w')
    Anrede= 'Liebe Frau ';
else
    Anrede= 'Hallo ';
end
    
    Brain=[expinfo.InstFolder 'Brain.jpg'];
    ima=imread(Brain); % Read in the File
    InstScreen = Screen('MakeTexture',expinfo.window,ima);
    Screen('DrawTexture', expinfo.window, InstScreen, [], [30 30 318 192]); % draw the scene

    Brain=[expinfo.InstFolder 'Next.jpg'];
    ima=imread(Brain); % Read in the File
    InstScreen = Screen('MakeTexture',expinfo.window,ima);
    Screen('DrawTexture', expinfo.window, InstScreen, [], [1072 890 1288 1012]); % draw the scene

    
    line1= [Anrede  expinfo.subjectName ','];
    line2= '\n\n\n Willkommen zur�ck!';
    line3= '\n\n\n\n Nun werden Sie nochmal die drei Aufgaben bearbeiten,' ;
    line4= '\n\n die Sie bereits kennen gelernt haben.' ; 
    line5 = '\n\n  Zur Erinnerung werden die Aufgaben nochmal erkl�rt und ge�bt.';
    line6 = '\n\n\n Dr�cken Sie die "L"-Taste um fortzufahren.';
    Screen('TextSize', expinfo.window, 20)
    Screen('TextFont', expinfo.window, 'Arial' )
    DrawFormattedText(expinfo.window, [line1 line2 line3 line4 line5 line6],'center', expinfo.YPixels*0.25)
    Screen('Flip', expinfo.window)
    KbStrokeWait;

end
