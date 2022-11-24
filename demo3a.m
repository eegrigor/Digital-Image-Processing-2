clear;
clc;

rng(1);

load('dip_hw_2.mat', 'd2a');
load('dip_hw_2.mat', 'd2b');

myAffinityMat = Image2Graph(d2a);

k = 2;

clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
%fprintf('For the first image and k=%i cluster indexies are: \n',k);
%display(clusterIdx);
nCutValue = calculateNcut(myAffinityMat , clusterIdx);
fprintf('The ncut value for the d2a image is : %i \n',nCutValue);

myAffinityMat = Image2Graph(d2b);

clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
%fprintf('For the first image and k=%i cluster indexies are: \n',k);
%display(clusterIdx);
nCutValue = calculateNcut(myAffinityMat , clusterIdx);
fprintf('The ncut value for the d2b image is : %i \n',nCutValue);

k = 3;

clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
%fprintf('For the first image and k=%i cluster indexies are: \n',k);
%display(clusterIdx);
%nCutValue = calculateNcut(myAffinityMat , clusterIdx);
%fprintf('The ncut value for the first image is : %i \n',nCutValue);

myAffinityMat = Image2Graph(d2b);

clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
%fprintf('For the first image and k=%i cluster indexies are: \n',k);
%display(clusterIdx);
nCutValue = calculateNcut(myAffinityMat , clusterIdx);
%fprintf('The ncut value for the second image is : %i \n',nCutValue);