clear;
clc;

rng(1);

load('dip_hw_2.mat', 'd2a');
load('dip_hw_2.mat', 'd2b');

k=2;

threshold1 = 5;
threshold2 = 0.6;



myAffinityMat = Image2Graph(d2a);

while k==2 || (T1 > threshold1 && T2 < threshold2)
    
    clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
    fprintf('clustering number %i for the first image',k);
    display(clusterIdx);
    nCutValue = calculateNcut(myAffinityMat , clusterIdx);
    fprintf('ncut value is %i for clustering number %i\n',nCutValue,k);
    T2 = nCutValue;
    clusters = zeros(1,max(clusterIdx));
    for i =1:size(clusterIdx,1)
        %vertices of each cluster
            clusters(1,clusterIdx(i,1)) = clusters(1,clusterIdx(i,1)) + 1;
    end
    T1 = min(clusters);
    k =k+1;
end

k=2;
T1 = 0;
T2 = 0;
myAffinityMat = Image2Graph(d2b);
counter = 0;
while k==2 || (T1 > threshold1 && T2 < threshold2)
        
    clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
    fprintf('clustering  number %i for the second image',k);
    display(clusterIdx);
    nCutValue = calculateNcut(myAffinityMat , clusterIdx);
    fprintf('ncut value is %i for clustering number %i\n',nCutValue,k);
    T2 = nCutValue;
    clusters = zeros(1,max(clusterIdx));
    for i =1:size(clusterIdx,1)
        %vertices of each cluster
            clusters(1,clusterIdx(i,1)) = clusters(1,clusterIdx(i,1)) + 1;
    end
    T1 = min(clusters);
    k =k+1;
end