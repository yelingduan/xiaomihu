%��ȡ�Ҷ�ͼƬ
original=imread('scene.pgm');
distorted=imread('book.pgm');

% ������ȡ
% ptsOriginal  = detectSURFFeatures(original);
% ptsDistorted = detectSURFFeatures(distorted);
ptsOriginal  = detectBRISKFeatures(original,'MinContrast',0.01);
ptsDistorted = detectBRISKFeatures(distorted,'MinContrast',0.01);

[featuresOriginal,validPtsOriginal] = ...
            extractFeatures(original,ptsOriginal);
[featuresDistorted,validPtsDistorted] = ...
            extractFeatures(distorted,ptsDistorted);

%����ƥ��        
indexPairs = matchFeatures(featuresOriginal,featuresDistorted,'MatchThreshold',50,'MaxRatio',0.8);

matchedOriginal  = validPtsOriginal(indexPairs(:,1));
matchedDistorted = validPtsDistorted(indexPairs(:,2));

figure
showMatchedFeatures(original,distorted,matchedOriginal,matchedDistorted)
title('Candidate matched points (including outliers)')

% ���㼸�α任
[tformTotal,inlierDistortedXY,inlierOriginalXY] = ...
    estimateGeometricTransform(matchedDistorted,...
        matchedOriginal,'similarity');

figure
showMatchedFeatures(original,distorted,inlierOriginalXY,inlierDistortedXY)
title('Matching points (inliers only)')
legend('ptsOriginal','ptsDistorted')

%Ӧ�ü��α任
outputView = imref2d(size(original));
recovered  = imwarp(distorted,tformTotal,'OutputView',outputView);

figure;
imshowpair(original,recovered,'montage')

