function viewScore()

%allow user to choose which score to view
response = menu('View score for','EASY','INTERMEDIATE','HARD');

switch (response)
                
    case 1
        % loads the scoreboard from the MAT-file and display it to the user
        load ('easyScore.mat','scoreBoard');
        disp('Easy Mode Scoreboard');
        disp(scoreBoard);
                
    case 2
        % loads the scoreboard from the MAT-file and display it to the user
        load ('mediumScore.mat','scoreBoard');
        disp('Intermediate Mode Scoreboard');
        disp(scoreBoard);
                
    case 3
        % loads the scoreboard from the MAT-file and display it to the user
        load('hardScore.mat','scoreBoard');
        disp('Hard Mode Scoreboard');
        disp(scoreBoard);
end
end