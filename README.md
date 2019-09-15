#  CONVERTING A DEEP SPACE IMAGE INTO SPACE SOUND

<br />

 * In this repository, I converted a Hubble deep space image into space sound. I examined the
image as columns. Starting from the first column I examined each pixel whether it is black or
not. I divided 900 pixels in the column into 10 parts. Starting from the bottom of the picture,
index parts are in decreasing order from 10 to 1. If a non-black pixel exists in any part, I created
an amplitude in the nth pixel frequency with index of the part amplitude. By applying these
rules, I had different amplitudes from 0 to 900 Hz. After I created 1024 spectra that have
different amplitudes from 0-900 Hz, I converted each of them into time domain. Duration of
each spectrum is 1 second. I concatenated each one-second wav files one after another and I
created a "deep_space_song.wav" that has length of 1024 seconds. I named that script
as "SonifiedDeepSpace.m"

<br />
	
  * I will explain the code part by part.First, I clean the workspace. And then , I read 
"Hubble-Massive-Panorama.png" by using imread() function. And, I assigned it to the "rgb_image" 
variable.Then, I converted rgb_image to the grayscale by using "rgb2gray()" function. And, I
assigned it to the "grayscaled_image" variable.

<br />
	
  * After that, I converted grayscaled_image to the binary image by using "im2bw()" function.
And, I assigned it to the "binarizied_image" variable. I do that because now our array includes
only ones and zeros in it. Ones mean there is a nonblack pixel and zeros mean there is a black
pixel in that pixel.

<br />

  * Then, I looped over the image. To detect the values, I created a dummy array
"pixel_detection" and I controlled every pixel if they have any nonblack thing or not. If they
have, then it would give into the if statement and I calculate the amplitude and value of that
piksel. And, I first convert the result to the time domain with using "ifft". After that, I
calculated the magnitude of it. I used "abs" and added all calculations into the "pixel_spectra" array.
Finally, I created the audio file using pixel_spectra. And I gave "deep_space_song.wav"
name to the sound.
