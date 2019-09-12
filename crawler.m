
function [x, y] =crawler(nsteps);
x=0;
y=0;
for i=1:nsteps;
    randNum=rand(1);
    if randNum <0.25;
        x=x+1;
    elseif randNum < 0.50;
        x=x-1;
    elseif randNum < 0.75;
        y=y+1;
    else
        y=y-1;
    end
end
end