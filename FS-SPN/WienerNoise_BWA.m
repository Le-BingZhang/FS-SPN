% Copyright Notice: 
% 1) The noise extraction code is based on the Jessica team's open source code:
% 		http://dde.binghamton.edu/download/camera_fingerprint/
% 2) The noise extraction code also based on "Guided image filtering".

% 3) This code is based on our previous works： 
% Le-Bing Zhang, Fei Peng, Min Long 'Face Morphing Detection Using Fourier Spectrum of Sensor Pattern Noise', ICME, 2018.
% Le-Bing Zhang, Fei Peng, Min Long 'Identifing source camera using guided image estimation and block weighted average', JVCIR, 2016.

% Please follow the copyright requirements stated in the original code and quote the original paper.

function [tc, coefVar]=WienerNoise_BWA(coef,NoiseVar)
%Input: 
%   coef:          Wavelet detailed coefficient at certain level
%   NoiseVar:      Variance of the additive noise
%Output:
%   tc:            Extracted noise coefficient

% Estimate the variance of original noise-free image for each wavelet
tc = coef.^2;
coefVar = Threshold(filter2(ones(3,3)/(3*3), tc), NoiseVar);
% Wiener filter like attenuation
tc = coef.*NoiseVar./(coefVar+NoiseVar);