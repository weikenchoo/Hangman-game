function lvl= difficulty()
% allow user to choose difficulty
diffLvl = menu('Choose your difficulty.','Easy','Intermediate','Hard');

switch (diffLvl)
    case 1
        %assign level to user
         lvl = 1;
    case 2
        %assign level to user
         lvl = 2;
    case 3
        %assign level to user
         lvl = 3;
end
end