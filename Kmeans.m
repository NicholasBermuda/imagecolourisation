function [Z,m_k] = Kmeans(B,k)
%Kmeans Uses k-means clustering to classify greyscale pixels into k clusters
%We can use this to segment the image
% INPUTS:
%   B: (height x width) array containing greyscale doubles; a `single
%   layer' of the normal image array
%   k: number of clusters to segment the image into
% OUTPUTS:
%   Z: the cluster number that each pixel is applied to
%   m_k: the cluster means

% get the size of the image, reshape it
S = size(B);
N = S(1)*S(2);
x_n = B(:); % a list of flattened pixels
% and determine the number of divisions needed
divisions = floor(N/k);

% create a vector of initial means based on the number of clusters
% let's just linearly space them so we get some nice coverage
m_k = linspace(1,255,k);

% define indicator variables and assign pixels randomly to clusters
z_nk = zeros(N,k);
z_nk(1:divisions,1) = 1;
for j = 1:k-1
    z_nk(j*divisions+1:(j+1)*divisions,j+1) = 1;
end
z_nk(end,end-mod(N,k):end) = 1;

% flags for convergence
converged = false;
count = 0;

while converged == 0
    old_znk = z_nk;
    % assignment step
    for n = 1:N
        % measure the current best k and its minimum 
        current_min = 1e10;
        best_k = 0;
        % which x are we testing
        this_x = x_n(n,:);
        for j = 1:k
            % test this x against all m_ks
            this_mk = m_k(j);
            this_min = norm(this_x - this_mk)^2;
            % if this is the closest so far, record it
            if this_min < current_min
                current_min = this_min;
                best_k = j;
            end
        end
        % assign x_n to closest cluster k
        z_nk(n,:) = 0;
        z_nk(n,best_k) = 1;
    end
    % cluster mean step
    for j = 1:k
        % find the new cluster means
        denominator = sum(z_nk(:,j));
        numerator = 0;
        for n = 1:N
            numerator = numerator + z_nk(n,j)*x_n(n);
        end
        m_k(j) = numerator/denominator;
    end
    
    % decide if we've converged
    % converged if we made no new assignments this iteration
    if max(max(abs(old_znk - z_nk))) < 1
        converged = true;
    end
    % raise a warning if we do way too many steps
    if count > 5000
        warning('K means taking more than 5000 iterations to converge')
        disp('If you want to stop, kill the process and choose different k')
    end
end

% replace pixels with the cluster label they've been assigned to
Z  = zeros(N,1);
for i = 1:N
   % find which cluster the pixel is in
   [~, index] = max(z_nk(i,:));
   % replace with cluster mean
   Z(i,:) = index;
end

% reshape back to the original size image
Z = reshape(Z,[S(1) S(2)]);

end

