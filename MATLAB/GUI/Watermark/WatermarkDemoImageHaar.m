clc
clear all
close all
% ��ԭͼ
imOri=imread('lena.jpg');
%���š��ҶȻ�ԭͼ
imOri=imresize(imOri,[512 512]);
imOri=rgb2gray(imOri);
%����С���任
[LLorig,LHorig,HLorig,HHorig] = haart2(imOri,2);

% ��ˮӡͼ
imWat=imread('logo.jpg');
% ���š��ҶȻ�ˮӡͼ
imWat=imresize(imWat,[512 512]);
imWat=rgb2gray(imWat);
%����С���任
[LLw,LHw,HLw,HHw] = haart2(imWat,2);


% ��ˮӡ���ͼ
Wratio=0.01;
LLwatermarked = LLorig+Wratio*LLw;
imNew = uint8(ihaart2(LLwatermarked,LHorig,HLorig,HHorig));
% �����ˮӡ���ͼ
imwrite(imNew,'lena-logo.png')

% ��ͼ 
figure;
imshowpair(imOri,imNew,'montage')

imNew=imread('lena-logo.png');
figure;
imagesc(double(imOri)-double(imNew))
colormap(gray)