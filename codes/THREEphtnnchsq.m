%finding chaisquare using two and three photon absorption 
%plot theoritical and experimental data

%Change file name
%change intensity
%%change a
%%change w_0


%clear all
clc

t=go2d5;                             %name of input file

Intensity=212.5;                                %GW/cm^2
a=.6375;                                       %cm^-1
%for b=1:20                          %cm/GW
                                                                       
w_0=58*10^-4;                                       %cm
lambda=808*10^-7;                            %cm
z_r=(pi*(w_0)^2/lambda);                   %cm
%z_r=0.0106;

n=numel(t(:,1));%no of positions here where reading were was taken

initial=t(1,1);
final=t(n,1);
z=linspace(initial,final,n); %cm total distnce scan

std=t(1,3);                   %standerd deviation 
sstd=std^2;                   %square of standerd deviation


I_sat=100;                                  %GW/cm^2
b= .004;                                       %cm/GW
gamma=10^-6;

N=1000;                                    %no of divisions in the sample
width=.1;                                %width of sample in cm
dz=width/N;

cai=0;
chai=0;                                 %making the initial value equal to zero

J=linspace(0,0,n);                       %Defining an array J of size n

for i=1:n
 I(i,1)=Intensity./(1+((z(i).^2)./(z_r)^2));%Gaussian intensity distribution


end
for i=1:n
    
    for j=2:N
        I(i,j)=I(i,j-1)-dz*((a*I_sat*I(i,j-1)./(I_sat+I(i,j-1)))+b*I(i,j-1).^2+gamma*I(i,j-1).^3);
        
        
    end
        
    T(i)=I(i,N)./I(i,1);
    J(i)=T(i)/T(1);
    cai=cai+((J(i)-t(i,2))^2/sstd);
    i*100/n
end
chai=cai
%G=T(1);
%H=T./G;
plot(z,J,'r');hold on
plot(z,t(:,2),'b')
grid on
%%
A=[z;J];

for i=1:n
B(2*i-1)=z(i);
end
for j=1:n
    B(2*j)=J(j);
end
fileID = fopen('data.dat','w');
%fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\r\n',B);
fclose(fileID);

