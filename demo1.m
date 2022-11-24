clear;
clc;

rng(1);
load('dip_hw_2.mat', 'd1a');

k = 2; 
clusterIdx = myGraphSpectralClustering(d1a , k);
fprintf('For k = 2 cluster indexies are: \n');
display(clusterIdx);

k = 3; 
clusterIdx = myGraphSpectralClustering(d1a , k);
fprintf('For k = 3 cluster indexies are: \n');
display(clusterIdx);

k = 4; 
clusterIdx = myGraphSpectralClustering(d1a , k);
fprintf('For k = 4 cluster indexies are: \n');
display(clusterIdx);