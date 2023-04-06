clc;
clear all;
close all;

for k=1:700
    if k<=500
        o=@(x) sin((2*pi*x)/250);
    else
        o=@(x) 0.5*sin((2*pi*x)/250) + 0.5*sin((2*pi*x)/25);
    end
    u(k)=o(k);
end

k=1:700;

figure
plot(k,u,LineWidth=2)
xlabel("time")

o=@(y) 0.6*sin(pi*y)+0.3*sin(3*pi*y)+0.1*sin(5*pi*y);
f=o(u);

figure
plot(k,f,LineWidth=2)
xlabel("time")

train_data=k';
train_target=f';
net = feedforwardnet(30);

[trainedNet,tr] = train(net,train_data',train_target')

kk=k(1:500);

test_data=kk';

for i=1:500
NNsOutput(i)=sim(trainedNet,test_data(i,:)');
end

ff=f(1:500);
plot(1:500,ff,'r',1:500,NNsOutput,'b',LineWidth=2)
legend('Data','MLP Output')


time=kk;
F=NNsOutput;

out=sim('anf33.slx');

yk=out.Output;
yk=yk.Data;

yhk=out.Output1;
yhk=yhk.Data;

figure
plot(yhk,'b',LineWidth=2)
hold on
plot(yk,'r--',LineWidth=2)
legend("yhk","yk")
axis([0 500 -6 6])