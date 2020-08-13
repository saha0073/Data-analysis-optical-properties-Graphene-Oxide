%%

%it will interchange value from 1st to last which is used for CA
%it will make a file swaping the values 
%you should check this by plotting final value(line 31) 
%before making a new file you at first check the name of file 


t=d150new;
u=t;

n=numel(t(:,1));

a=t(:,2);

if mod(n,2)==0
    for i=1:n
        
        t(i,2)=a(n+1-i);
    end
else
    for i=1:((n/2)-.5)
        t(i,2)=a(n+1-i);
    end
    for i=((n/2)+.5):n
        t(i,2)=a(n+1-i);
    end
    
end 
plot(t(:,1),t(:,2));


d=t(2,1)-t(1,1);
g=0;
g(i,1)=u(i,1);

for i=1:2*n-1
    g(i+1,1)=g(i,1)+d;
end
for i=1:n
    g(i,2)=u(i,2);
end
for i=1:n
    g(i+n,2)=t(i,2);
end


plot (g(:,1),g(:,2))
%%
m=2*n;

for i=1:m
A(2*i-1)=g(i,1);
end
for j=1:m
    A(2*j)=g(j,2);
end
fileID = fopen('swapright.dat','w');
%fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\r\n',A);
fclose(fileID);
