function ut_out = plot_en1_comps_phys_nodes_thesis(yp_max,...
mu_p1,moser_p1,ut_moser_p1,moser_fluc_p1,...
mean_en_p1,mean_plus_en_p1,ut_en_p1,fluc_en_p1,fluc_plus_en_p1,yele_en_p1,...
ys_en_p1,tot_en_p1,u_en_p1,en_en_p1,...
leg,myTitle,save_pics,pic_dir,pic_file)
%% Plot en, en2, en3

% function plot_en_yu(mu,moser,ut_moser,moser_fluc,mean_en,mean_plus_en,ut_en,fluc_en,fluc_plus_en,yele_en,mean_poly,mean_plus_poly,ut_poly,fluc_poly,fluc_plus_poly,leg,myTitle)
ut_out = 0; %[ut_en,ut_en2];

beg=1;
n = 1;
pts=[1:beg,1:n:length(mean_en_p1(:,1))];
pts = 2:n:length(mean_en_p1(:,1));

fpts=[1:length(mean_en_p1(:,1))/2];

yp1_out_p1 = (yele_en_p1(2)+1)*ut_en_p1/mu_p1 ;


moser_sym = 'k-';
en_sym = 'r-';
en2_sym = 'b:';
en3_sym = '-.';

en_sym_pt = 'r^';
en2_sym_pt = 'bo';
en3_sym_pt = 's';

% figure
% hold on
% plot(mean_en_p1(pts,1),mean_en_p1(pts,8),en2_sym)
% plot(ys_en_p1+1,tot_en_p1,en2_sym_pt)
% set(gca,'xtick',yele_en_p1+1)
% grid on
% xlabel('y')
% ylabel('u')
% title(myTitle)
% xlim([0,0.4])
% set(gca,'XTickLabel',[], 'YTick', [])

figure
% plot(moser(:,1),moser(:,3)*ut_moser,'k-o')
hold on
plot(mean_en_p1(pts,1),mean_en_p1(pts,8),en_sym)
plot(mean_en_p1(pts,1),mean_en_p1(pts,5),en2_sym)
plot(mean_en_p1(pts,1),mean_en_p1(pts,6),en3_sym,'color',[0 0.5 0])
plot(ys_en_p1+1,tot_en_p1,en_sym_pt)
plot(ys_en_p1+1,u_en_p1,en2_sym_pt)
plot(ys_en_p1+1,en_en_p1,en3_sym_pt,'color',[0 0.5 0])
% semilogx(mean_en(pts,1),mean_en(pts,8),'b-*')
% % semilogx(mean_en(:,1),mean_en(:,5),'c-.')
% % semilogx(mean_en(:,1),mean_en(:,6),'r-.')
% semilogx(mean_en2(pts,1),mean_en2(pts,8),'r-.')
set(gca,'xtick',yele_en_p1+1)
grid on
legend(leg,'Location','East')
xlabel('y')
ylabel('u')
title(myTitle)
xlim([0,0.4])
% set(gca,'XTickLabel',[], 'YTick', [])
set(gcf,'Position',[100,100,1000,600])
if save_pics
print(gcf,pic_dir+"/"+pic_file+'_phys.png','-dpng','-r500');   
end
% 
% shift = 4;
% moser_sym = 'k-';
% en_sym = 'r:';
% en2_sym = 'b-.';
% en3_sym = '--';
% 
% en_sym_pt = 'r^';
% en2_sym_pt = 'bo';
% en3_sym_pt = 's';
% 
% 
figure
% semilogx(moser_p1(:,2),moser_p1(:,3),moser_sym)
semilogx(mean_plus_en_p1(pts,1),mean_plus_en_p1(pts,8),en_sym)
hold on
semilogx(mean_plus_en_p1(pts,1),mean_plus_en_p1(pts,5),en2_sym)
semilogx(mean_plus_en_p1(pts,1),mean_plus_en_p1(pts,6),en3_sym,'color',[0 0.5 0])

plot((ys_en_p1+1)*ut_en_p1/mu_p1,tot_en_p1/ut_en_p1,en_sym_pt)
plot((ys_en_p1+1)*ut_en_p1/mu_p1,u_en_p1/ut_en_p1,en2_sym_pt)
plot((ys_en_p1+1)*ut_en_p1/mu_p1,en_en_p1/ut_en_p1,en3_sym_pt,'color',[0 0.5 0])

% semilogx(ones(1,2)*(yele_en_p1(2)+1)*ut_en_p1/mu_p1,[-1,yp_max],'k--','LineWidth',1)
xlim([0.1,max(moser_p1(:,2))])
ylim([-1,yp_max])
% set(gca,'xtick',[(yele_en_p1(1:2)+1)*ut_en_p1/mu_p1,(yele_en_p2(1:2)+1)*ut_en_p2/mu_p2,(yele_en_p3(1:2)+1)*ut_en_p3/mu_p3])
grid on
legend(leg,'Location','NorthWest')
xlabel('y^+')
ylabel('u^+')
title(myTitle)
set(gcf,'Position',[100,100,1000,600])
if save_pics
print(gcf,pic_dir+"/"+pic_file+'_plus.png','-dpng','-r500');   
end
