%finding chaisquare and plot theoritical and experimental data 
%for close aperture


%Change file name
%change intensity
%%change a
%%change w_0


%clear all
clc

t=br1;                             %name of input file

Intensity=189.2;                                %GW/cm^2
a=4.7;                                       %cm^-1
%for b=1:20                          %cm/GW
                                                                       
w_0=58*10^-4;                                       %cm
lambda=808*10^-7;                            %cm
z_r=(pi*(w_0)^2/lambda);                   %cm
%z_r=0.0106;
k=2*pi/lambda;

I_sat=150;                                  %GW/cm^2
b=0.01 ;                                       %cm/GW  
n_2=6.3*10^-7;                            %refractive index -- cm^2/GW

n=numel(t(:,1));%no of positions here where reading were was taken

initial=t(1,1);
final=t(n,1);
z=linspace(initial,final,n); %cm total distnce scan

std=t(1,3);                   %standerd deviation 
sstd=std^2;                   %square of standerd deviation

N=5000;                                  %no of divisions in the sample
width=.1;                                %width of sample in cm
dz=width/N;

cai=0;
chai=0;                                 %making the initial value equal to zero

J=linspace(0,0,n);                       %Defining an array J

phi=linspace(0,0,n);                %making an array of size n every term equal to zero

for i=1:n
 I(i,1)=Intensity./(1+((z(i).^2)./(z_r)^2));%Gaussian intensity distribution


end

for i=1:n
    
    for j=2:N
        I(i,j)=I(i,j-1)-dz*((a*I_sat*I(i,j-1)./(I_sat+I(i,j-1)))+b*I(i,j-1).^2);
        
        
    end
        
    T(i)=I(i,N)./I(i,1);
   % J(i)=T(i)/T(1);
  
    i*100/n
end





for i=1:n
    for j=1:N
    phi(i)=phi(i)+I(i,j)*dz*k*(n_2);   



    end
    
    
    
end

phinot=phi.*(1+((z.^2)/((z_r)^2)));

%for i=1:n
 %   cai=cai+((phinot(i)-t(i,2))^2/sstd);
    
    
    
%end



x=z/(z_r);
T=1+((4*phinot.*x)./(((x.^2)+9).*((x.^2)+1)));

for i=1:n
    
    cai=cai+((T(i)-t(i,2))^2/sstd);
end

 chai=cai
 
 
plot(z,T);hold on
plot(z,t(:,2))
grid on

%%
A=[z;T];
for i=1:n
B(2*i-1)=z(i);
end
for j=1:n
    B(2*j)=T(j);
end
fileID = fopen('data.dat','w');
%fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\r\n',B);
fclose(fileID);



































