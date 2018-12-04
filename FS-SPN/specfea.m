% Copyright Notice: 
% 1) The noise extraction code is based on the Jessica team's open source code:
% 		http://dde.binghamton.edu/download/camera_fingerprint/
% 2) The noise extraction code also based on "Guided image filtering".

% 3) This code is based on our previous works： 
% Le-Bing Zhang, Fei Peng, Min Long 'Face Morphing Detection Using Fourier Spectrum of Sensor Pattern Noise', ICME, 2018.
% Le-Bing Zhang, Fei Peng, Min Long 'Identifing source camera using guided image estimation and block weighted average', JVCIR, 2016.

% Please follow the copyright requirements stated in the original code and quote the original paper.

function specfea = specfea(OriginImage,r_num,theta_num)

pSensorNoise=NoiseExtractFromImage_GIF(OriginImage);

[M, N] = size(pSensorNoise);

S1 = fftshift(fft2(double(pSensorNoise))); 
S = log(abs(S1)+1); 

[M, N] = size(S1);
minsize=min(M,N);
x0 = M/2 + 1;
y0 = N/2 + 1;

r=ceil(sqrt((M/2)^2+(N/2)^2)); 
delt=r-floor(M/2); 
rec=zeros(2*r);
rec(delt:2*r-delt,delt:2*r-delt)=1;


radDelta = round(linspace(0,minsize/2,r_num+1)); 
angDelta = 180/theta_num;

k=0;
specfe = [S1(x0, y0)];

for ang = 1:theta_num
    for rad = 1:r_num
        k=k+1;
        SectMask = Generate_SectMask(minsize, minsize, y0, x0, -180+(ang-1)*angDelta, -180+ang*angDelta, radDelta(rad), radDelta(rad+1)); 
        
        [segMn,segNn] = find(SectMask == 1); 
        num = length(segMn);
        segSpec = double(SectMask).* abs(S1); 
        
        seg = segSpec(sub2ind(size(segSpec),segMn,segNn));
       
        segMean = sum(seg(:))/num;
        segStd = sum((seg(:)-segMean).^2)/num;
        specfe = [specfe segMean segStd];
       
        
    end

end

specfea = specfe;



