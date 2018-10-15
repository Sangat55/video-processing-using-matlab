folder = 'frames'
filePattern = fullfile(folder, '*.bmp');
f=dir(filePattern)
files={f.name}
for k=1:numel(files)
	fullFileName = fullfile(folder, files{k})
	Y{k}=imread(fullFileName)
    baseFileName= sprintf('Images%d.bmp',k);
    fullFileName = fullfile('frames', baseFileName);
    imwrite(Y{k}, fullFileName);
end