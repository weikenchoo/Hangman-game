function  saveScore(fileName,playerName,playerScore)
% allow user to save player name and player score
% loads original file
load (fileName);

% appends player name to a list of name
Name = [Name;playerName];

% converts character array to cell array
Name = cellstr(Name);

%appends player score to a list of scores
Score = [Score;playerScore];

% check whether score is cell array , if not num2cell function is used to
% convert integers to cell array
if iscell(Score) == 0
        Score = num2cell(Score);
end

% Combines name list and score list to make scoreboard
scoreBoard = [Name,Score];

% sorts the table according to the score, the score are sorted in ascending
% order
scoreBoard = sortrows(scoreBoard,2);

% the scores are saved to MAT-file
save(fileName,'scoreBoard','Name','Score');
end