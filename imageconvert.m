clc;
clear all;
close all;
folder = 'frames'
filePattern = fullfile(folder, '*.bmp');
f=dir(filePattern)
files={f.name}
for k=1:numel(files)
	fullFileName = fullfile(folder, files{k})
	Y{k}=imread(fullFileName)
    %figure;imshow(Y{k});
    [n,m]=size(Y{k});
%median filter
    for i=1:n
       for j=1:m
          mat=zeros(3,3);
             if((i-1) == 0 && (j-1) ~= 0 && j~=m)
                mat(2:3,1:3)=Y{k}(i:i+1,j-1:j+1);
                mat=sort(mat,1);
                mat=sort(mat,2);
                Y{k}(i,j)=mat(2,2);
            elseif(i==n && (j-1)~=0 && j~=m)
                mat(1:2,:)=Y{k}(i-1:i,j-1:j+1);
                mat=sort(mat,1);
                mat=sort(mat,2);
                Y{k}(i,j)=mat(2,2);
            elseif((i-1)~=0 &&(j-1)~=0 && j~=m && i~=n)
                mat(:,:)=Y{k}(i-1:i+1,j-1:j+1);
                mat=sort(mat,1);
                mat=sort(mat,2);
                Y{k}(i,j)=mat(2,2);
            elseif((j-1)==0 && (i-1)~=0 && i~=n)
                mat(:,2:3)=Y{k}(i-1:i+1,j:j+1);
                mat=sort(mat,1);
                mat=sort(mat,2);
                Y{k}(i,j)=mat(2,2);
            elseif(j==m && (i-1)~=0 && i~=n)
                mat(:,1:2)=Y{k}(i-1:i+1,j-1:j);
                mat=sort(mat,1);
                mat=sort(mat,2);
                Y{k}(i,j)=mat(2,2);
            end
            
          
       end
       baseFileName= sprintf('Images%d.bmp',k);
       fullFileName = fullfile('frames', baseFileName);
       imwrite(Y{k}, fullFileName);
    end
  
end



    
