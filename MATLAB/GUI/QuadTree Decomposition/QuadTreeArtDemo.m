%% ׼��ͼ������
% ��ȡ
Io=imread('mianjin.jpg');
% ����Ϊ������
Io=imresize(Io,[512 512]);
% ��ɫת�Ҷ�
I = rgb2gray(Io);

%% ͼ���Ĳ����ָ�
S = qtdecomp(I,.1);

%% ������ͼ��
newimg=zeros(size(Io));
for i=1:3 
    newimg(:,:,i)=getblocks(S,Io(:,:,i));
end
newimg=uint8(newimg);

%��ͼ���
figure(3);
imshow(Io)
title('ԭͼ')
figure(4);
imshow(newimg)
title('�Ĳ�������ͼ')

