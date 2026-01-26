%% Distortion-Balancing Parameterization
% (Balancing between angle and area distortion)
%
% Main program:
% [uv, VB, VI] = DiskBEM(F, V)
% [uv, VB, VI] = SquareBEM(F, V)
% 
% Required Input:
% F: #F x 3 triangulations of an open triangle mesh
% V: #V x 3 vertex coordinates of an open triangle mesh
%
% Output:
% uv: #V x 2 vertex coordinates of the disk(sqreare)-shaped distortion-balancing map
% VB: indices of boundary vertices
% VI: indices of interior vertices
% 
% Remark:
% If you use this code in your own work, please cite the following paper:
% [1] S.-Y. Liu, and M.-H. Yueh, "Energy-Based Distortion-Balancing 
%      Parameterization for Open Surfaces"
% doi: 10.1137/24M1708437
%
% License:
% This software is released for academic and research purposes only.
% Commercial use is not permitted without prior written permission from the authors.
% Copyright (c), Shu-Yung Liu and Mei-Heng Yueh



%% Example: Bunny
clear; clc;
load('StanfordBunny.mat')
plot_mesh(F, V);
title('Original Surface');


% Disk-shaped parameterization 
uv = DiskBEM(F, V);     
distortion(F, V, uv);
plot_mesh(F, uv);
title('Distortion Balancing Map');


% Square-shaped parameterization 
uv = SquareBEM(F, V);
distortion(F, V, uv);
plot_mesh(F, uv);
title('Distortion Balancing Map');