close all
% here is a test script to outline the procedure so as to clarify how the
% functions interact with each other

% import the picture, peek
A = imread('food.png');
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
p_grid = pickgrid(S,N);

% add colour from rand, grid; peek
C_rand = add_sparse_colour(A,B,p_rand);
% C_grid = add_sparse_colour(A,B,p_grid);
figure; imshow(C_rand);
% figure; imshow(C_grid);

% pick the basis function to use, parameters for recolourisation
params = [100; % sigma_1
          100; % sigma_2
          0.5; % p
          1e-4;]; % delta

% nic's opt
%params = [20.8549;594.4899;1.0011;1.5173e-07];

% feb 21 opt of gaussian (see .mat file for others)
params = [25.715;332.5164;0.9515;3.6849e-07]; % 1% grid and food.png
params = [18.2521;444.179;0.9905;3.8794e-07]; % 2% grid and food.png

load 'optimalparammatrix.mat' optimalparammatrix
% column 1 is optimal for 0.25%, then 0.5%,... 4%.

rbf=1; % phi_form_index (1 for gaussian, 2 for cpt)

% colourise the image, peek
D_rand = colourise(A,B,p_rand,rbf,params);
D_grid = colourise(A,B,p_grid,rbf,params);
figure; imshow(D_grid);

% this stuff below does the optimization for food.png
%tic
%optimal_params = optimise(A,B,p_rand,2,rbf,params,50)
%optimal_params = optimise(A,B,p_grid,2,rbf,params,20)

%percents = [0.25, 0.5, 1, 2, 4];
%bestguesses = [params,params,params,params,params]; % if you know nothing
load 'optimalparammatrix.mat' optimalparammatrix
%bestguesses = optimalparammatrix; % if you've done it before and want to optimize from there
%optimalparammatrix = optimalparamvariation(A,B,2,rbf,params,percents,'grid',10,bestguesses)
%toc
%save 'optimalparammatrix.mat' optimalparammatrix % this is the best I've gotten
