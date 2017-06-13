function verify_blockbased_decoding_from_zigzag_scanned
% 
% function verify_blockbased_decoding_from_zigzag_scanned
%

% Stefan Wehr, 2005


height		= 8;			% input image height: 8 pixel
width		= 6;			% input image width:  6 pixel
blocksize	= 2;			% blocksize

zigzag_scanned	= [	...		% input
	  1  2  7  8;	...
	  3  4  9 10;	...
	  5  6 11 12;	...
	 13 14 19 20;	...
	 15 16 21 22;	...
	 17 18 23 24;	...
	 25 26 31 32;	...
	 27 28 33 34;	...
	 29 30 35 36;	...
	 37 38 43 44;	...
	 39 40 45 46;	...
	 41 42 47 48	];

output_image	= [		...	% expected output_image
	 1  2  3  4  5  6;	...
	 7  8  9 10 11 12;	... 
	13 14 15 16 17 18;	...
	19 20 21 22 23 24;	...
	25 26 27 28 29 30;	...
	31 32 33 34 35 36;	...
	37 38 39 40 41 42;	...
	43 44 45 46 47 48	];

your_output_image = blockbased_decoding_from_zigzag_scanned(zigzag_scanned,blocksize,width,height);


fprintf('\n\n')
fprintf('image height:  %d\n',height)
fprintf('image width:   %d\n',width)
fprintf('blocksize:     %d\n',blocksize)

fprintf('\n\ngiven zigzag_scanned:\n\n')
disp(zigzag_scanned);

fprintf('\nexpected output_image:\n\n')
disp(output_image);

fprintf('\nyour output_image:\n\n')
disp(your_output_image);

if isequal(output_image,your_output_image)
	fprintf('\n OK !!!\n\n')
else
	fprintf('\n ERROR !!!\n\n')
end
