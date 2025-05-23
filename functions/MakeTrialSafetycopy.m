  n = 1;
    for i= 1:size(SampleMatrix,1)
        if SampleMatrix(i,5)>0
            SampleMatrix(i,6) = 1;
        else
            SampleMatrix(i,6) = 0;
        end
    end
    % Nun wird die Sample Matrix in eine TrialMatrix übertragen, sodass, die
    % Trials randomisiert präsentiert werden


    if isPractice == 1
        TrialMatrix= SampleMatrix;
    else
        trialsSelected = 0;
        TrialMatrix = zeros(size(SampleMatrix,1),size(SampleMatrix,2));
        for trial = 1:size(SampleMatrix,1)
            test = 0;
            iter = 0;%falls noch bedingungen eingebaut werden sollen
            while test == 0
                RandRow = randsample(size(SampleMatrix,1),1);
                if expinfo.Block~=1
                    if trial == 1
                        if SampleMatrix(RandRow,6) >0
                            test =1;
                        end
                    elseif trial <= 3
                        test = 1;
                    elseif trial == expinfo.nExpTrials
                       test =1;
                    elseif trial > 3
                        if SampleMatrix(RandRow,6) ~= TrialMatrix(trial-1,6)  || SampleMatrix(RandRow,6) ~= TrialMatrix(trial -2,6) || SampleMatrix(RandRow,6) ~= TrialMatrix(trial -3,6)
                            test =1;
                        end
                    end
                else
                    test =1;
                end
                iter = iter + 1;
                if iter > expinfo.maxIter
                    break
                end
            end
            if test == 1
                TrialMatrix(trial,:) = SampleMatrix(RandRow,:);
                SampleMatrix(RandRow,:) = [];
                trialsSelected = trialsSelected + 1;
            else
                break
            end
        end
    end