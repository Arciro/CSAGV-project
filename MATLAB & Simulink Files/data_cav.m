% ****CHALLENGE CSAGV***** %
% ****CIRO ARENA P38/53***** %
clear
clc

%% VEHICLE PARAMETERS
m   = 1521;  % ๐ฃ๐โ๐๐๐๐ ๐๐๐ ๐ 
fr  = 0.015; % ๐๐๐๐๐๐๐ ๐๐๐ ๐๐ ๐ก๐๐๐๐ ๐๐๐๐๐๐๐๐๐๐๐ก
g   = 9.81;  % ๐๐๐๐ฃ๐๐ก๐๐ก๐๐๐๐๐ ๐๐๐๐๐๐๐๐๐ก๐๐๐
rho = 1.2;   % ๐๐๐ ๐๐๐๐ ๐๐ก๐ฆ
Cd  = 0.28;  % ๐๐๐๐ ๐๐๐๐๐๐๐๐๐๐๐ก
Af  = 2.33;  % ๐๐๐๐๐ก๐๐ ๐๐๐๐
eta = 0.93;  % ๐กโ๐ ๐๐๐๐๐๐๐๐๐๐ฆ
R   = 0.5;   % wheel radius

%% IMPORT FROM EXCEL
%elevation profile
date_elev = readmatrix('ElevationProfile.xlsx');
elev_date_1 = date_elev(:,1);
elev_date_2 = date_elev(:,2);

%slope profile
date_slope = readmatrix('GradientProfile.xlsx');
slope_date_1 = date_slope(:,1);
slope_date_2_grad = date_slope(:,2);
slope_date_2_degree = zeros(length(slope_date_2_grad),1);

for i = 1:length(slope_date_2_grad)
    slope_date_2_grad(i) = slope_date_2_grad(i)/100;
    slope_date_2_degree(i) = atan(slope_date_2_grad(i));
end

%% PARAMETERS UNCERTAINTES
m_u = m-0.1*m + (2*0.1*m)*rand(1);
fr_u = fr-0.1*fr + (2*0.1*fr)*rand(1);
rho_u = rho-0.1*rho + (2*0.1*rho)*rand(1);
Cd_u = Cd-0.1*Cd + (2*0.1*Cd)*rand(1);
Af_u = Af-0.1*Af + (2*0.1*Af)*rand(1);
eta_u = eta-0.1*eta + (2*0.1*eta)*rand(1);
R_u = R-0.1*R + (2*0.1*R)*rand(1);