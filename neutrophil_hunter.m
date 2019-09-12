function [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
x=0;
y=0;
q= 250;
r= 250;
for i=1:nsteps;
    randNum1=rand(1);
    if randNum1 <0.25;
        q=q+1;
    elseif randNum1 < 0.50;
        q=q-1;
    elseif randNum1 < 0.75;
        r=r+1;
    else
        r=r-1;
    end
        bias_rand=rand(1);
    if bias_rand <= bias_bact;
        if x < q-2 && x < y;
            x= x+1;
        elseif y < r-2 && y < x;
            y=y+1;
        elseif x > q+2 && x > y;
            x=x-1;
        elseif y > r+2 && y > x;
            y=y-1;
        elseif q-2 <= x <= q+2 && y < r-2;
            y=y+1;
        elseif r-2 <= y <= r+2 && x < q-2;
            x=x+1;
        else r-2 <= y <= r+2 && q-2 <= x <= q+2;
            x=x;
            y=y;
        end
    end
    if bias_bact < bias_rand;
        randNum2=rand(1);
        if randNum2 <0.25;
            x=x+1;
        elseif randNum2 < 0.50;
            x=x-1;
        elseif randNum2 < 0.75;
            y=y+1;
        else
            y=y-1;
        end
    end
end
end