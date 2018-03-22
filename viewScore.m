function viewScore()


response = menu('View score for','EASY','INTERMEDIATE','HARD');
switch (response)
                
    case 1
        load ('easyScore.mat','scoreBoard');
        disp('Easy Mode Scoreboard');
        disp(scoreBoard);
                
    case 2
        load ('mediumScore.mat','scoreBoard');
        disp('Intermediate Mode Scoreboard');
        disp(scoreBoard);
                
    case 3
        load('hardScore.mat','scoreBoard');
        disp('Hard Mode Scoreboard');
        disp(scoreBoard);
end
end