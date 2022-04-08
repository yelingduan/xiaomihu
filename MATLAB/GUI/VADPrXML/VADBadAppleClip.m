%% ׼�������ռ�
    clc
    close all
    clear all

%% ��ȡ������Ƶ 
    filename2 = 'BadAppleClip.mp3';
    [sdata2, fs2] = audioread(filename2);
    audio2=sdata2(:,1) ;
    audio2 = audio2/max(audio2);

%% ��ʱ����Ҷ�任
    p = pspectrum(audio2,fs2,'spectrogram', ...
        'TimeResolution',0.02,'Overlap',75,'Leakage',0.875);
    psum=sum(p,1);
    psumSmooth=smooth(psum,5);
% �鿴���׵�������
    figure;
    plot(psum);

%% ������ֵ����ʼ��ʶ��
    psumS1=psumSmooth>1.1;
    pind=diff(psumS1,1)>0;
    pind=[0; pind];
    pind=find(pind>0);
% �鿴��ʼ��
    figure;
    plot(psumS1)
    hold on
    plot(pind,psumS1(pind),'ro')
    hold off
% Frame����֡��
   %��ʱ����Ҷ�ƶ��Ĳ���Ϊ0.02��*0.25����Ƶÿ��30֡
    find = fix(pind*0.25*0.02*30);
% ����Premiere�ɶ�ȡ��XML�ļ�    
    ToPrXML(find,'PrGunTest0114.xml');
