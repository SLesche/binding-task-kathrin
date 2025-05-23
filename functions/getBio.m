
function expinfo = getBio(expinfo, TaskName)
 Options.CancelButton = 'off';
 Options.ApplyButton = 'off';
 Options.ButtonNames = {'Weiter'}; %<- default names, included here just for illustration

prompt = {};
formats = {};
name = 'Demografische Informationen';

prompt(1,:) = {'Bevor es weiter geht, benötigen wir noch einige Demografische Informationen.'};
formats(1,1).type = 'text';
formats(1,1).size = [-1 0];

prompt(2,:) = {'VP-Nummer'};
formats(2,1).type = 'edit';
formats(2,1).format = 'integer';
formats(2,1).labelloc = 'leftmiddle';
formats(2,1).margin = [10 20];
formats(2,1).size = [100 20];
formats(2,1).required = 'on';

prompt(3,:) = {'Bitte geben Sie Ihr Alter an.'};
formats(3,1).type = 'edit';
formats(3,1).format = 'integer';
formats(3,1).labelloc = 'leftmiddle';
formats(3,1).margin = [10 20];
formats(3,1).size = [100 20];
formats(3,1).required = 'on';


prompt(4,:) = {'Bitte geben Sie Ihr Geschlecht an.'};
formats(4,1).type = 'list';
formats(4,1).style = 'popupmenu';
formats(4,1).items = {'Bitte auswählen', 'weiblich', 'männlich', 'divers'};
formats(4,1).labelloc = 'leftmiddle';
formats(4,1).margin = [10 20];
formats(4,1).size = [300 30];
formats(4,1).required = 'on';


prompt(5,:) = {'Was ist Ihr höchster Schulabschluss?'};
formats(5,1).type = 'list';
formats(5,1).style = 'popupmenu';
formats(5,1).items = {'Bitte auswählen', 'Kein Schulabschluss', 'Haupt-(Volks-)schulabschluss', 'Realschul oder gleichwertiger Abschluss (Mittlere Reife)', 'FachAbitur', 'Abitur','Fachhochschulabschluss', 'Universitätsabschluss', 'Promotion'};
formats(5,1).labelloc = 'leftmiddle';
formats(5,1).margin = [10 20];
formats(5,1).size = [300 30];
formats(5,1).required = 'on';

prompt(6,:) = {'Studieren Sie aktuell?'};
formats(6,1).type = 'list';
formats(6,1).style = 'togglebutton';
formats(6,1).format = 'text';
formats(6,1).labelloc = 'leftmiddle';
formats(6,1).margin = [10 20];
formats(6,1).items = {'Ja';'Nein'};
formats(6,1).required = 'on';

prompt(7,:) = {'Falls Sie aktuell studieren, geben Sie bitte Ihren Studiengang an:'};
formats(7,1).type = 'edit';
formats(7,1).format = 'text';
formats(7,1).labelloc = 'leftmiddle';
formats(7,1).margin = [10 20];
formats(7,1).size = [300 20];

prompt(8,:) = {'Bitte geben Sie Ihren aktuellen Beschäftigungsstatus an.'};
formats(8,1).type = 'list';
formats(8,1).style = 'popupmenu';
formats(8,1).labelloc = 'leftmiddle';
formats(8,1).margin = [10 20];
formats(8,1).items = {'Bitte auswählen', 'Arbeitssuchend', 'Hausmann/frau', 'Schüler/in', 'Student/in', 'Auszubildende/r', 'Angestellt', 'Selbstständig', 'Elternzeit/ Mutterschutz', 'Rente', 'Freiwilligendienst'};
formats(8,1).size = [300 30];

prompt(9,:) = {'Ist Deutsch Ihre Mutterlsprache?'};
formats(9,1).type = 'list';
formats(9,1).style = 'togglebutton';
formats(9,1).format = 'text';
formats(9,1).labelloc = 'leftmiddle';
formats(9,1).margin = [10 20];
formats(9,1).items = {'Ja';'Nein'};

prompt(10,:) = {'Falls Deutsch nicht Ihre Mutterpsrache ist, geben Sie bitte Ihre Muttersprache an.'};
formats(10,1).type = 'edit';
formats(10,1).format = 'text';
formats(10,1).labelloc = 'leftmiddle';
formats(10,1).margin = [10 20];
formats(10,1).size = [300 20];

prompt(11,:) = {'Tragen Sie eine Sehhilfe?'};
formats(11,1).type = 'list';
formats(11,1).style = 'popupmenu';
formats(11,1).labelloc = 'leftmiddle';
formats(11,1).margin = [10 20];
formats(11,1).items = {'Bitte auswählen', 'Ja', 'Nein'};
formats(11,1).size = [100 30];

prompt(12,:) = {'Sind Sie Rechtsänder/in?'};
formats(12,1).type = 'list';
formats(12,1).style = 'togglebutton';
formats(12,1).format = 'text';
formats(12,1).labelloc = 'leftmiddle';
formats(12,1).margin = [10 20];
formats(12,1).items = {'Ja';'Nein'};
formats(12,1).required = 'on';


[answer] = inputsdlg(prompt, name, formats, [] , Options);

expinfo.Number = answer{2};
expinfo.Age = answer{3}; 
expinfo.Gender = answer{4}; 
expinfo.Education = answer{5};
expinfo.Study = answer{6};
expinfo.Study_Subject = answer{7};
expinfo.Occupation = answer{8};
expinfo.Mothertongue = answer{9};
expinfo.Mothertongue_other = answer{10};
expinfo.Glasses = answer{11};
expinfo.Hand = answer{12};

Demo.Number = answer{2};
Demo.Age = answer{3}; 
Demo.Gender = answer{4}; 
Demo.Education = answer{5};
Demo.Study = answer{6};
Demo.Study_Subject = answer{7};
Demo.Occupation = answer{8};
Demo.Mothertongue = answer{9};
Demo.Mothertongue_other = answer{10};
Demo.Glasses = answer{11};
Demo.Hand =answer{12};

Demo_Table = orderfields(Demo);
Demo_Data = struct2table(Demo_Table,'AsArray',true);

expinfo.DemDataFolder = 'C:/Users/exp/Desktop/Verhalten/DataFiles/Demografie/';
writetable(Demo_Data,[expinfo.DemDataFolder,'Subject_',num2str(expinfo.Number),'_Demo','.csv']);

end