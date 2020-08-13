%%
%this will make the value of right hand side equal to left hand size 
%i.e right hand side value will be changed
%keeping the value of left hand side unchanged 
%for saturation changr min to max
%change the file name


t=d250;
n=numel(t(:,1));

%plot(t(:,1),t(:,2))
[e,f]=min(t(:,2));
%[e,f]=max(t(:,2));

a=0;


for i=1:f
    a(i,1)=t(i,1);
    
end

d=t(2,1)-t(1,1);
for i=1:f
    a(f+i,1)=a(f+i-1,1)+d;
end

for i=1:f
    a(i,2)=t(i,2);
end



    
for i=1:f
    
    a(f+i,2)=t(f-i+1,2);
    
    
end
 
    
    
    
    
plot(a(:,1),a(:,2))

%%

n=numel(a(:,1));
for i=1:2*f
B(2*i-1)=a(i,1);
end
for j=1:2*f
    B(2*j)=a(j,2);
end
fileID = fopen('righthandcng.dat','w');
%fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\r\n',B);
fclose(fileID);


