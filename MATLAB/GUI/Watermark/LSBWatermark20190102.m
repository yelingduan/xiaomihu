%% ׼�������ռ�
clc
clear all
close all
%% ��һ�� cameraman
img = imread('cameraman.tif');
imgsize=size(img);
%��ȡbitplane
bitPlane=zeros(imgsize(1),imgsize(2),8);
for i =1:8
    for ro=1:imgsize(1)
        for co=1:imgsize(2)
        bitPlane(ro,co,i)=bitget(img(ro,co), i);
        end        
    end    
end


%% �ڶ��� lena
imgW = imread('lena.jpg');
imgW=imresize(imgW,0.5);
imgWsize=size(imgW);
%��ȡbitplane
bitPlaneW=zeros(imgWsize(1),imgWsize(2),8);
for i =1:8
    for ro=1:imgWsize(1)
        for co=1:imgWsize(2)
        bitPlaneW(ro,co,i)=bitget(imgW(ro,co), i);
        end        
    end    
end
%% �����µ�bitPlane
newbitPlane=bitPlane;
newbitPlane(:,:,3) = bitPlaneW(:,:,8);
newbitPlane(:,:,2) = bitPlaneW(:,:,7);
newbitPlane(:,:,1) = bitPlaneW(:,:,6);
%% ������ͼƬ����ˮӡ��
newimg=zeros(256,256);
for i =1:8
    newimg=newimg+newbitPlane(:,:,i)*2^(i-1);
end
newimg=uint8(newimg);
figure;
imshow(newimg);

%% �鿴ˮӡͼ��ԭͼ����
%i % diffimg=newimg-img;
% % figure;
% % imagesc(diffimg)
% % colormap(gray)
% % % imshow(diffmg)

%%%%%%%%%%%%%%%%%%
%% ˮӡ��ȡ����
%��ȡbitplane
bitPlaneRec=zeros(imgsize(1),imgsize(2),8);
for i =1:8
    for ro=1:imgsize(1)
        for co=1:imgsize(2)
        bitPlaneRec(ro,co,i)=bitget(newimg(ro,co), i);
        end        
    end    
end
% ��ԭˮӡͼ
newimgW=zeros(imgsize(1),imgsize(2));
for i =1:3
    newimgW=newimgW+bitPlaneRec(:,:,i)*2^(4+i);
end

figure;
imshow(uint8(newimgW))










