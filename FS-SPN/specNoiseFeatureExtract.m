
% Copyright Notice: 
% 1) The noise extraction code is based on the Jessica team's open source code:
% 		http://dde.binghamton.edu/download/camera_fingerprint/
% 2) The noise extraction code also based on "Guided image filtering".

% 3) This code is based on our previous works： 
% Le-Bing Zhang, Fei Peng, Min Long 'Face Morphing Detection Using Fourier Spectrum of Sensor Pattern Noise', ICME, 2018.
% Le-Bing Zhang, Fei Peng, Min Long 'Identifing source camera using guided image estimation and block weighted average', JVCIR, 2016.

% Please follow the copyright requirements stated in the original code and quote the original paper.

function spec_noise_feature=specNoiseFeatureExtract(path1)
im = imread(path1);
[m,n,three]=size(im);
minsize=min(m,n);

im2=imcropmiddle(im,[minsize,minsize]);
[m,n,three]=size(im2);

spec_noise_feature=specfea(im2,8,9);
