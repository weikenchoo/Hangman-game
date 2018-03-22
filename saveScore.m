function  saveScore(fileName,playerName,playerScore)
load (fileName);
Name = [Name;playerName];
    Name = cellstr(Name);
    Score = [Score;playerScore];
    if iscell(Score) == 0
        Score = num2cell(Score);
    end
    scoreBoard = [Name,Score];
    scoreBoard = sortrows(scoreBoard,2);
    save(fileName,'scoreBoard','Name','Score');
end