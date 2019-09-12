function [x, y] =crawler_bias(nsteps,bias_value);
x=0;
y=0;
for i=1:nsteps;
    bias_rand=rand(1);
    if bias_rand <= bias_value;
        if x ==y && x < 250 && y < 250;
            x=x+1;
        elseif x < y && y < 250;
            x= x+1;
        elseif y < x && x < 250;
            y=y+1;
        elseif y == 250 && x < y ;
            x=x+1;
        elseif x == 250 && y < x ;
            y=y+1;
        elseif y == 250 && 250 < x;
            x=x-1;
        elseif x == 250 && 250 < y;
            y=y-1;
        else x==250 && y == 250;
            x=x;
            y=y;
    end
 end
 if bias_value < bias_rand;
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
end