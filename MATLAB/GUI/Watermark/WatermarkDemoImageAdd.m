% ��ԭͼ
imOri=imread('lena.jpg');
%���š��ҶȻ�ԭͼ
imOri=imresize(imOri,[512 512]);
imOri=rgb2gray(imOri);

% ��ˮӡͼ
imWat=imread('QQ.png');
% ���š��ҶȻ�ˮӡͼ
imWat=imresize(imWat,[512 512]);
imWat=rgb2gray(imWat);

% ��ˮӡ���ͼ
imNew=uint8(double(imOri)+0.05*double(imWat));

% �����ˮӡ���ͼ
imwrite(imNew,'lena-QQ.png')

% ��ͼ 
figure;
imshowpair(imOri,imNew,'montage')

imNew=imread('lena-QQ.png');
figure;
imagesc(double(imOri)-double(imNew))