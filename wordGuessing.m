function wordGuessing(lvl)

% Allow user to enter name to be recorded into the score board.
% Name of user is converted to a string 
playerName = input('Enter guesser''s name:','s');

% make sure a name must be entered
while isempty(playerName)==1
    playerName = input('Please enter guesser''s name:','s');
end


clc;
disp('%%%%%%%%%%%%%%%%%')
disp('Hangman')
disp('%%%%%%%%%%%%%%%%%')


% initialise playing conditions 
if lvl == 1
    alpAllowed = 3;
    guessNum=11;
elseif lvl==2
    alpAllowed  = 5;
    guessNum=8;
elseif lvl==3 
    alpAllowed = 20;
    guessNum=6;
end

fprintf('Sorry %s , you must look away for this part !\n',playerName);
fprintf('Enter a word with a maximum number of %d alphabets.\n',alpAllowed);
% prompts user to enter a word
chosenWord=upper(input('Enter a word:','s'));
% Make sure word entered meets the playing conditions
while all((isletter(chosenWord)))~=1 || length(chosenWord)> alpAllowed || isempty(chosenWord) == 1
    chosenWord=upper(input('Enter a word within the range of alphabets allowed and with no integers :','s'));
end
%prompts user to enter hint
hint = input('Enter a hint or definition of the word:','s');
%make sure a hint is entered
while isempty(hint)==1
    hint = input('Please enter a hint or definition of the word:','s');
end

clc;

% User starts with first attempt
guessUse=1;
% empty array to store letters entered by the user
pickedLetters=[];
% covers the word with '-'
wordState(1:length(chosenWord))= '-';
fprintf('It''s your turn to shine now %s !\n',playerName);

% game runs when the number of attempts used are lower than the number of
% attempts given and when the word is not guessed correctly.
while guessUse<guessNum && isequal(chosenWord, wordState) == 0 
    fprintf('\n');
    fprintf('Hint for the word : %s \n',hint);
    fprintf('You have %d guesses left.\n',guessNum-guessUse);
    fprintf('This is your number %d attempt !\n',guessUse);
    chosenLetter=upper(input('Enter a alphabet:','s'));
    
    % make sure the word criteria is met
    while length(chosenLetter)>1 || all(isletter(chosenLetter))~=1
        fprintf('Please enter a single alphabet ONLY.\n')
        chosenLetter=upper(input('Enter a alphabet:','s'));
    end
    
    
    goodGuess= ismember(chosenWord,chosenLetter);
    % checks whether the letter is a member of the word given
    if ismember(chosenLetter,pickedLetters)~=1 & any(goodGuess) == true 
        % replace '-' with the letter
        wordState(goodGuess) = chosenLetter;
        disp(wordState);
        % letter added to list
        pickedLetters=[pickedLetters,chosenLetter];
        disp('You got one!');
    elseif isempty(chosenLetter) == true
        disp('Please enter an alphabet.');
        
    else 
        if ismember(chosenLetter,pickedLetters)==1
            disp('You already tried that.');
        else
            % letter added to list
            pickedLetters=[pickedLetters,chosenLetter];
            guessUse= guessUse+1;
            disp('Not this one, try again.');
        end
        disp(wordState);
        
    end
        
    
end

clc;
disp('GAME OVER')
playerScore = guessUse;
% saves score if player manages to guess the word
if isequal(chosenWord,wordState)
    fprintf('Congratulations %s ! Your score is %d !\n',char(playerName),guessUse);
    if lvl ==1 
        % calls function saveScore to save score 
        fileName = 'easyScore.mat';
        saveScore(fileName,playerName,playerScore);
        
    elseif lvl ==2
        % calls function saveScore to save score
        fileName = 'mediumScore.mat';
        saveScore(fileName,playerName,playerScore);
        
    elseif lvl ==3
        % calls function saveScore to save score
        fileName = 'hardScore.mat';
        saveScore(fileName,playerName,playerScore);
    end
else
    fprintf('Sorry you ran out of attempts.\nThe word is ');
    disp(chosenWord);
end



    
end
