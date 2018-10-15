image1 = imread('14.bmp');
figure;
imshow(image1);
image2 = imread('15.bmp');
figure;
imshow(image2);
k = imabsdiff(image1,image2);
figure;
imshow(k)
