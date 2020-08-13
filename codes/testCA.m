%for testing the theoritical program using cranknichelson


%Change file name
%chnage standerd deviation
%change intensity
%change w_0
%change a

%clear all
clc

Intensity=300;                                %GW/cm^2
a=4.16;                                       %cm^-1
%for b=1:20
n_2=6.3*10^-7;                            %refractive index -- cm^2/GW



w_0=58*10^-4;                                       %cm
lambda=808*10^-7;                            %cm
z_r=(pi*(w_0)^2/lambda);                   %cm
%z_r=0.0106;
k=2*pi/lambda;

n=1000;                                     %no of positions here where reading were was taken
z=linspace(-8,8,n);                         %cm total 8 cm scan


I_sat=150;                                  %GW/cm^2
b=0.01 ;                                       %cm/GW  


N=5000;                                    %no of divisions in the sample
width=.1;                                %width of sample in cm
dz=width/N;




for i=1:n
 I(i,1)=Intensity./(1+((z(i).^2)./(z_r)^2));%Gaussian intensity distribution


end
for i=1:n
    
    for j=2:N
        I(i,j)=I(i,j-1)-dz*((a*I_sat*I(i,j-1)./(I_sat+I(i,j-1)))+b*I(i,j-1).^2);
        
        
    end
        
    T(i)=I(i,N)./I(i,1);
     J(i)=T(i)/T(1);
    i*100/n
end
%G=T(1);
%H=T./G;
%plot(z,J);%hold on
%end

for i=1:n
    phi(i)=0;
end


for i=1:n
    for j=1:N
    phi(i)=phi(i)+I(i,j)*dz*k*(n_2);    



        
    end
    
    
    
end

%delphi=phi*dz*k*(n_2);

phinot=phi.*(1+((z.^2)/((z_r)^2)));

%plot(z,delphinot)
x=z/(z_r);
T=1+((4*phinot.*x)./(((x.^2)+9).*((x.^2)+1)));
plot(z,T)



































