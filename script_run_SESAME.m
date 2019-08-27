
clc

%% Load sample variables:
load('var_for_SESAME.mat');

%% prepare variables from existing structures

sourcespace = lf.pos;
LF = zeros(size(lf.leadfield{1},1),size(lf.leadfield,2)*3);
for i = 1:size(lf.leadfield,2)
  LF(:,3*i-2:3*i) = lf.leadfield{i};
end

cfg.t_start = 160;
cfg.t_stop = 200;

%% run SESAME

posterior = inverse_SESAME(timelock.avg, LF, sourcespace, cfg);

%% save result

TIME = clock;
save(strcat([date,'_',num2str(TIME(4)),num2str(TIME(5)),num2str(TIME(6)),'_SESAME.mat']),'posterior');


%% visualization

inverse_SESAME_viewer(posterior, headmodel);