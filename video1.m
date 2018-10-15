FileExtension='.bmp';
%Create a multimedia reader video
readerobj = VideoReader('wehack.avi', 'tag', 'myreader1');

% Read in all video frames.
vidFrames = read(readerobj);

% Get the number of frames.
numFrames = get(readerobj, 'NumberOfFrames');

% Create a MATLAB movie struct from the video frames.
for k = 1 : numFrames
     mov(k).cdata = vidFrames(:,:,:,k);
     frm_name=vidFrames(:,:,:,k);;
     %Create Filename to store
     Filename=strcat(strcat(num2str(k+100000)),FileExtension);
     % Write image file  to the current folder
     imwrite(frm_name,Filename);
     mov(k).colormap = [];
end


% Create a figure
hf = figure; 

% Resize figure based on the video's width and height
set(hf, 'position', [150 150 readerobj.Width readerobj.Height])

% Playback movie once at the video's frame rate
movie(hf, mov, 1, readerobj.FrameRate);