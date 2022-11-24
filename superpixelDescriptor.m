function outputImage = superpixelDescriptor(imIn, labels)

    maxlabel = max(labels(:));
    [dim1,dim2,dim3] = size(imIn);
    channels = dim3;
    outputImage = zeros(dim1,dim2,dim3,'uint8');
    
    for i =0:maxlabel
        %find the rows and columns of pixels that make the i superpixel
        [row,col] = find(labels == i);
        matrix = zeros(size(row,1),channels);
        for j = 1:size(row,1)
            for k =1:channels
                matrix(j,k) = imIn(row(j),col(j),k);
            end
        end
        %mean value of channels
        meanval = mean(matrix);
        
        for z = 1:size(row,1)
            for l = 1:channels
                outputImage(row(z),col(z),l) = uint8(meanval(1,l));
            end
        end
    
    end
end