%This function serves to welcome the participant by their name

function expinfo = HelloParticipant(expinfo)

    Anrede= 'Hallo ';
    
    Brain=[expinfo.InstFolder 'Brain.jpg'];
    ima=imread(Brain); % Read in the File
    InstScreen = Screen('MakeTexture',expinfo.window,ima);
    Screen('DrawTexture', expinfo.window, InstScreen, [], [30 30 318 192]); % draw the scene

    Brain=[expinfo.InstFolder 'Next.jpg'];
    ima=imread(Brain); % Read in the File
    InstScreen = Screen('MakeTexture',expinfo.window,ima);
    Screen('DrawTexture', expinfo.window, InstScreen, [], [1072 890 1288 1012]); % draw the scene

    
    line1= [Anrede  expinfo.subjectName ','];
    line2= '\n\n\n Willkommen zurück!';
    line3= '\n\n\n\n Nun werden Sie nochmal zwei Aufgaben bearbeiten.' ;
    line5 = '\n\n Diese Aufgaben werden nochmal erklärt und geübt.';
    line6 = '\n\n\n Drücken Sie die "L"-Taste um fortzufahren.';
    Screen('TextSize', expinfo.window, 20)
    Screen('TextFont', expinfo.window, 'Arial' )
    DrawFormattedText(expinfo.window, [line1 line2 line3 line5 line6],'center', expinfo.YPixels*0.25)
    Screen('Flip', expinfo.window)
    KbStrokeWait;

end
