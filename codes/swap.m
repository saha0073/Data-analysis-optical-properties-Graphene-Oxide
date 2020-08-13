%%

%it will interchange value from 1st to last which is used for CA
%it will make a file swaping the values 
%you should check this by plotting final value(line 31) 
%before making a new file you at first check the name of file 


t=d150chng;
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

t(:,3)=std(t(:,2));

plot(t(:,1),t(:,2));          %for checking
%%

for i=1:n
A(2*i-1)=t(i,1);
end
for j=1:n
    A(2*j)=t(j,2);
end
fileID = fopen('swapped.dat','w');
%fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\r\n',A);
fclose(fileID);

  
