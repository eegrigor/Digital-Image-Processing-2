clear;
clc;

rng(1);

load('dip_hw_2.mat', 'd2a');
load('dip_hw_2.mat', 'd2b');

myAffinityMat = Image2Graph(d2a);

k = 3;
clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
fprintf('For the d2a image and k=%i cluster indexies are: \n',k);
display(clusterIdx);

k = 4;
clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
fprintf('For the d2a image and k=%i cluster indexies are: \n',k);
display(clusterIdx);

myAffinityMat = Image2Graph(d2b);

k = 3;
clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
fprintf('For the d2b image and k=%i cluster indexies are: \n',k);
display(clusterIdx);

k = 4;
clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
fprintf('For the d2b image and k=%i cluster indexies are: \n',k);
display(clusterIdx);