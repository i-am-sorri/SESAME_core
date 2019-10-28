
clc

%% Load sample variables:
load('vars_for_SESAME.mat');

%% set optional input parameters

cfg.t_start = 168;
cfg.t_stop = 208;

%% run SESAME

posterior = inverse_SESAME(data, LF, sourcespace, cfg);

%% save result

TIME = clock;
save(strcat([date,'_',num2str(TIME(4)),num2str(TIME(5)),num2str(TIME(6)),'_SESAME.mat']),'posterior');


%% visualization

inverse_SESAME_viewer(posterior);