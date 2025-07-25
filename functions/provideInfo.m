% This functions opens a dialoge box requiring the input of some
% information and sets default values if some variables are not entered

function [expinfo] = provideInfo(TaskName,vars)

expinfo.taskName = TaskName;

%% specfiy input prompts
% Specfiy all possible prompts
prompt_subID = 'Enter subject ID (integer numbers):';
prompt_sesID = 'Enter session number:';
prompt_testRun = 'Run experiment in test mode (0 = no, 1 = yes):';
prompt_InstLanguage = 'Select language for instructions:';
prompt_practice = 'Run practice trials (1 = yes, 0 = no):';
prompt_name = 'Enter Participant name:';

% Usually demographic data should be assessed after the experiment, as it
% might cause effects on performance
prompt_age = 'Enter subject age (in years):';
prompt_gender = 'Enter subject gender (in words):';
prompt_sex = 'Enter subject sex (m/w):';

% Specify which prompts to use
all_vars = {'sub','ses','test','lang','prac','age','gender','sex','name'};
if strcmp(vars,'all')
    use = true(size(all_vars));
else
    use = ismember(all_vars,vars);
end
pos_use = find(use);

%% show input box
prompt_all = {prompt_subID;prompt_sesID;prompt_testRun;prompt_InstLanguage; ...
    prompt_practice;prompt_age;prompt_gender;prompt_sex;prompt_name};
prompt_select = prompt_all(use);
prompt_answer = inputdlg(prompt_select,expinfo.taskName);

if isempty(prompt_answer)
    error('No input given. Please restart and enter information.')
end

%% save entered data or default values
if use(1) && ~isempty(prompt_answer{pos_use == 1})
    expinfo.subject = str2double(prompt_answer{pos_use == 1});
else % default is: sub ID 999
    expinfo.subject = 999;
end

if use(2) && ~isempty(prompt_answer{pos_use == 2})
    expinfo.session = str2double(prompt_answer{pos_use == 2});
else % default is: session number 1
    expinfo.session = 1;
end

if use(3) && ~isempty(prompt_answer{pos_use == 3})
    expinfo.testExp = logical(str2double(prompt_answer{pos_use == 3}));
else % default is: do not start in test mode
    expinfo.testExp = false;
end

if use(4) && ~isempty(prompt_answer{pos_use == 4})
    expinfo.InstLanguage = str2double(prompt_answer{pos_use == 4});
else % default is: select first language
    expinfo.InstLanguage = 1;
end

if use(5) && ~isempty(prompt_answer{pos_use == 5})
    expinfo.showPractice = logical(str2double(prompt_answer{pos_use == 5}));
else % default is: NaN
    expinfo.showPractice = true;
end

if use(6) && ~isempty(prompt_answer{pos_use == 6})
    expinfo.subjectAge = str2double(prompt_answer{pos_use == 6});
else % default is: NaN
    expinfo.subjectAge = NaN;
end

if use(7) && ~isempty(prompt_answer{pos_use == 7})
    expinfo.subjectGender = str2double(prompt_answer{pos_use == 7});
else
    expinfo.subjectGender = '';
end

if use(8) && ~isempty(prompt_answer{pos_use == 8})
    expinfo.subjectSex = prompt_answer{pos_use == 8};
else
    expinfo.subjectSex = '';
end

if use(9) && ~isempty(prompt_answer{pos_use == 9})
    expinfo.subjectName = prompt_answer{pos_use == 9};
else
    expinfo.subjectName = '';
end

end

