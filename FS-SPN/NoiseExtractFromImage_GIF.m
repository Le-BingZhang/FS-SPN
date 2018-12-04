% Copyright Notice: 
% 1) The noise extraction code is based on the Jessica team's open source code:
% 		http://dde.binghamton.edu/download/camera_fingerprint/
% 2) The noise extraction code also based on "Guided image filtering".

% 3) This code is based on our previous works£º 
% Le-Bing Zhang, Fei Peng, Min Long 'Face Morphing Detection Using Fourier Spectrum of Sensor Pattern Noise', ICME, 2018.
% Le-Bing Zhang, Fei Peng, Min Long 'Identifing source camera using guided image estimation and block weighted average', JVCIR, 2016.

% Please follow the copyright requirements stated in the original code and quote the original paper.

function Noise = NoiseExtractFromImage_GIF(image) 
% imguidedfilter is Matlab 2014 function.

if ischar(image), X = imread(image); else X = image; clear image, end
[M0,N0,three]=size(X);
X = double(X); 

NoiseVar = 9;
if three~=3,
    X2 = imguidedfilter(X/255,X/255,'NeighborhoodSize',3);
    I3 = X - X2*255;
    Noise = WienerNoise_BWA(I3,NoiseVar); % sigma =3;NoiseVar = sigma^2;
else
    Noise = zeros(size(X));
    for j=1:3
        X2 = imguidedfilter(X(:,:,j)/255,X(:,:,j)/255,'NeighborhoodSize',3);
        I3 = X(:,:,j) - X2*255;
        Noise(:,:,j) = WienerNoise_BWA(I3,NoiseVar);

        
    end
    Noise = rgb2gray1(Noise);  
end

end
