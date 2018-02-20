clear; close all
% here is a test script to outline the procedure so as to clarify how the
% functions interact with each other

% import the picture, peek
A = imread('lake.png');
figure; imshow(A);

% make a greyscale copy, peek
B = colour2grey(A);
figure; imshow(B);

% pick a random seed of 1 so we can reproduce the same results each time
s = rng(generaterandoms(1));

% figure out the size of the image, number of pts to add colour to
S = size(A(:,:,1));
N = round(2*S(1)*S(2)/100); % add colour to one percent of the pixels

% pick some random pts, some grid pts
p_rand = pickrandom(S,N);
% p_grid = pickgrid(S,N);

% add colour from rand, grid; peek
C_rand = add_sparse_colour(A,B,p_rand);
% C_grid = add_sparse_colour(A,B,p_grid);
figure; imshow(C_rand);
% figure; imshow(C_grid);

% pick the basis function to use, parameters for recolourisation
params = [100; % sigma_1
          100; % sigma_2
          0.5; % p
          1; % phi_form_index
          1e-4;]; % delta
%x =[20.8549;594.4899;1.0011;1;1.5173e-07];
% colourise the image, peek
D_rand = colourise(A,B,p_rand,x);
% D_grid = colourise(A,B,p_grid,params);
figure; imshow(D_rand);
% figure; imshow(D_grid);
