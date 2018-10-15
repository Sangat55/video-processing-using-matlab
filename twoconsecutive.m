numFiles = length(myfile)
numRows = ceil(sqrt(numFiles))
folder = 'frames'
filePattern = fullfile(folder, '*.bmp');
f=dir(filePattern)
files={f.name}
FileExtension='.bmp';
for k = 2 : numFiles+1
   
    thisFileName = fullfile(myfile(k-1).folder, myfile(k-1).name);
    thisFileName2 = fullfile(myfile(k).folder,myfile(k).name);
    thisImage = imread(thisFileName);
    thisImage2 = imread(thisFileName2);
    i = imabsdiff(thisImage,thisImage2);
   %Create Filename to store
     Filename=strcat(strcat(num2str(k+2000)),FileExtension);
     % Write image file  to the current folder
     imwrite(i,Filename);
     mov(k).colormap = [];
end