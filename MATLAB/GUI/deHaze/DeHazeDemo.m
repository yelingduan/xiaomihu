% ��ȡ�ļ�
img=imread('.\Dataset\canon.jpg');
% ��һ��
img=double(img)./255;
% ȥ��
dehazeimg=deHaze(img);

% �Ա�ȥ��ǰ��
figure(1);
imshowpair(img,dehazeimg,'montage')

% �Ա���ǿǰ��
figure(2);
imgEn=histeq(dehazeimg);
imshowpair(dehazeimg,imgEn,'montage')
