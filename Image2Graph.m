function myAffinityMat = Image2Graph(imIn)
    
    %get the size of input image
    [height, width, channels] = size(imIn);
    n = channels ;
    
    %affinity matrix is size (NxM)X(NxM)
    %N = height
    %M = width
    myAffinityMat = zeros(height*width,width*height);
    
    %reshape the image to be easier to access pixels
    im = reshape(imIn,[1,height*width,n]);
    
    for i = 1:height*width
        %affinity matrix is symmetric so we need only the diagonal and
        %upper pixels 
        for j = i:width*height 
            d = 0;
            for k = 1:n
                d = d + (im(1,i,k) - im(1,j,k))^2;
            end
                myAffinityMat(i,j) = 1/exp(sqrt(d));
                %affinity matrix is symetric 
                myAffinityMat(j,i) = myAffinityMat(i,j);
        end
    end
end