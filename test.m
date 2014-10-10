function test()
%台大机器学习基石第一次作业Q.15-17 matlab实现
clc;
workmode=1;
switch workmode
    case 0
	    naive_cycle();
    case 1
        %tic;
        predefined_random(2000,1);
        %toc;
end

function [X,Y]=load_data()
dataset=load('train.txt');
X=dataset(:,1:4);
Y=dataset(:,5);
[n,m]=size(X);
X=[ones(n,1),X];%这一步很重要

function naive_cycle()
[X,Y]=load_data();
randflag=false;
t=train(X,Y,randflag,1);
disp(t);

function predefined_random(n,alpha)
[X,Y]=load_data();
randflag=true;
count=0;
for i=1:n
t=train(X,Y,randflag,alpha);
count=count+t;
end
t=count/n;
disp(t);

function t=train(X,Y,randflag,alpha)
w=zeros(1,5);
n=length(Y);
idx=[1:1:n];
if randflag
    idx=randperm(length(Y));
end
flag=true;
t=0;
k=1;
while true
    if k==n
        if flag 
            break
        else
            k=1;
            flag=true;
        end    
    end
	i=idx(k);
    x=X(i,1:5)';
    y= Y(i);
    if (sign(dot(w,x)))~= y
        flag=false;
        t=t+1;
        w=w+alpha*y*X(i,1:5);
    end
    k=k+1;
end

        


    
