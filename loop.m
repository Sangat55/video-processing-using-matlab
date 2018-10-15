folder = 'frames'
filePattern = fullfile(folder, '*.bmp');
f=dir(filePattern)
files={f.name}
for k=1:numel(files)
	fullFileName = fullfile(folder, files{k})
	cellArrayOfImages{k}=imread(fullFileName)
    subplot(5,5,k),imshow(cellArrayOfImages{k})
    
end



