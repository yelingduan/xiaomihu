clc
clear all
close all

%%% ����ˮӡ
% ��ȡԭͼƬ
img=imread('lena.jpg');
img=double(rgb2gray(img));
% ��ȡˮӡͼƬ
% wimg=imread('taoge.jpg');
% wimg=double(rgb2gray(wimg));
wimg=double(imread('taoge-w.jpg'));

% ��ԭͼ����PCA
[coeff,score,latent] = pca(img,'Centered',false);
score2=reshape(score,size(score,1)*size(score,2),1);
wimg2=reshape(wimg,size(wimg,1)*size(wimg,2),1);
% ˮӡ������С
x=0.04;
% ˮӡͼƬ����PCA Score
score2(1:length(wimg2))=score2(1:length(wimg2))+x*wimg2;
score2=reshape(score2,size(score,1),size(score,2));

% ����ˮӡͼ
re=score*coeff';
re2=score2*coeff';
imwrite(uint8(re2),'lena-w.jpg')
% �Ա�ԭͼ�ͼ�ˮӡͼ
figure;
subplot(1,2,1)
imagesc(re)
axis image
title('Original')
colormap(gray)
subplot(1,2,2)
imagesc(re2)
axis image
title('Watermarked')
colormap(gray)


%%%��ȡˮӡ
re=double(rgb2gray(imread('lena.jpg')));
re2=double(imread('lena-w.jpg'));
[coeff,score,latent] = pca(img,'Centered',false);
% ˮӡͼƬ��ԭ
wimgre=(re2*(coeff')^-1-score)/x;
wimgre=reshape(wimgre,size(wimgre,1)*size(wimgre,2),1);
wimgre=wimgre(1:length(wimg2));
wimgre=reshape(wimgre,size(wimg,1),size(wimg,2));

figure;
subplot(1,2,1)
imagesc(wimg)
axis image
title('Original Watermark')
colormap(gray)

subplot(1,2,2)
imagesc(wimgre)
axis image
title('Extracted Watermark')
colormap(gray)
