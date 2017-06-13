% verify mse_of_frame function

function []=verify_mse_of_frame();

%test_image = double(imread('cameraman.tif'))/255;
test_image = yuv_read_one_frame('flowergarden_short_cif.yuv',1,352,288);

% load uniformly distributed noise
% generated by: 
% noise = rand(size(test_image))-0.5;
% also loads correct values test_mse
load mse_psnr_verification_noise; 

% open new figure
figure;
set(gcf,'position',[150 550 1200 300]);
your_mse = NaN * zeros(1,4);
for l=1:4
  noisy_image = test_image + (l-1)*0.1*noise;
  your_mse(l) =  mse_of_frame(test_image,noisy_image);
  eval(['subplot(14' num2str(l) ')']);
  imshow(noisy_image)
  title(['MSE: ' num2str(10*log10_special(test_mse(l))) ' dB'])
  xlabel(['your MSE: ' num2str(10*log10_special(your_mse(l))) ' dB'])
end

if any(your_mse<0)
  error('MSE value < 0 should never happen! Is output in dB instead of linear values?')
end
% wen don't check for equality to take into account rounding operations
if (any(abs(your_mse-test_mse)>10e-12))
  error('wrong MSE values! Check function! Is output in dB instead of linear values?')
end
disp('function mse_of_frame is ok!')

% I don't want any log_of_zero warnings here!
function y = log10_special(x)
if(x == 0)
  y = -inf;
else
  y = log10(x);
end

if(0)
  % used to save correct/expected values
  test_mse = your_mse;
  save mse_psnr_verification_noise noise test_mse test_psnr;
end
