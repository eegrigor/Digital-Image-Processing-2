function clusterIdx = myGraphSpectralClustering(anAffinityMat , k)
        
    [dim1,dim2] = size(anAffinityMat);
    D = zeros(dim1,dim2);
    W = anAffinityMat ;
    
    for i = 1:dim1
        for j = 1:dim2
            D(i,i) = D(i,i) + W(i,j);
        end
    end
    
    L = D - W;
    
    %V is eigenvectors
    %find first k eigenvalues and eigenvetrs
    [V,eigenvalues] = eigs(L,D,k,'smallestabs');
    
    clusterIdx = kmeans(V,k);
    
end