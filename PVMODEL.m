
ISCS=8.66 ;                    %% short circuit current at panel name plate
IMPS=8.15;                     %% maximum current at panel name plate
Vocs=37.3;                     %% Open circuit voltage at panel name plate
VMPS=30.7;                     %% Maximun voltage at panel name plate
alpha=0.086998;                %% Current Temperature coefficient from Manufacture
beta=-0.36901;                 %% Voltage Temperature coefficient from Manufacture
Gs=1000;                       %% Standard Irradiance 1000 W/m2
Ts=25;                         %% Standard Temperature 25 degrees

for i=1:1000
Tmin=15;
Tmax=35;
T= (Tmax-Tmin)*rand + Tmin;  %%Temperature
Gmin=0;
Gmax=1000;
G=(Gmax-Gmin)*rand +Gmin;  %% Irradiance
IMP(i)= IMPS*(G/Gs)*(1+(alpha*(T-Ts))); %% Maximum current of the given irradiance and Temperature
VMP(i)= VMPS+(beta*(T-Ts));            %% Maximum Voltage of the given irradiance and Temperature
PMP(i)=VMP(i)*IMP(i);                   %% Maximum Power of the given irradiance and Temperature                
input(i,:)=[G,T];
output(i,1)=VMP(i);
output1(i,1)=IMP(i);
output2(i,1)=PMP(i);
end

