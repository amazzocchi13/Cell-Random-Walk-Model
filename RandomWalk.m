%% Part 1. A, B, C
% Use crawler.m file to simulate random walks
% A) Find average ending location assuming the starting position was 0,0
% for 500, 1000, and 2000 steps
% B) Produce histograms of the ending sitances from the origin in x and y
% for each simulation condition
% C) Find mean squared displacement for 500, 1000, and 2000 steps

for j=1:500
    nsteps= 500;
    [x, y]= crawler (nsteps);
    store_x_500(j)= x(end);
    store_y_500(j)=y(end);
    j=j+1;
end
figure(1);
hist (store_x_500)
title('Histogram of 500 Runs of nsteps=500 in Ending Position X')
xlabel ('X End Position')
ylabel('Frequency')
figure(2);
hist(store_y_500)
title('Histogram of 500 Runs of nsteps=500 in Ending Position Y')
xlabel ('Y End Position')
ylabel('Frequency')
% Average x and y end point values when nsteps=500 is run 500 times:
Avg_x_500= mean (store_x_500)
Avg_y_500= mean (store_y_500)
% Finding MSD for nsteps=500:
dx_500= (mean(store_x_500.^2)/500)
dy_500= (mean (store_y_500.^2)/500)
for j=1:500
 nsteps= 1000;
 [x, y]= crawler (nsteps);
 store_x_1000(j)= x(end);
 store_y_1000(j)=y(end);
 j=j+1;
end
figure(3);
hist (store_x_1000)
title('Histogram of 500 Runs of nsteps=1000 in Ending Position X')
xlabel('X End Position')
ylabel('Frequency')
figure(4);
hist(store_y_1000)
title('Histogram of 500 Runs of nsteps=1000 in Ending Position Y')
xlabel('Y End Position')
ylabel ('Frequency')
% Average x and y end point values when nsteps=1000 is run 500 times:
Avg_x_1000= mean (store_x_1000)
Avg_y_1000= mean (store_y_1000)
% Finding MSD for nsteps=1000:
dx_1000= (mean(store_x_1000.^2)/500)
dy_1000= (mean (store_y_1000.^2)/500)
for j=1:500
nsteps= 2000;
 [x, y]= crawler (nsteps);
 store_x_2000(j)= x(end);
 store_y_2000(j)=y(end);
 j=j+1;
end
Page 11 of 17
figure(5);
hist (store_x_2000)
title('Histogram of 500 Runs of nsteps=2000 in Ending Position X')
xlabel ('X End Position')
ylabel ('Frequency')
figure(6);
hist(store_y_2000)
title('Histogram of 500 Runs of nsteps=2000 in Ending Position Y')
xlabel ('Y End Position')
ylabel('Frequency')
% Average x and y end point values when nsteps=2000 is run 500 times:
Avg_x_2000= mean (store_x_2000)
Avg_y_2000= mean (store_y_2000)
% Finding MSD for nsteps=2000:
dx_2000= (mean(store_x_2000.^2)/500)
dy_2000= (mean (store_y_2000.^2)/500)
%% Part 2.A
% Create crawler_bias.m that has bias variable, when the bias is 1.0 have
% it reach 250,250
% A) Run crawler_bias for 1000 steps with a bias of 0.1. Run this 500 times
% and find average ending location, produce histogram

for j=1:500;
    bias_value=0.1;
    nsteps=1000 ;
    [x,y]= crawler_bias_2 (nsteps,bias_value);
    store_x_1000_bias_01(j)= x(end);
    store_y_1000_bias_01(j)=y(end);
end
% Average x and y end point values when nsteps=1000 is run 500 times with
bias=0.1:
Avg_x_1000_bias_01= mean (store_x_1000_bias_01);
Avg_y_1000_bias_01= mean (store_y_1000_bias_01);
figure(7);
hist (store_x_1000_bias_01)
title('Histogram of 500 Runs of nsteps=1000 with Bias=0.1 in Ending Position X')
xlabel('X End Position')
ylabel('Frequency')
figure(8);
hist(store_y_1000_bias_01)
title('Histogram of 500 Runs of nsteps=1000 with Bias=0.1 in Ending Position Y')
xlabel('Y End Position')
ylabel('Frequency')
%% Part 2.B
% If the bias is 1.0 determine how many steps it would take to reach the
% target

maxiter=1000;
j=1;
for nsteps=1:maxiter;
    bias_value=1;
    [x,y]= crawler_bias (nsteps,bias_value);
    x_bias_1(j)=x;
    y_bias_1(j)=y;
    if x== 250 && y==250;
        break
    end
    j=j+1;
end
Steps_Required_Bias_1= length(x_bias_1)
figure (9);
plot(x_bias_1, y_bias_1)
title('X and Y Locations when Bias=1')
xlabel('X Position')
ylabel('Y Position')
%% Part 2.C
% C) If the bias is 0.5, determine how many step it takes to reach the
% target, run at least 500 simulations

maxiter= 2000;
j=1;
for j=1:500;
    for nsteps=1:maxiter;
    bias_value=0.5;
[x,y]= crawler_bias (nsteps,bias_value);
if x== 250 && y==250;
 store_steps(j)= nsteps;
 break
end
end
j=j+1;
end
% Average number of steps required to reach (250,250) when bias=0.5:
Avg_steps_bias_05= mean (store_steps)
figure(10);
hist(store_steps)
title('Histogram of the Number of Steps Required to Reach (250,250) with Bias 0.5 for 500 Runs')
xlabel('Number of Steps Taken to Reach (250,250)')
ylabel('Frequency')
%% Part 3.A
% Create a program called neutrofil_hunter with a bacteria at 250,250 with
% its own random walk. Consider the bacteria captured if the neutrophil
% comes within two positions (x or y) of the bacteria's current location.
% A) Run the neutrophil_hunter for 1000 steps with bias 0.1 500 times and
% find the average ending location of the neutrophil

j=1;
for j=1:500
    bias_bact=0.1
    nsteps=1000
    [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
    nx_1000_bias_01(j)= x(end);
    ny_1000_bias_01(j)=y(end);
end
% Average x and y end point values when nsteps=1000 is run 500 times with
bias=0.1 towards the bacteria:
Avg_nx_1000_bias_01= mean (nx_1000_bias_01)
Avg_ny_1000_bias_01= mean (ny_1000_bias_01)
figure (11);
hist (nx_1000_bias_01)
title('Histogram of 500 Runs of nsteps=1000 with Bias=0.1 in Ending Position X for the Neutrophil')
xlabel('X End Position')
ylabel('Frequency')
figure (12);
hist (nx_1000_bias_01)
title('Histogram of 500 Runs of nsteps=1000 with Bias=0.1 in Ending Position Y for the Neutrophil')
xlabel('Y End Position')
ylabel('Frequency')
%% Part 3.B
% B) Determine how many steps it would take to reach the bacteria if the
% bias is 1.0

maxiter=2000;
j=1;
for nsteps=1:maxiter;
    bias_bact=1;
    [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
    nx_bias_1(j)=x;
    ny_bias_1(j)=y;
    nq_bias_1(j)=q;
    nr_bias_1(j)=r;
    if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
        break
    end
    j=j+1;
end
Steps_Required_Bias_Bacteria= length(nx_bias_1)
figure (13);
plot(nx_bias_1, ny_bias_1,'k', nq_bias_1, nr_bias_1,'y' );
title ('Neutrophil and Bacteria Movement with Bias of 1');
legend ('Neutrophil','Bacteria');
xlabel ('Position in X');
ylabel ('Position in Y');
%% Part 3. C
% C) Create a plot that shows how many steps it takes for the neutrophil to
% capture the bacteria as a function of bias (0.1, 0.2, ..., 1.0). Run the
% simulation 500 times for each bias condition.

maxiter=1500;
j=1;
bias_bact=0;
for j=1:500;
    for nsteps=1:maxiter;
        [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
        if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
            break
        end
        nx_bias_length(j)= nsteps;
    end
end
Neu_Steps_0= mean(nx_bias_length);
bias_bact=0.1;
for j=1:500;
    for nsteps=1:maxiter;
        [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
        if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
            break
        end
        nx_bias_length(j)= nsteps;
    end
end
Neu_Steps_01= mean(nx_bias_length);
bias_bact=0.2;
for j=1:500;
    for nsteps=1:maxiter;
        [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
        if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
            break
        end
        nx_bias_length(j)= nsteps;
    end
end
Neu_Steps_02= mean(nx_bias_length);
bias_bact=0.3;
for j=1:500;
    for nsteps=1:maxiter;
        [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
        if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
            break
        end
        nx_bias_length(j)= nsteps;
    end
end
Neu_Steps_03= mean(nx_bias_length);
bias_bact=0.4;
for j=1:500;
    for nsteps=1:maxiter;
        [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
        if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
            break
        end
        nx_bias_length(j)= nsteps;
    end
end
Neu_Steps_04= mean(nx_bias_length);
bias_bact=0.5;
for j=1:500;
    for nsteps=1:maxiter;
        [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
        if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
            break
        end
        nx_bias_length(j)= nsteps;
    end
end
Neu_Steps_05= mean(nx_bias_length);
bias_bact=0.6;
for j=1:500;
    for nsteps=1:maxiter;
        [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
        if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
            break
        end
        nx_bias_length(j)= nsteps;
    end
end
Neu_Steps_06= mean(nx_bias_length);
bias_bact=0.7;
for j=1:500;
   for nsteps=1:maxiter;
        [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
        if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
            break
        end
        nx_bias_length(j)= nsteps;
    end
end
Neu_Steps_07= mean(nx_bias_length);
bias_bact=0.8;
for j=1:500;
    for nsteps=1:maxiter;
        [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
        if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
            break
        end
        nx_bias_length(j)= nsteps;
    end
end
Neu_Steps_08= mean(nx_bias_length);
bias_bact=0.9;
for j=1:500;
    for nsteps=1:maxiter;
        [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
        if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
            break
        end
    nx_bias_length(j)= nsteps;
end
end
Neu_Steps_09= mean(nx_bias_length);
bias_bact=1;
for j=1:500;
    for nsteps=1:maxiter;
        [x, y, q, r] =neutrophil_hunter(nsteps,bias_bact);
        if q-2 <= x(end) && x(end) <= q+2 && r-2 <= y(end) && y(end)<= r+2;
            break
        end
    nx_bias_length(j)= nsteps;
    end
end
Neu_Steps_1= mean(nx_bias_length);
figure (14);
hold on
plot( 0,Neu_Steps_0,'o')
plot(0.1, Neu_Steps_01,'o')
plot(0.2, Neu_Steps_02,'o')
plot(0.3, Neu_Steps_03,'o')
plot(0.4, Neu_Steps_04,'o')
plot(0.5, Neu_Steps_05,'o')
plot(0.6, Neu_Steps_06,'o')
plot(0.7, Neu_Steps_07,'o')
plot (0.8, Neu_Steps_08,'o')
plot (0.9, Neu_Steps_09,'o')
plot (1, Neu_Steps_1,'o')
title ('Average Number of Steps Required to Reach the Bacteria for Each Bias Value')
xlabel ('Bias')
ylabel('Average Number of Steps')
hold off