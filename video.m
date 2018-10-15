% To get information about video file
file=aviinfo('tu.avi');
% To get the no of frames in the video file  
frm_cnt=file.NumFrames

FileExtension='.bmp'
%Progress bar starts
h = waitbar(0,'Please wait...');

%Begin Loop process till End of Frames

for i=1:frm_cnt

    % Read the Frame of the Video file
frm(i)=aviread('tu.avi',i);
   % Convert Frame to image file   
frm_name=frame2im(frm(i));
     %Create Filename to store
Filename=strcat(strcat(num2str(i)),FileExtension);
    % Write image file  to the current folder
imwrite(frm_name,Filename);

waitbar(i/frm_cnt,h)

end
%Close Progress bar
close(h)