function ut_out = plot_stack3_en3_rms_paper(yp_max,...
mu_p1,moser_p1,ut_moser_p1,moser_fluc_p1,...
mean_en_p1,mean_plus_en_p1,ut_en_p1,fluc_en_p1,fluc_plus_en_p1,yele_en_p1,...
ys_en_p1,urms_en_p1,vrms_en_p1,wrms_en_p1,uvrms_en_p1,umen_en_p1,...
mean_en2_p1,mean_plus_en2_p1,ut_en2_p1,fluc_en2_p1,fluc_plus_en2_p1,yele_en2_p1,...
ys_en2_p1,urms_en2_p1,vrms_en2_p1,wrms_en2_p1,uvrms_en2_p1,umen_en2_p1,...
mean_en3_p1,mean_plus_en3_p1,ut_en3_p1,fluc_en3_p1,fluc_plus_en3_p1,yele_en3_p1,...
ys_en3_p1,urms_en3_p1,vrms_en3_p1,wrms_en3_p1,uvrms_en3_p1,umen_en3_p1,...
mu_p2,moser_p2,ut_moser_p2,moser_fluc_p2,...
mean_en_p2,mean_plus_en_p2,ut_en_p2,fluc_en_p2,fluc_plus_en_p2,yele_en_p2,...
ys_en_p2,urms_en_p2,vrms_en_p2,wrms_en_p2,uvrms_en_p2,umen_en_p2,...
mean_en2_p2,mean_plus_en2_p2,ut_en2_p2,fluc_en2_p2,fluc_plus_en2_p2,yele_en2_p2,...
ys_en2_p2,urms_en2_p2,vrms_en2_p2,wrms_en2_p2,uvrms_en2_p2,umen_en2_p2,...
mean_en3_p2,mean_plus_en3_p2,ut_en3_p2,fluc_en3_p2,fluc_plus_en3_p2,yele_en3_p2,...
ys_en3_p2,urms_en3_p2,vrms_en3_p2,wrms_en3_p2,uvrms_en3_p2,umen_en3_p2,...
mu_p3,moser_p3,ut_moser_p3,moser_fluc_p3,...
mean_en_p3,mean_plus_en_p3,ut_en_p3,fluc_en_p3,fluc_plus_en_p3,yele_en_p3,...
ys_en_p3,urms_en_p3,vrms_en_p3,wrms_en_p3,uvrms_en_p3,umen_en_p3,...
mean_en2_p3,mean_plus_en2_p3,ut_en2_p3,fluc_en2_p3,fluc_plus_en2_p3,yele_en2_p3,...
ys_en2_p3,urms_en2_p3,vrms_en2_p3,wrms_en2_p3,uvrms_en2_p3,umen_en2_p3,...
mean_en3_p3,mean_plus_en3_p3,ut_en3_p3,fluc_en3_p3,fluc_plus_en3_p3,yele_en3_p3,...
ys_en3_p3,urms_en3_p3,vrms_en3_p3,wrms_en3_p3,uvrms_en3_p3,umen_en3_p3,...
leg,myTitle,save_pics,pic_dir,pic_file)
%% Plot en, en2, en3

% function plot_en_yu(mu,moser,ut_moser,moser_fluc,mean_en,mean_plus_en,ut_en,fluc_en,fluc_plus_en,yele_en,mean_poly,mean_plus_poly,ut_poly,fluc_poly,fluc_plus_poly,leg,myTitle)
ut_out = 0; %[ut_en,ut_en2];

beg=1;
n = 10;
pts=[1:beg,1:n:length(mean_en_p1(:,1))];
pts = 2:n:length(mean_en_p1(:,1));

fpts=[1:length(mean_en_p1(:,1))/2];

yp1_out_p1 = (yele_en_p1(2)+1)*ut_en_p1/mu_p1 ;
yp1_out_p2 = (yele_en_p2(2)+1)*ut_en_p2/mu_p2 ;
yp1_out_p3 = (yele_en_p3(2)+1)*ut_en_p2/mu_p3 ;

ut_out = [ut_en_p1,ut_en2_p1,ut_en3_p1;...
          ut_en_p2,ut_en2_p2,ut_en3_p2;...
          ut_en_p3,ut_en2_p3,ut_en3_p3];
% 
% figure
% plot(moser(:,1),moser(:,3)*ut_moser,'k-o')
% hold on
% semilogx(mean_en(pts,1),mean_en(pts,8),'b-*')
% % semilogx(mean_en(:,1),mean_en(:,5),'c-.')
% % semilogx(mean_en(:,1),mean_en(:,6),'r-.')
% semilogx(mean_en2(pts,1),mean_en2(pts,8),'r-.')
% set(gca,'xtick',yele_en+1)
% grid on
% legend(leg,'Location','SouthEast')
% xlabel('y')
% ylabel('u_{mean}')
% title(myTitle)
% xlim([0,1])

shift = 4;
moser_sym = 'k-';
en_sym = 'r:';
en_sym_pt = 'r+';
en2_sym = 'b-.';
en2_sym_pt = 'bo';
en3_sym = 'g--';
en3_sym_pt = 'gs';


figure
semilogx(moser_p1(:,2),moser_p1(:,3),moser_sym)
hold on
semilogx(mean_plus_en_p1(fpts,1),mean_plus_en_p1(fpts,8),en_sym)
semilogx(mean_plus_en2_p1(fpts,1),mean_plus_en2_p1(fpts,8),en2_sym)
semilogx(mean_plus_en3_p1(fpts,1),mean_plus_en3_p1(fpts,8),en3_sym)
semilogx(moser_p2(:,2),moser_p2(:,3)+shift,moser_sym)
semilogx(mean_plus_en_p2(fpts,1),mean_plus_en_p2(fpts,8)+shift,en_sym)
semilogx(mean_plus_en2_p2(fpts,1),mean_plus_en2_p2(fpts,8)+shift,en2_sym)
semilogx(mean_plus_en3_p2(fpts,1),mean_plus_en3_p2(fpts,8)+shift,en3_sym)
semilogx(moser_p3(:,2),moser_p3(:,3)+2*shift,moser_sym)
semilogx(mean_plus_en_p3(fpts,1),mean_plus_en_p3(fpts,8)+2*shift,en_sym)
semilogx(mean_plus_en2_p3(fpts,1),mean_plus_en2_p3(fpts,8)+2*shift,en2_sym)
semilogx(mean_plus_en3_p3(fpts,1),mean_plus_en3_p3(fpts,8)+2*shift,en3_sym)
% semilogx(ones(1,2)*(yele_en_p1(2)+1)*ut_en_p1/mu_p1,[-1,yp_max],'k--','LineWidth',1)
% semilogx(ones(1,2)*(yele_en_p2(2)+1)*ut_en_p2/mu_p2,[-1,yp_max],'k--','LineWidth',1)
% semilogx(ones(1,2)*(yele_en_p3(2)+1)*ut_en_p3/mu_p3,[-1,yp_max],'k--','LineWidth',1)
xlim([0.1,max(moser_p3(:,2))])
ylim([-1,yp_max])
% set(gca,'xtick',[(yele_en_p1(1:2)+1)*ut_en_p1/mu_p1,(yele_en_p2(1:2)+1)*ut_en_p2/mu_p2,(yele_en_p3(1:2)+1)*ut_en_p3/mu_p3])
grid on
legend(leg,'Location','NorthWest')
xlabel('y^+')
ylabel('u^+')
title(myTitle)
set(gcf,'Position',[100,100,1000,600])
if save_pics
print(gcf,pic_dir+"/"+pic_file+'.png','-dpng','-r500');   
end


shift = 4;
figure
plot(moser_fluc_p1(:,2),moser_fluc_p1(:,3),moser_sym)
hold on
% plot(fluc_en_p1(fpts,2),fluc_en_p1(fpts,3)/ut_en_p1^2,en_sym)
plot((ys_en_p1+1).*ut_en_p1/mu_p1,(urms_en_p1-(umen_en_p1).^2)./ut_en_p1.^2,en_sym_pt)
plot((ys_en2_p1+1).*ut_en2_p1/mu_p1,(urms_en2_p1-(umen_en2_p1).^2)./ut_en2_p1.^2,en2_sym_pt)
plot((ys_en3_p1+1).*ut_en3_p1/mu_p1,(urms_en3_p1-(umen_en3_p1).^2)./ut_en3_p1.^2,en3_sym_pt)
plot(moser_fluc_p2(:,2),moser_fluc_p2(:,3)+shift,moser_sym)
plot((ys_en_p2+1).*ut_en_p2/mu_p2,(urms_en_p2-(umen_en_p2).^2)./ut_en_p2.^2+shift,en_sym_pt)
plot((ys_en2_p2+1).*ut_en2_p2/mu_p2,(urms_en2_p2-(umen_en2_p2).^2)./ut_en2_p2.^2+shift,en2_sym_pt)
plot((ys_en3_p2+1).*ut_en3_p2/mu_p2,(urms_en3_p2-(umen_en3_p2).^2)./ut_en3_p2.^2+shift,en3_sym_pt)
plot(moser_fluc_p3(:,2),moser_fluc_p3(:,3)+2*shift,moser_sym)
plot((ys_en_p3+1).*ut_en_p3/mu_p3,(urms_en_p3-(umen_en_p3).^2)./ut_en_p3.^2+2*shift,en_sym_pt)
plot((ys_en2_p3+1).*ut_en2_p3/mu_p3,(urms_en2_p3-(umen_en2_p3).^2)./ut_en2_p3.^2+2*shift,en2_sym_pt)
plot((ys_en3_p3+1).*ut_en3_p3/mu_p3,(urms_en3_p3-(umen_en3_p3).^2)./ut_en3_p3.^2+2*shift,en3_sym_pt)
% set(gca,'xtick',(yele_en+1))
% grid on
legend(leg)
xlim([0,max(moser_fluc_p1(:,2))])
xlabel('y^+')
ylabel("u'^+")
title(myTitle)
set(gcf,'Position',[100,100,1000,600])
if save_pics
print(gcf,pic_dir+"/"+pic_file+'_uu.png','-dpng','-r500');   
end

shift = 1;
figure
plot(moser_fluc_p1(:,2),moser_fluc_p1(:,4),moser_sym)
hold on
plot((ys_en_p1+1).*ut_en_p1/mu_p1,(vrms_en_p1)./ut_en_p1.^2,en_sym_pt)
plot((ys_en2_p1+1).*ut_en2_p1/mu_p1,(vrms_en2_p1)./ut_en2_p1.^2,en2_sym_pt)
plot((ys_en3_p1+1).*ut_en3_p1/mu_p1,(vrms_en3_p1)./ut_en3_p1.^2,en3_sym_pt)
plot(moser_fluc_p2(:,2),moser_fluc_p2(:,4)+shift,moser_sym)
plot((ys_en_p2+1).*ut_en_p2/mu_p2,(vrms_en_p2)./ut_en_p2.^2+shift,en_sym_pt)
plot((ys_en2_p2+1).*ut_en2_p2/mu_p2,(vrms_en2_p2)./ut_en2_p2.^2+shift,en2_sym_pt)
plot((ys_en3_p2+1).*ut_en3_p2/mu_p2,(vrms_en3_p2)./ut_en3_p2.^2+shift,en3_sym_pt)
plot(moser_fluc_p2(:,2),moser_fluc_p2(:,4)+2*shift,moser_sym)
plot((ys_en_p3+1).*ut_en_p3/mu_p3,(vrms_en_p3)./ut_en_p3.^2+2*shift,en_sym_pt)
plot((ys_en2_p3+1).*ut_en2_p3/mu_p3,(vrms_en2_p3)./ut_en2_p3.^2+2*shift,en2_sym_pt)
plot((ys_en3_p3+1).*ut_en3_p3/mu_p3,(vrms_en3_p3)./ut_en3_p3.^2+2*shift,en3_sym_pt)
% plot(fluc_en_p1(fpts,2),fluc_en_p1(fpts,4)/ut_en_p1^2,en_sym)
% set(gca,'xtick',(yele_en+1))
% grid on
legend(leg)
xlim([0,max(moser_fluc_p1(:,2))])
xlabel('y^+')
ylabel("v'^+")
title(myTitle)
set(gcf,'Position',[100,100,1000,600])
if save_pics
print(gcf,pic_dir+"/"+pic_file+'_vv.png','-dpng','-r500');   
end


figure
plot(moser_fluc_p1(:,2),moser_fluc_p1(:,5),moser_sym)
hold on
% plot(fluc_en_p1(fpts,2),fluc_en_p1(fpts,5)/ut_en_p1^2,en_sym)
plot((ys_en_p1+1).*ut_en_p1/mu_p1,(wrms_en_p1)./ut_en_p1.^2,en_sym_pt)
plot((ys_en2_p1+1).*ut_en2_p1/mu_p1,(wrms_en2_p1)./ut_en2_p1.^2,en2_sym_pt)
plot((ys_en3_p1+1).*ut_en3_p1/mu_p1,(wrms_en3_p1)./ut_en3_p1.^2,en3_sym_pt)
plot(moser_fluc_p2(:,2),moser_fluc_p2(:,5)+shift,moser_sym)
plot((ys_en_p2+1).*ut_en_p2/mu_p2,(wrms_en_p2)./ut_en_p2.^2+shift,en_sym_pt)
plot((ys_en2_p2+1).*ut_en2_p2/mu_p2,(wrms_en2_p2)./ut_en2_p2.^2+shift,en2_sym_pt)
plot((ys_en3_p2+1).*ut_en3_p2/mu_p2,(wrms_en3_p2)./ut_en3_p2.^2+shift,en3_sym_pt)
plot(moser_fluc_p2(:,2),moser_fluc_p2(:,5)+2*shift,moser_sym)
plot((ys_en_p3+1).*ut_en_p3/mu_p3,(wrms_en_p3)./ut_en_p3.^2+2*shift,en_sym_pt)
plot((ys_en2_p3+1).*ut_en2_p3/mu_p3,(wrms_en2_p3)./ut_en2_p3.^2+2*shift,en2_sym_pt)
plot((ys_en3_p3+1).*ut_en3_p3/mu_p3,(wrms_en3_p3)./ut_en3_p3.^2+2*shift,en3_sym_pt)
% set(gca,'xtick',(yele_en+1))
% grid on
legend(leg)
xlim([0,max(moser_fluc_p1(:,2))])
xlabel('y^+')
ylabel("w'^+")
title(myTitle)
set(gcf,'Position',[100,100,1000,600])
if save_pics
print(gcf,pic_dir+"/"+pic_file+'_ww.png','-dpng','-r500');   
end


figure
plot(moser_fluc_p1(:,2),moser_fluc_p1(:,6),moser_sym)
hold on
% plot(fluc_en_p1(fpts,2),fluc_en_p1(fpts,6)/ut_en_p1^2,en_sym)
plot((ys_en_p1+1).*ut_en_p1/mu_p1,(uvrms_en_p1)./ut_en_p1.^2,en_sym_pt)
plot((ys_en2_p1+1).*ut_en2_p1/mu_p1,(uvrms_en2_p1)./ut_en2_p1.^2,en2_sym_pt)
plot((ys_en3_p1+1).*ut_en3_p1/mu_p1,(uvrms_en3_p1)./ut_en3_p1.^2,en3_sym_pt)
plot(moser_fluc_p2(:,2),moser_fluc_p2(:,6)+shift,moser_sym)
plot((ys_en_p2+1).*ut_en_p2/mu_p2,(uvrms_en_p2)./ut_en_p2.^2+shift,en_sym_pt)
plot((ys_en2_p2+1).*ut_en2_p2/mu_p2,(uvrms_en2_p2)./ut_en2_p2.^2+shift,en2_sym_pt)
plot((ys_en3_p2+1).*ut_en3_p2/mu_p2,(uvrms_en3_p2)./ut_en3_p2.^2+shift,en3_sym_pt)
plot(moser_fluc_p2(:,2),moser_fluc_p2(:,6)+2*shift,moser_sym)
plot((ys_en_p3+1).*ut_en_p3/mu_p3,(uvrms_en_p3)./ut_en_p3.^2+2*shift,en_sym_pt)
plot((ys_en2_p3+1).*ut_en2_p3/mu_p3,(uvrms_en2_p3)./ut_en2_p3.^2+2*shift,en2_sym_pt)
plot((ys_en3_p3+1).*ut_en3_p3/mu_p3,(uvrms_en3_p3)./ut_en3_p3.^2+2*shift,en3_sym_pt)
% set(gca,'xtick',(yele_en+1))
% grid on
legend(leg,'Location','SouthEast')
xlim([0,max(moser_fluc_p1(:,2))])
xlabel('y^+')
ylabel("u'v'^+")
title(myTitle)
set(gcf,'Position',[100,100,1000,600])
if save_pics
print(gcf,pic_dir+"/"+pic_file+'_uv.png','-dpng','-r500');   
end

