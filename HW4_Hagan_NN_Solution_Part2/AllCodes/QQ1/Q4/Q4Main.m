clc;
clear all;
close all;

out=sim('MLPQ4.slx');

x=out.xx;
x=x.Data;

x_start = 117 ;
x_end = 1118 ;

x=[x(x_start-18:x_end-18,1),x(x_start-12:x_end-12,1),x(x_start-6:x_end-6,1),x(x_start:x_end,1),x(x_start+6:x_end+6,1)];

x_train=x(1:500,1:4);
y_train=x(1:500,5);

net = feedforwardnet(30);

[trainedNet,tr] = train(net,x_train',y_train')


x_test=x(501:1000,1:4);
y_test=x(501:1000,5);


for i=1:500
NNsOutput(i)=sim(trainedNet,x_test(i,:)');
end

figure
plot(1:500,NNsOutput,'k',LineWidth=1.2)
hold on
plot(1:500,y_test,'r--',LineWidth=2)
legend('Data','MLP Output')