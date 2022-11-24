function nCutValue = calculateNcut(anAffinityMat , clusterIdx)
    %find how many different clusters exist
    C = unique(clusterIdx,'sorted');
    %create a matrix for assoc(i,i) and assoc(i,V).These two have an offset
    %of size(assoc)/2
    assoc = zeros(1,2*size(C,1));
    
    for i = 1:size(C,1)
        for j = 1:size(clusterIdx,1)
            if clusterIdx(j,1) == i
                for k = 1:size(anAffinityMat,2)
                    %find assoc(clyster,V)
                    assoc(1,i) = assoc(1,i) + anAffinityMat(j,k); 
                end
                
                for l = 1:size(clusterIdx,1)
                    if clusterIdx(l,1) == C(i,1)
                        %find assoc(cluster,cluster)
                        assoc(1,i+size(assoc,2)/2) = assoc(1,i+size(assoc,2)/2) + anAffinityMat(j,l);
                    end
                end
            end
        end
    end
   
    Nassoc = 0;
    for t = 1:size(C,1)        
        Nassoc = Nassoc + assoc(1,t+size(assoc,2)/2)/assoc(1,t);
    end
    
    nCutValue = 2 - Nassoc ;
end
    