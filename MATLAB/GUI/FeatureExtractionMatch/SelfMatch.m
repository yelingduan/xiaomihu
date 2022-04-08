%뗍혤뿍똑暠튬
original=imread('scene.pgm');
distorted=imread('book.pgm'); 

% 景瀝瓊혤
% ptsOriginal  = detectSURFFeatures(original);
% ptsDistorted = detectSURFFeatures(distorted);
ptsOriginal  = detectBRISKFeatures(original,'MinContrast',0.01);
ptsDistorted = detectBRISKFeatures(distorted,'MinContrast',0.01);

[featuresOriginal,validPtsOriginal] = ...
            extractFeatures(original,ptsOriginal);
[featuresDistorted,validPtsDistorted] = ...
            extractFeatures(distorted,ptsDistorted);

%景瀝튈토        
indexPairs = matchFeatures(featuresOriginal,featuresDistorted,'MatchThreshold',50,'MaxRatio',0.8);

matchedOriginal  = validPtsOriginal(indexPairs(:,1));
matchedDistorted = validPtsDistorted(indexPairs(:,2));

figure
showMatchedFeatures(original,distorted,matchedOriginal,matchedDistorted)
title('Candidate matched points (including outliers)')

% 셕炬섯부긴뻣
[tformTotal,inlierDistortedXY,inlierOriginalXY] = ...
    estimateGeometricTransform(matchedDistorted,...
        matchedOriginal,'similarity');

figure
showMatchedFeatures(original,distorted,inlierOriginalXY,inlierDistortedXY)
title('Matching points (inliers only)')
legend('ptsOriginal','ptsDistorted')

%壇痰섯부긴뻣
outputView = imref2d(size(original));
recovered  = imwarp(distorted,tformTotal,'OutputView',outputView);

figure;
imshowpair(original,recovered,'montage')

