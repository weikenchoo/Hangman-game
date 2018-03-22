% Assignment 2 Question 2
% Choo Wei Ken
% 20011881
% This is a word guessing game.
% This is a two player game.Player 1 have to enter a word without Player 2 looking.
% Different difficulty will have different length of words , and have different number of guesses.
clc;
clear all;
% Initialise the loop condition to start running
runGame=1;

while(runGame)
    % Let user choose what to do next
    choice = menu('Welcome to the Word Guessing Game!','Start Game','Instructions','High Score','End game');
    
    switch(choice)
        case 1
            % difficulty function allows user to choose difficulty
            lvl = difficulty();
            % wordGuessing function allows the user to play the game
            wordGuessing(lvl);
            % Gives user a chance to view score directly after finishing
            % playing
            response = input('Do you want to view score? (1. YES 2. NO):');
            if response == 1
                % viewScore function lets user check the scoreBoard
                viewScore();
            else
                % returns user to the menu if user does not want to view
                % score
            end
            
        case 2
            % shows instructions to user in a message box
            h = msgbox({'This is the Word Guessing Game',
                'This is a two player game. ',
                'Player 1 have to enter a word without Player 2 looking. ',
                'Then Player 2 have to guess the word by entering alphabets.',
                'In Easy mode, Player 1 can only enter a word with a maximum of 3 alphabets, and Player 2 has 10 attempts to guess the word.',
                'In Intermediate mode, Player 1 can only enter a word with a maximum of 5 alphabets, Player 2 has  attempts to guess the word',
                'In Hard mode, Player 1 can enter any word, Player 2 has 5 attempts to guess the word.'});
            uiwait(h);
        case 3
            % viewScore function lets user check the scoreBoard 
            viewScore();
           
        case 4
            disp('Thank you for playing !');
            close all;
            break;
    end
end
