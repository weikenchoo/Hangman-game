function lvl= difficulty()
diffLvl = menu('Choose your difficulty.','Easy','Intermediate','Hard');
switch (diffLvl)
    case 1
         lvl = 1;
    case 2
         lvl = 2;
    case 3
         lvl = 3;
end
end