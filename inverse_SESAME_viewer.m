function [amps] = inverse_SESAME_viewer(posterior, headmodel)

% inverse_SESAME_viewer produces a sample plot of the output of SESAME,
% as obtained by running inverse_SESAME
%
% Use as
%  ft_SESAME_viewer(posterior, sourcespace, headmodel)
% 
% where
%  posterior        = structure containing the output of SESAME 
%               such as in posterior = ft_inverse_SESAME(...)
%  sourcespace = coordinates of points in source space, 
%                 number of points in source space X 3
%  headmodel  = FT structure containing a head model
%               such as in headmodel = ft_prepare_headmodel(...);

                 

% Copyright (C) 2019 Gianvittorio Luria, Sara Sommariva, Alberto Sorrentino

colors = ['r','b','g','k','y','m'];
figure
amps = max(posterior.Q_estimated');
amps = amps/max(amps)*20;
sourcespace = posterior.sourcespace;

for t = posterior.final_it
  m = sum(posterior.pmap(:,t,:),3);
  subplot(3,3,[4 5 7 8])
  hold off
  plot3(sourcespace(:,1),sourcespace(:,2),sourcespace(:,3),'k.');  
  smap = sum(posterior.pmap(:,t,:),3);
  hold on
  above = smap > max(smap)*.1;
  plot3(sourcespace(above,1),sourcespace(above,2),sourcespace(above,3),'ro',...
    'linewidth',3);  
  for i = 1:numel(posterior.estimated_dipoles)
    plot3(sourcespace(posterior.estimated_dipoles(i),1),...
      sourcespace(posterior.estimated_dipoles(i),2), ...
      sourcespace(posterior.estimated_dipoles(i),3),...
      strcat('x',colors(i)),'linewidth',3,'markersize',amps(i));
  end
  title('posterior map')
  
  subplot(3,3,[1 2 3])
  plot(posterior.data','Color',[0.3 0.3 0.3])
  hold on
  plot([posterior.t_start posterior.t_start], [2*min(min(posterior.data)) 2*max(max(posterior.data))], 'r', 'linewidth',3)
  plot([posterior.t_stop posterior.t_stop], [2*min(min(posterior.data)) 2*max(max(posterior.data))], 'r', 'linewidth',3)
  axis([1 size(posterior.data,2) 1.1*min(min(posterior.data)) 1.1*max(max(posterior.data)) ])
  title('Input data')
  
  subplot(3,3,6)
  bar([0:7],posterior.mod_sel(1:8,t))  
  xlabel('N of dipoles')
  title('posterior probability')
  subplot(3,3,9)
  for i = 1:numel(posterior.estimated_dipoles)
    plot(posterior.Q_estimated(i,:),colors(i));
    hold on
  end
  xlabel('Time')
  title('Source amplitude(s)')
  pause(.25)
end