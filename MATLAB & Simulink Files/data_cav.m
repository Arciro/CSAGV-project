% ****CHALLENGE CSAGV***** %
% ****CIRO ARENA P38/53***** %
clear
clc

%% VEHICLE PARAMETERS
m   = 1521;  % 𝑣𝑒ℎ𝑖𝑐𝑙𝑒 𝑚𝑎𝑠𝑠
fr  = 0.015; % 𝑟𝑜𝑙𝑙𝑖𝑛𝑔 𝑟𝑒𝑠𝑖𝑠𝑡𝑎𝑛𝑐𝑒 𝑐𝑜𝑒𝑓𝑓𝑖𝑐𝑖𝑒𝑛𝑡
g   = 9.81;  % 𝑔𝑟𝑎𝑣𝑖𝑡𝑎𝑡𝑖𝑜𝑛𝑎𝑙 𝑎𝑐𝑐𝑒𝑙𝑒𝑟𝑎𝑡𝑖𝑜𝑛
rho = 1.2;   % 𝑎𝑖𝑟 𝑑𝑒𝑛𝑠𝑖𝑡𝑦
Cd  = 0.28;  % 𝑑𝑟𝑎𝑔 𝑐𝑜𝑒𝑓𝑓𝑖𝑐𝑖𝑒𝑛𝑡
Af  = 2.33;  % 𝑓𝑟𝑜𝑛𝑡𝑎𝑙 𝑎𝑟𝑒𝑎
eta = 0.93;  % 𝑡ℎ𝑒 𝑒𝑓𝑓𝑖𝑐𝑖𝑒𝑛𝑐𝑦
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

%% DRIVING SCENARIO
load('Highway_road_scenario.mat');