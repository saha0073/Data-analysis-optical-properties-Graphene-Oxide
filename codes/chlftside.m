%%
%this will make the value of left hand side equal to right hand size
%i.e left hand side value will be changed
%keeping the value of left hand side unchanged 
%for saturation changr min to max
%change the file name



t=b300n;
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


s=t;
%t(:,3)=std(t(:,2));
m=numel(s(:,1));

%plot(t(:,1),t(:,2))
[e,f]=min(t(:,2));
%[e,f]=max(t(:,2));

b=0;


for i=1:f
    b(i,1)=s(i,1);
    
end

d=t(2,1)-t(1,1);
for i=1:f
    
    b(f+i,1)=b(f+i-1,1)+d;
    
end

for i=1:f
    b(i,2)=s(i,2);
end



    
for i=1:f
    
    b(f+i,2)=s(f-i+1,2);
    
    
end
 
    
    
    
    
plot(b(:,1),b(:,2))


%%

for i=1:2*f
A(2*i-1)=b(i,1);
end
for j=1:2*f
    A(2*j)=b(j,2);
end
fileID = fopen('lefthndcng.dat','w');
%fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\r\n',A);
fclose(fileID);

  
