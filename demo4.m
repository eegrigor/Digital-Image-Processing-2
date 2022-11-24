clear;
clc;

rng(1);

I = imread('bee.jpg');
figure(1)
imshow(I);  

mex slicmex.c

[labels , ~] = slicmex(I, 400 , 20);

outputImage = superpixelDescriptor(I, labels);
figure(2)
imshow(outputImage);
superpixellist = zeros(1,max(labels(:)),size(I,3));

for i =1:size(superpixellist,2)
    [row,col] = find(labels == i);
    superpixellist(1,i) = outputImage(row(1),col(1));
end

myAffinityMat = Image2Graph(superpixellist);

k = 6;

clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
fprintf('For the superpixeled image and k=%i cluster indexies are: \n',k);
%display(clusterIdx);
nCutValue = calculateNcut(myAffinityMat , clusterIdx);
fprintf('The ncut value for the superpixeled image is : %i \n',nCutValue);

k = 10;

clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
fprintf('For the superpixeled image and k=%i cluster indexies are: \n',k);
%display(clusterIdx);
nCutValue = calculateNcut(myAffinityMat , clusterIdx);
fprintf('The ncut value for the superpixeled image is : %i \n',nCutValue);

k=2;
%for 6 clusters 
threshold1 = 10;
threshold2 = 1.2;

counter = 0;

while k==2 || (T1 > threshold1 && T2 < threshold2)
    
    counter = counter + 1;
    clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
    fprintf('clustering number %i for the superpixeled image',counter);
    display(clusterIdx);
    nCutValue = calculateNcut(myAffinityMat , clusterIdx);
    fprintf('ncut value for clustering number %i\n',nCutValue);
    T2 = nCutValue;
    clusters = zeros(1,max(clusterIdx));
    for i =1:size(clusterIdx,1)
            clusters(1,clusterIdx(i,1)) = clusters(1,clusterIdx(i,1)) + 1;
    end
    T1 = min(clusters);
    k =k+1;
end

threshold1 = 1;
threshold2 = 1.5;
k=2;
T1 = 0;
T2 = 0;
counter = 0;
while k==2 || (T1 > threshold1 && T2 < threshold2)
    
    counter = counter + 1;
    clusterIdx = myGraphSpectralClustering(myAffinityMat , k);
    fprintf('clustering  number %i for the superpixeled image',counter);
    display(clusterIdx);
    nCutValue = calculateNcut(myAffinityMat , clusterIdx);
    fprintf('ncut value for clustering number %i\n',nCutValue);
    T2 = nCutValue;
    clusters = zeros(1,max(clusterIdx));
    for i =1:size(clusterIdx,1)
            clusters(1,clusterIdx(i,1)) = clusters(1,clusterIdx(i,1)) + 1;
    end
    T1 = min(clusters);
    k =k+1;
end

