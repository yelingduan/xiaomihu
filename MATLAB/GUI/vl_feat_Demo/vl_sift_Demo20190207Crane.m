%% ׼�������ռ�
clc
clear all
close all
%% ����vlfeat
run('.\vlfeat-0.9.21-bin\vlfeat-0.9.21\toolbox\vl_setup.m')
%����vlfeat�Ƿ���سɹ�
vl_version verbose

%% ����ͼƬ
%ͼƬ1
img1ori = imread('JapanCrane.jpg');
img1 = single(rgb2gray(img1ori));
%ͼƬ2
img2ori = imread('Crane.jpg');
% img2ori = imread('Snowball.jpg');
img2 = single(rgb2gray(img2ori));

%% ��ȡSIFT������ƥ��������
[f1, d1] = vl_sift(img1,'Levels',3,'PeakThresh', 1);
[f2, d2] = vl_sift(img2,'Levels',3,'PeakThresh', 1);
[matches, scores] = vl_ubcmatch(d1, d2);
[dump,scoreind]=sort(scores,'ascend');

%% �������ͼƬ
newfig=zeros(size(img1,1), size(img1,2)+size(img2,2),3);
newfig(:,1:size(img1,2),:) = img1ori;
newfig(1:size(img2,1) ,(size(img1,2)+1):end,:)=img2ori;
newfig=uint8(newfig);
figure;
image(newfig);
axis image
% colormap(gray)
%% ����ƥ��������
figure;
image(newfig);
axis image
f2Moved=f2;
f2Moved(1,:) = f2Moved(1,:)+size(img1,2);
h1 = vl_plotframe(f1);
h2 = vl_plotframe(f2Moved);
set(h1,'color','g','linewidth',2) ;
set(h2,'color','r','linewidth',2);
hold on
% ����scoresǰ10%
plotRatio=0.1;
for i= 1:fix(plotRatio*size(matches,2))
    idx = scoreind(i);
    line([f1(1,matches(1,idx)) f2Moved(1,matches(2,idx))],...
    [f1(2,matches(1,idx)) f2Moved(2,matches(2,idx))], 'linewidth',1, 'color','b')
end
hold off


