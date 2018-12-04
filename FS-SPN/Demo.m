% Copyright Notice: 
% 1) The noise extraction code is based on the Jessica team's open source code:
% 		http://dde.binghamton.edu/download/camera_fingerprint/
% 2) The noise extraction code also based on "Guided image filtering".

% 3) This code is based on our previous works£º 
% Le-Bing Zhang, Fei Peng, Min Long 'Face Morphing Detection Using Fourier Spectrum of Sensor Pattern Noise', ICME, 2018.
% Le-Bing Zhang, Fei Peng, Min Long 'Identifing source camera using guided image estimation and block weighted average', JVCIR, 2016.

% Please follow the copyright requirements stated in the original code and quote the original paper.

spec_noise_feature = specNoiseFeatureExtract('67a.jpg')