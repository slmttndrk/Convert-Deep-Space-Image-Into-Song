% first I clear the workspace
clc
clear

% image read
rgb_image = imread('Hubble-Massive-Panorama.png');

% convert image into the grayscale
grayscaled_image = rgb2gray(rgb_image);

% convert grayscale image into the binary form
binarizied_image = im2bw(grayscaled_image);

% created array for finding the spectrum 
pixel_spectra = [];

% looping over image
for column = 1:1024
    % created array for finding the piksels value
    pixel_detection = zeros(900,1);
    for row = 1:900
        % if piksel is one than it seems there is a nonblack thing in there
        if binarizied_image(row,column) == 1
            % calculating decreasing amplitude
            amplitude = 10 - fix(row/90);
            % assigning piksel its value
            pixel_detection(row,1) = amplitude*sin(2*pi*row);
        end
    end
    % frequency domain to time domain
    time_domain = ifft(pixel_detection,900);
    % calculating the magnitude
    magnitude = abs(time_domain);
    % adding calculations to the spectrum
    pixel_spectra = [pixel_spectra ;magnitude];   
    
end

% creating audio file
filename = 'deep_space_song.wav';
audiowrite(filename,pixel_spectra,900);

% playing with the audio
sound(pixel_spectra);
