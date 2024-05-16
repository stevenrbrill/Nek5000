% clc
clear all
close all


set(0,'DefaultAxesFontSize',18)
set(0,'defaultLineLineWidth',2.5)
% set(0,'DefaultFigureWindowStyle','docked')


linestyles = {'k-','b-','r-','g-','c-','m-','k--','b--','r--','g--','c--','m--','k-.','b-.','r-.','g-.','c-.','m-.','k:','b:','r:','g:','c:','m:'};
pointstyles = {'ko','bo','ro','go','co','mo','k^','b^','r^','g^','c^','m^','ks','bs','rs','gs','cs','ms','k*','b*','r*','g*','c*','m*','k+','b+','r+','g+','c+','m+'};
%% Load
% load('saved_plot_paper.mat');

%% mus
mu180 = 3.5e-4;
mu543 = 1e-4;
mu1000 = 5e-5;
mu2000 = 2.3e-5;
mu5200 = 8e-6;
%%
% addpath('/home/steven/Documents/Research/Nek5000/nekmatlab');
% addpath('/home/steven/Documents/Research/Nek5000/');
bleh = 1;
% return

%% Moser
poly_file = "srbTurbChannel0.f00041";
en_file = "enr"+poly_file;

moser=load('/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/moser_data/LM_Channel_0550_mean_prof.dat');
moser_fluc=load('/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/moser_data/LM_Channel_0550_vel_fluc_prof.dat');
ut_moser = 5.43496e-02;
% moser_fluc=load('/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/moser_data/LM_Channel_0550_vel_fluc_prof.dat');

moser1000=load('/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/moser_data/LM_Channel_1000_mean_prof.dat');
moser1000_fluc=load('/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/moser_data/LM_Channel_1000_vel_fluc_prof.dat');
ut_moser1000 = 5.00256e-02;
moser2000=load('/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/moser_data/LM_Channel_2000_mean_prof.dat');
moser2000_fluc=load('/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/moser_data/LM_Channel_2000_vel_fluc_prof.dat');
ut_moser2000 = 4.58794e-02;
moser5200=load('/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/moser_data/LM_Channel_5200_mean_prof.dat');
moser5200_fluc=load('/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/moser_data/LM_Channel_5200_vel_fluc_prof.dat');
ut_moser5200 = 4.14872e-02 ;
moser180=load('/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/moser_data/LM_Channel_0180_mean_prof.dat');
moser180_fluc=load('/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/moser_data/LM_Channel_0180_vel_fluc_prof.dat');
ut_moser180 = 6.37309e-02 ;

Ex = 8;
Ey = 14;
Ez = 8;
mu=1e-4;

% figure
% hold on
% plot(moser(:,1),moser(:,3)*ut_moser,'k--')
% plot(moser1000(:,1),moser1000(:,3)*ut_moser1000,'b--')
% plot(moser2000(:,1),moser2000(:,3)*ut_moser2000,'r--')
% plot(moser5200(:,1),moser5200(:,3)*ut_moser5200,'g--')
% legend('543','1000','2000','5200')

%% Paper
%% N=10 rms
Ex = 10;
Ey = 10;
Ez = 10;
mu = 1.000000e-04;
dir = "/home/steven/Documents/Research/Nek5000/yellow/p5_10x10_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_p5_10x10_rms,mean_plus_p5_10x10_rms,ut_p5_10x10_rms,fluc_p5_10x10_rms,fluc_plus_p5_10x10_rms,ys_p5_10x10_rms,u_avg_p5_10x10_rms,en_avg_p5_10x10_rms,tot_avg_p5_10x10_rms,yele_p5_10x10_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_p5_10x10_rms,u_rms_p5_10x10_rms,v_rms_p5_10x10_rms,w_rms_p5_10x10_rms,uv_rms_p5_10x10_rms,yele_p5_10x10_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_p5_10x10_rms,u_men_p5_10x10_rms,psix_men_p5_10x10_rms,up_men_p5_10x10_rms,uti_men_p5_10x10_rms,yele_p5_10x10_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 10;
Ey = 10;
Ez = 10;
mu = 1.000000e-04;
dir = "/home/steven/Documents/Research/Nek5000/yellow/p6_10x10_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_p6_10x10_rms,mean_plus_p6_10x10_rms,ut_p6_10x10_rms,fluc_p6_10x10_rms,fluc_plus_p6_10x10_rms,ys_p6_10x10_rms,u_avg_p6_10x10_rms,en_avg_p6_10x10_rms,tot_avg_p6_10x10_rms,yele_p6_10x10_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_p6_10x10_rms,u_rms_p6_10x10_rms,v_rms_p6_10x10_rms,w_rms_p6_10x10_rms,uv_rms_p6_10x10_rms,yele_p6_10x10_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_p6_10x10_rms,u_men_p6_10x10_rms,psix_men_p6_10x10_rms,up_men_p6_10x10_rms,uti_men_p6_10x10_rms,yele_p6_10x10_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 10;
Ey = 10;
Ez = 10;
mu = 1.000000e-04;
dir = "/home/steven/Documents/Research/Nek5000/yellow/p7_10x10_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_p7_10x10_rms,mean_plus_p7_10x10_rms,ut_p7_10x10_rms,fluc_p7_10x10_rms,fluc_plus_p7_10x10_rms,ys_p7_10x10_rms,u_avg_p7_10x10_rms,en_avg_p7_10x10_rms,tot_avg_p7_10x10_rms,yele_p7_10x10_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_p7_10x10_rms,u_rms_p7_10x10_rms,v_rms_p7_10x10_rms,w_rms_p7_10x10_rms,uv_rms_p7_10x10_rms,yele_p7_10x10_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_p7_10x10_rms,u_men_p7_10x10_rms,psix_men_p7_10x10_rms,up_men_p7_10x10_rms,uti_men_p7_10x10_rms,yele_p7_10x10_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 10;
Ey = 10;
Ez = 10;
mu = 5.000000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re1000_p5_10x10_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re1000_p5_10x10_rms,mean_plus_re1000_p5_10x10_rms,ut_re1000_p5_10x10_rms,fluc_re1000_p5_10x10_rms,fluc_plus_re1000_p5_10x10_rms,ys_re1000_p5_10x10_rms,u_avg_re1000_p5_10x10_rms,en_avg_re1000_p5_10x10_rms,tot_avg_re1000_p5_10x10_rms,yele_re1000_p5_10x10_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re1000_p5_10x10_rms,u_rms_re1000_p5_10x10_rms,v_rms_re1000_p5_10x10_rms,w_rms_re1000_p5_10x10_rms,uv_rms_re1000_p5_10x10_rms,yele_re1000_p5_10x10_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re1000_p5_10x10_rms,u_men_re1000_p5_10x10_rms,psix_men_re1000_p5_10x10_rms,up_men_re1000_p5_10x10_rms,uti_men_re1000_p5_10x10_rms,yele_re1000_p5_10x10_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 10;
Ey = 10;
Ez = 10;
mu = 5.000000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re1000_p6_10x10_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re1000_p6_10x10_rms,mean_plus_re1000_p6_10x10_rms,ut_re1000_p6_10x10_rms,fluc_re1000_p6_10x10_rms,fluc_plus_re1000_p6_10x10_rms,ys_re1000_p6_10x10_rms,u_avg_re1000_p6_10x10_rms,en_avg_re1000_p6_10x10_rms,tot_avg_re1000_p6_10x10_rms,yele_re1000_p6_10x10_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re1000_p6_10x10_rms,u_rms_re1000_p6_10x10_rms,v_rms_re1000_p6_10x10_rms,w_rms_re1000_p6_10x10_rms,uv_rms_re1000_p6_10x10_rms,yele_re1000_p6_10x10_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re1000_p6_10x10_rms,u_men_re1000_p6_10x10_rms,psix_men_re1000_p6_10x10_rms,up_men_re1000_p6_10x10_rms,uti_men_re1000_p6_10x10_rms,yele_re1000_p6_10x10_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 10;
Ey = 10;
Ez = 10;
mu = 5.000000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re1000_p7_10x10_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re1000_p7_10x10_rms,mean_plus_re1000_p7_10x10_rms,ut_re1000_p7_10x10_rms,fluc_re1000_p7_10x10_rms,fluc_plus_re1000_p7_10x10_rms,ys_re1000_p7_10x10_rms,u_avg_re1000_p7_10x10_rms,en_avg_re1000_p7_10x10_rms,tot_avg_re1000_p7_10x10_rms,yele_re1000_p7_10x10_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re1000_p7_10x10_rms,u_rms_re1000_p7_10x10_rms,v_rms_re1000_p7_10x10_rms,w_rms_re1000_p7_10x10_rms,uv_rms_re1000_p7_10x10_rms,yele_re1000_p7_10x10_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re1000_p7_10x10_rms,u_men_re1000_p7_10x10_rms,psix_men_re1000_p7_10x10_rms,up_men_re1000_p7_10x10_rms,uti_men_re1000_p7_10x10_rms,yele_re1000_p7_10x10_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 10;
Ey = 10;
Ez = 10;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re2000_p5_10x10_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re2000_p5_10x10_rms,mean_plus_re2000_p5_10x10_rms,ut_re2000_p5_10x10_rms,fluc_re2000_p5_10x10_rms,fluc_plus_re2000_p5_10x10_rms,ys_re2000_p5_10x10_rms,u_avg_re2000_p5_10x10_rms,en_avg_re2000_p5_10x10_rms,tot_avg_re2000_p5_10x10_rms,yele_re2000_p5_10x10_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re2000_p5_10x10_rms,u_rms_re2000_p5_10x10_rms,v_rms_re2000_p5_10x10_rms,w_rms_re2000_p5_10x10_rms,uv_rms_re2000_p5_10x10_rms,yele_re2000_p5_10x10_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re2000_p5_10x10_rms,u_men_re2000_p5_10x10_rms,psix_men_re2000_p5_10x10_rms,up_men_re2000_p5_10x10_rms,uti_men_re2000_p5_10x10_rms,yele_re2000_p5_10x10_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 10;
Ey = 10;
Ez = 10;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re2000_p6_10x10_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re2000_p6_10x10_rms,mean_plus_re2000_p6_10x10_rms,ut_re2000_p6_10x10_rms,fluc_re2000_p6_10x10_rms,fluc_plus_re2000_p6_10x10_rms,ys_re2000_p6_10x10_rms,u_avg_re2000_p6_10x10_rms,en_avg_re2000_p6_10x10_rms,tot_avg_re2000_p6_10x10_rms,yele_re2000_p6_10x10_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re2000_p6_10x10_rms,u_rms_re2000_p6_10x10_rms,v_rms_re2000_p6_10x10_rms,w_rms_re2000_p6_10x10_rms,uv_rms_re2000_p6_10x10_rms,yele_re2000_p6_10x10_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re2000_p6_10x10_rms,u_men_re2000_p6_10x10_rms,psix_men_re2000_p6_10x10_rms,up_men_re2000_p6_10x10_rms,uti_men_re2000_p6_10x10_rms,yele_re2000_p6_10x10_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);


Ex = 10;
Ey = 10;
Ez = 10;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re2000_p7_10x10_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re2000_p7_10x10_rms,mean_plus_re2000_p7_10x10_rms,ut_re2000_p7_10x10_rms,fluc_re2000_p7_10x10_rms,fluc_plus_re2000_p7_10x10_rms,ys_re2000_p7_10x10_rms,u_avg_re2000_p7_10x10_rms,en_avg_re2000_p7_10x10_rms,tot_avg_re2000_p7_10x10_rms,yele_re2000_p7_10x10_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re2000_p7_10x10_rms,u_rms_re2000_p7_10x10_rms,v_rms_re2000_p7_10x10_rms,w_rms_re2000_p7_10x10_rms,uv_rms_re2000_p7_10x10_rms,yele_re2000_p7_10x10_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re2000_p7_10x10_rms,u_men_re2000_p7_10x10_rms,psix_men_re2000_p7_10x10_rms,up_men_re2000_p7_10x10_rms,uti_men_re2000_p7_10x10_rms,yele_re2000_p7_10x10_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 1.000000e-04;
dir = "/home/steven/Documents/Research/Nek5000/yellow/p5_20x20_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_p5_20x20_rms,mean_plus_p5_20x20_rms,ut_p5_20x20_rms,fluc_p5_20x20_rms,fluc_plus_p5_20x20_rms,ys_p5_20x20_rms,u_avg_p5_20x20_rms,en_avg_p5_20x20_rms,tot_avg_p5_20x20_rms,yele_p5_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_p5_20x20_rms,u_rms_p5_20x20_rms,v_rms_p5_20x20_rms,w_rms_p5_20x20_rms,uv_rms_p5_20x20_rms,yele_p5_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_p5_20x20_rms,u_men_p5_20x20_rms,psix_men_p5_20x20_rms,up_men_p5_20x20_rms,uti_men_p5_20x20_rms,yele_p5_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 1.000000e-04;
dir = "/home/steven/Documents/Research/Nek5000/yellow/p6_20x20_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_p6_20x20_rms,mean_plus_p6_20x20_rms,ut_p6_20x20_rms,fluc_p6_20x20_rms,fluc_plus_p6_20x20_rms,ys_p6_20x20_rms,u_avg_p6_20x20_rms,en_avg_p6_20x20_rms,tot_avg_p6_20x20_rms,yele_p6_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_p6_20x20_rms,u_rms_p6_20x20_rms,v_rms_p6_20x20_rms,w_rms_p6_20x20_rms,uv_rms_p6_20x20_rms,yele_p6_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_p6_20x20_rms,u_men_p6_20x20_rms,psix_men_p6_20x20_rms,up_men_p6_20x20_rms,uti_men_p6_20x20_rms,yele_p6_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 1.000000e-04;
dir = "/home/steven/Documents/Research/Nek5000/yellow/p7_20x20_rms/";
poly_file = "srbTurbChannel0.f00006";
rms_poly_file = "srbTurbChannel0.f00020";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_p7_20x20_rms,mean_plus_p7_20x20_rms,ut_p7_20x20_rms,fluc_p7_20x20_rms,fluc_plus_p7_20x20_rms,ys_p7_20x20_rms,u_avg_p7_20x20_rms,en_avg_p7_20x20_rms,tot_avg_p7_20x20_rms,yele_p7_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_p7_20x20_rms,u_rms_p7_20x20_rms,v_rms_p7_20x20_rms,w_rms_p7_20x20_rms,uv_rms_p7_20x20_rms,yele_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_p7_20x20_rms,u_men_p7_20x20_rms,psix_men_p7_20x20_rms,up_men_p7_20x20_rms,uti_men_p7_20x20_rms,yele_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 5.000000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re1000_p5_20x20_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re1000_p5_20x20_rms,mean_plus_re1000_p5_20x20_rms,ut_re1000_p5_20x20_rms,fluc_re1000_p5_20x20_rms,fluc_plus_re1000_p5_20x20_rms,ys_re1000_p5_20x20_rms,u_avg_re1000_p5_20x20_rms,en_avg_re1000_p5_20x20_rms,tot_avg_re1000_p5_20x20_rms,yele_re1000_p5_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re1000_p5_20x20_rms,u_rms_re1000_p5_20x20_rms,v_rms_re1000_p5_20x20_rms,w_rms_re1000_p5_20x20_rms,uv_rms_re1000_p5_20x20_rms,yele_re1000_p5_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re1000_p5_20x20_rms,u_men_re1000_p5_20x20_rms,psix_men_re1000_p5_20x20_rms,up_men_re1000_p5_20x20_rms,uti_men_re1000_p5_20x20_rms,yele_re1000_p5_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 5.000000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re1000_p6_20x20_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re1000_p6_20x20_rms,mean_plus_re1000_p6_20x20_rms,ut_re1000_p6_20x20_rms,fluc_re1000_p6_20x20_rms,fluc_plus_re1000_p6_20x20_rms,ys_re1000_p6_20x20_rms,u_avg_re1000_p6_20x20_rms,en_avg_re1000_p6_20x20_rms,tot_avg_re1000_p6_20x20_rms,yele_re1000_p6_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re1000_p6_20x20_rms,u_rms_re1000_p6_20x20_rms,v_rms_re1000_p6_20x20_rms,w_rms_re1000_p6_20x20_rms,uv_rms_re1000_p6_20x20_rms,yele_re1000_p6_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re1000_p6_20x20_rms,u_men_re1000_p6_20x20_rms,psix_men_re1000_p6_20x20_rms,up_men_re1000_p6_20x20_rms,uti_men_re1000_p6_20x20_rms,yele_re1000_p6_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 5.000000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re1000_p7_20x20_rms/";
poly_file = "srbTurbChannel0.f00008";
rms_poly_file = "srbTurbChannel0.f00030";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re1000_p7_20x20_rms,mean_plus_re1000_p7_20x20_rms,ut_re1000_p7_20x20_rms,fluc_re1000_p7_20x20_rms,fluc_plus_re1000_p7_20x20_rms,ys_re1000_p7_20x20_rms,u_avg_re1000_p7_20x20_rms,en_avg_re1000_p7_20x20_rms,tot_avg_re1000_p7_20x20_rms,yele_re1000_p7_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re1000_p7_20x20_rms,u_rms_re1000_p7_20x20_rms,v_rms_re1000_p7_20x20_rms,w_rms_re1000_p7_20x20_rms,uv_rms_re1000_p7_20x20_rms,yele_re1000_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re1000_p7_20x20_rms,u_men_re1000_p7_20x20_rms,psix_men_re1000_p7_20x20_rms,up_men_re1000_p7_20x20_rms,uti_men_re1000_p7_20x20_rms,yele_re1000_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re2000_p5_20x20_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re2000_p5_20x20_rms,mean_plus_re2000_p5_20x20_rms,ut_re2000_p5_20x20_rms,fluc_re2000_p5_20x20_rms,fluc_plus_re2000_p5_20x20_rms,ys_re2000_p5_20x20_rms,u_avg_re2000_p5_20x20_rms,en_avg_re2000_p5_20x20_rms,tot_avg_re2000_p5_20x20_rms,yele_re2000_p5_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re2000_p5_20x20_rms,u_rms_re2000_p5_20x20_rms,v_rms_re2000_p5_20x20_rms,w_rms_re2000_p5_20x20_rms,uv_rms_re2000_p5_20x20_rms,yele_re2000_p5_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re2000_p5_20x20_rms,u_men_re2000_p5_20x20_rms,psix_men_re2000_p5_20x20_rms,up_men_re2000_p5_20x20_rms,uti_men_re2000_p5_20x20_rms,yele_re2000_p5_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re2000_p6_20x20_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re2000_p6_20x20_rms,mean_plus_re2000_p6_20x20_rms,ut_re2000_p6_20x20_rms,fluc_re2000_p6_20x20_rms,fluc_plus_re2000_p6_20x20_rms,ys_re2000_p6_20x20_rms,u_avg_re2000_p6_20x20_rms,en_avg_re2000_p6_20x20_rms,tot_avg_re2000_p6_20x20_rms,yele_re2000_p6_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re2000_p6_20x20_rms,u_rms_re2000_p6_20x20_rms,v_rms_re2000_p6_20x20_rms,w_rms_re2000_p6_20x20_rms,uv_rms_re2000_p6_20x20_rms,yele_re2000_p6_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re2000_p6_20x20_rms,u_men_re2000_p6_20x20_rms,psix_men_re2000_p6_20x20_rms,up_men_re2000_p6_20x20_rms,uti_men_re2000_p6_20x20_rms,yele_re2000_p6_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/re2000_p7_20x20_rms/";
poly_file = "srbTurbChannel0.f00010";
rms_poly_file = "srbTurbChannel0.f00036";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_re2000_p7_20x20_rms,mean_plus_re2000_p7_20x20_rms,ut_re2000_p7_20x20_rms,fluc_re2000_p7_20x20_rms,fluc_plus_re2000_p7_20x20_rms,ys_re2000_p7_20x20_rms,u_avg_re2000_p7_20x20_rms,en_avg_re2000_p7_20x20_rms,tot_avg_re2000_p7_20x20_rms,yele_re2000_p7_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_re2000_p7_20x20_rms,u_rms_re2000_p7_20x20_rms,v_rms_re2000_p7_20x20_rms,w_rms_re2000_p7_20x20_rms,uv_rms_re2000_p7_20x20_rms,yele_re2000_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_re2000_p7_20x20_rms,u_men_re2000_p7_20x20_rms,psix_men_re2000_p7_20x20_rms,up_men_re2000_p7_20x20_rms,uti_men_re2000_p7_20x20_rms,yele_re2000_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);


%% Poly Paper
Ex = 20;
Ey = 20;
Ez = 20;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/poly_re2000_p5_20x20_rms/";
poly_file = "srbTurbChannel0.f00011";
rms_poly_file = "srbTurbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_poly_re2000_p5_20x20_rms,mean_plus_poly_re2000_p5_20x20_rms,ut_poly_re2000_p5_20x20_rms,fluc_poly_re2000_p5_20x20_rms,fluc_plus_poly_re2000_p5_20x20_rms,ys_poly_re2000_p5_20x20_rms,u_avg_poly_re2000_p5_20x20_rms,en_avg_poly_re2000_p5_20x20_rms,tot_avg_poly_re2000_p5_20x20_rms,yele_poly_re2000_p5_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_poly_re2000_p5_20x20_rms,u_rms_poly_re2000_p5_20x20_rms,v_rms_poly_re2000_p5_20x20_rms,w_rms_poly_re2000_p5_20x20_rms,uv_rms_poly_re2000_p5_20x20_rms,yele_poly_re2000_p5_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_poly_re2000_p5_20x20_rms,u_men_poly_re2000_p5_20x20_rms,psix_men_poly_re2000_p5_20x20_rms,up_men_poly_re2000_p5_20x20_rms,uti_men_poly_re2000_p5_20x20_rms,yele_poly_re2000_p5_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/poly_re2000_p6_20x20_rms/";
poly_file = "srbTurbChannel0.f00009";
rms_poly_file = "srbTurbChannel0.f00031";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_poly_re2000_p6_20x20_rms,mean_plus_poly_re2000_p6_20x20_rms,ut_poly_re2000_p6_20x20_rms,fluc_poly_re2000_p6_20x20_rms,fluc_plus_poly_re2000_p6_20x20_rms,ys_poly_re2000_p6_20x20_rms,u_avg_poly_re2000_p6_20x20_rms,en_avg_poly_re2000_p6_20x20_rms,tot_avg_poly_re2000_p6_20x20_rms,yele_poly_re2000_p6_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_poly_re2000_p6_20x20_rms,u_rms_poly_re2000_p6_20x20_rms,v_rms_poly_re2000_p6_20x20_rms,w_rms_poly_re2000_p6_20x20_rms,uv_rms_poly_re2000_p6_20x20_rms,yele_poly_re2000_p6_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_poly_re2000_p6_20x20_rms,u_men_poly_re2000_p6_20x20_rms,psix_men_poly_re2000_p6_20x20_rms,up_men_poly_re2000_p6_20x20_rms,uti_men_poly_re2000_p6_20x20_rms,yele_poly_re2000_p6_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/poly_re2000_p7_20x20_rms/";
poly_file = "srbTurbChannel0.f00005";
rms_poly_file = "srbTurbChannel0.f00016";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_poly_re2000_p7_20x20_rms,mean_plus_poly_re2000_p7_20x20_rms,ut_poly_re2000_p7_20x20_rms,fluc_poly_re2000_p7_20x20_rms,fluc_plus_poly_re2000_p7_20x20_rms,ys_poly_re2000_p7_20x20_rms,u_avg_poly_re2000_p7_20x20_rms,en_avg_poly_re2000_p7_20x20_rms,tot_avg_poly_re2000_p7_20x20_rms,yele_poly_re2000_p7_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_poly_re2000_p7_20x20_rms,u_rms_poly_re2000_p7_20x20_rms,v_rms_poly_re2000_p7_20x20_rms,w_rms_poly_re2000_p7_20x20_rms,uv_rms_poly_re2000_p7_20x20_rms,yele_poly_re2000_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_poly_re2000_p7_20x20_rms,u_men_poly_re2000_p7_20x20_rms,psix_men_poly_re2000_p7_20x20_rms,up_men_poly_re2000_p7_20x20_rms,uti_men_poly_re2000_p7_20x20_rms,yele_poly_re2000_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

%% Eqm Paper

Ex = 20;
Ey = 20;
Ez = 20;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/eqm_re2000_p5_20x20_rms/";
poly_file = "turbChannel0.f00009";
rms_poly_file = "turbChannel0.f00034";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_eqm_re2000_p5_20x20_rms,mean_plus_eqm_re2000_p5_20x20_rms,ut_eqm_re2000_p5_20x20_rms,fluc_eqm_re2000_p5_20x20_rms,fluc_plus_eqm_re2000_p5_20x20_rms,ys_eqm_re2000_p5_20x20_rms,u_avg_eqm_re2000_p5_20x20_rms,en_avg_eqm_re2000_p5_20x20_rms,tot_avg_eqm_re2000_p5_20x20_rms,yele_eqm_re2000_p5_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_eqm_re2000_p5_20x20_rms,u_rms_eqm_re2000_p5_20x20_rms,v_rms_eqm_re2000_p5_20x20_rms,w_rms_eqm_re2000_p5_20x20_rms,uv_rms_eqm_re2000_p5_20x20_rms,yele_eqm_re2000_p5_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_eqm_re2000_p5_20x20_rms,u_men_eqm_re2000_p5_20x20_rms,psix_men_eqm_re2000_p5_20x20_rms,up_men_eqm_re2000_p5_20x20_rms,uti_men_eqm_re2000_p5_20x20_rms,yele_eqm_re2000_p5_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/eqm_re2000_p6_20x20_rms/";
poly_file = "turbChannel0.f00009";
rms_poly_file = "turbChannel0.f00032";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_eqm_re2000_p6_20x20_rms,mean_plus_eqm_re2000_p6_20x20_rms,ut_eqm_re2000_p6_20x20_rms,fluc_eqm_re2000_p6_20x20_rms,fluc_plus_eqm_re2000_p6_20x20_rms,ys_eqm_re2000_p6_20x20_rms,u_avg_eqm_re2000_p6_20x20_rms,en_avg_eqm_re2000_p6_20x20_rms,tot_avg_eqm_re2000_p6_20x20_rms,yele_eqm_re2000_p6_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_eqm_re2000_p6_20x20_rms,u_rms_eqm_re2000_p6_20x20_rms,v_rms_eqm_re2000_p6_20x20_rms,w_rms_eqm_re2000_p6_20x20_rms,uv_rms_eqm_re2000_p6_20x20_rms,yele_eqm_re2000_p6_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_eqm_re2000_p6_20x20_rms,u_men_eqm_re2000_p6_20x20_rms,psix_men_eqm_re2000_p6_20x20_rms,up_men_eqm_re2000_p6_20x20_rms,uti_men_eqm_re2000_p6_20x20_rms,yele_eqm_re2000_p6_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

Ex = 20;
Ey = 20;
Ez = 20;
mu = 2.300000e-05;
dir = "/home/steven/Documents/Research/Nek5000/yellow/eqm_re2000_p7_20x20_rms/";
poly_file = "turbChannel0.f00007";
rms_poly_file = "turbChannel0.f00023";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_eqm_re2000_p7_20x20_rms,mean_plus_eqm_re2000_p7_20x20_rms,ut_eqm_re2000_p7_20x20_rms,fluc_eqm_re2000_p7_20x20_rms,fluc_plus_eqm_re2000_p7_20x20_rms,ys_eqm_re2000_p7_20x20_rms,u_avg_eqm_re2000_p7_20x20_rms,en_avg_eqm_re2000_p7_20x20_rms,tot_avg_eqm_re2000_p7_20x20_rms,yele_eqm_re2000_p7_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_eqm_re2000_p7_20x20_rms,u_rms_eqm_re2000_p7_20x20_rms,v_rms_eqm_re2000_p7_20x20_rms,w_rms_eqm_re2000_p7_20x20_rms,uv_rms_eqm_re2000_p7_20x20_rms,yele_eqm_re2000_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_eqm_re2000_p7_20x20_rms,u_men_eqm_re2000_p7_20x20_rms,psix_men_eqm_re2000_p7_20x20_rms,up_men_eqm_re2000_p7_20x20_rms,uti_men_eqm_re2000_p7_20x20_rms,yele_eqm_re2000_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);

%% Schematic Paper
Ex = 20;
Ey = 20;
Ez = 20;
mu = 1.000000e-04;
dir = "/home/steven/Documents/Research/Nek5000/yellow/eqm_p7_20x20_rms/";
poly_file = "turbChannel0.f00011";
rms_poly_file = "turbChannel0.f00038";
en_file = "enr"+poly_file;
mean_file = dir+"mean_prof.dat";
fluc_file = dir+"vel_fluc_prof.dat";
rms_file = "rms"+rms_poly_file;
men_file = "men"+rms_poly_file;
[mean_eqm_p7_20x20_rms,mean_plus_eqm_p7_20x20_rms,ut_eqm_p7_20x20_rms,fluc_eqm_p7_20x20_rms,fluc_plus_eqm_p7_20x20_rms,ys_eqm_p7_20x20_rms,u_avg_eqm_p7_20x20_rms,en_avg_eqm_p7_20x20_rms,tot_avg_eqm_p7_20x20_rms,yele_eqm_p7_20x20_rms] = avg_nek5000_4(dir,poly_file,en_file,mean_file,fluc_file,Ex,Ey,Ez,mu);
[ys_eqm_p7_20x20_rms,u_rms_eqm_p7_20x20_rms,v_rms_eqm_p7_20x20_rms,w_rms_eqm_p7_20x20_rms,uv_rms_eqm_p7_20x20_rms,yele_eqm_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,rms_file,Ex,Ey,Ez);
[ys_eqm_p7_20x20_rms,u_men_eqm_p7_20x20_rms,psix_men_eqm_p7_20x20_rms,up_men_eqm_p7_20x20_rms,uti_men_eqm_p7_20x20_rms,yele_eqm_p7_20x20_rms] = avg_nek5000_4_only_coeffs(dir,men_file,Ex,Ey,Ez);




%% Save
save('saved_plot_paper.mat')
bleh =1;

%% PLOTTING-----------------------------------------------------------------------------------------------------------------
%% PLOTTING-----------------------------------------------------------------------------------------------------------------
%% PLOTTING-----------------------------------------------------------------------------------------------------------------
%% PLOTTING-----------------------------------------------------------------------------------------------------------------
%% PLOTTING-----------------------------------------------------------------------------------------------------------------
%% PLOTTING-----------------------------------------------------------------------------------------------------------------
%% PLOTTING-----------------------------------------------------------------------------------------------------------------
%% PLOTTING


%% Components

pic_dir = "/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/aThesis/paper";
pic_file = "re543_p5_n10_components";
save_pics = 1;
mytitle = "";
ypmax = 25;
leg = {'Total Solution','Polynomial Component','Enrichment Component'};
ut = plot_en1_comps_phys_nodes_thesis(ypmax,...
mu543,moser,ut_moser,moser_fluc,...
mean_p5_10x10_rms,mean_plus_p5_10x10_rms,ut_p5_10x10_rms,fluc_p5_10x10_rms,fluc_plus_p5_10x10_rms,yele_p5_10x10_rms,...
ys_p5_10x10_rms,tot_avg_p5_10x10_rms,u_avg_p5_10x10_rms,en_avg_p5_10x10_rms,...
leg,mytitle,save_pics,pic_dir,pic_file);

pic_dir = "/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/aThesis/paper";
pic_file = "re1000_p5_n20_components";
save_pics = 1;
mytitle = "";
ypmax = 25;
leg = {'Total Solution','Polynomial Component','Enrichment Component'};
ut = plot_en1_comps_phys_nodes_thesis(ypmax,...
mu1000,moser1000,ut_moser1000,moser1000_fluc,...
mean_re1000_p5_20x20_rms,mean_plus_re1000_p5_20x20_rms,ut_re1000_p5_20x20_rms,fluc_re1000_p5_20x20_rms,fluc_plus_re1000_p5_20x20_rms,yele_re1000_p5_20x20_rms,...
ys_re1000_p5_20x20_rms,tot_avg_re1000_p5_20x20_rms,u_avg_re1000_p5_20x20_rms,en_avg_re1000_p5_20x20_rms,...
leg,mytitle,save_pics,pic_dir,pic_file);


%% Convergence

pic_dir = "/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/paper";
pic_file = "paper_conv_10";
save_pics = 1;
mytitle = "";
ypmax = 35;
leg = {'DNS [Lee and Moser 2015]','P=5','P=6','P=7'};
ut = plot_stack3_en3_rms_paper(ypmax,...
mu543,moser,ut_moser,moser_fluc,...
mean_p5_10x10_rms,mean_plus_p5_10x10_rms,ut_p5_10x10_rms,fluc_p5_10x10_rms,fluc_plus_p5_10x10_rms,yele_p5_10x10_rms,ys_p5_10x10_rms,u_rms_p5_10x10_rms,v_rms_p5_10x10_rms,w_rms_p5_10x10_rms,uv_rms_p5_10x10_rms,u_men_p5_10x10_rms,...
mean_p6_10x10_rms,mean_plus_p6_10x10_rms,ut_p6_10x10_rms,fluc_p6_10x10_rms,fluc_plus_p6_10x10_rms,yele_p6_10x10_rms,ys_p6_10x10_rms,u_rms_p6_10x10_rms,v_rms_p6_10x10_rms,w_rms_p6_10x10_rms,uv_rms_p6_10x10_rms,u_men_p6_10x10_rms,...
mean_p7_10x10_rms,mean_plus_p7_10x10_rms,ut_p7_10x10_rms,fluc_p7_10x10_rms,fluc_plus_p7_10x10_rms,yele_p7_10x10_rms,ys_p7_10x10_rms,u_rms_p7_10x10_rms,v_rms_p7_10x10_rms,w_rms_p7_10x10_rms,uv_rms_p7_10x10_rms,u_men_p7_10x10_rms,...
mu1000,moser1000,ut_moser1000,moser1000_fluc,...
mean_re1000_p5_10x10_rms,mean_plus_re1000_p5_10x10_rms,ut_re1000_p5_10x10_rms,fluc_re1000_p5_10x10_rms,fluc_plus_re1000_p5_10x10_rms,yele_re1000_p5_10x10_rms,ys_re1000_p5_10x10_rms,u_rms_re1000_p5_10x10_rms,v_rms_re1000_p5_10x10_rms,w_rms_re1000_p5_10x10_rms,uv_rms_re1000_p5_10x10_rms,u_men_re1000_p5_10x10_rms,...
mean_re1000_p6_10x10_rms,mean_plus_re1000_p6_10x10_rms,ut_re1000_p6_10x10_rms,fluc_re1000_p6_10x10_rms,fluc_plus_re1000_p6_10x10_rms,yele_re1000_p6_10x10_rms,ys_re1000_p6_10x10_rms,u_rms_re1000_p6_10x10_rms,v_rms_re1000_p6_10x10_rms,w_rms_re1000_p6_10x10_rms,uv_rms_re1000_p6_10x10_rms,u_men_re1000_p6_10x10_rms,...
mean_re1000_p7_10x10_rms,mean_plus_re1000_p7_10x10_rms,ut_re1000_p7_10x10_rms,fluc_re1000_p7_10x10_rms,fluc_plus_re1000_p7_10x10_rms,yele_re1000_p7_10x10_rms,ys_re1000_p7_10x10_rms,u_rms_re1000_p7_10x10_rms,v_rms_re1000_p7_10x10_rms,w_rms_re1000_p7_10x10_rms,uv_rms_re1000_p7_10x10_rms,u_men_re1000_p7_10x10_rms,...
mu2000,moser2000,ut_moser2000,moser2000_fluc,...
mean_re2000_p5_10x10_rms,mean_plus_re2000_p5_10x10_rms,ut_re2000_p5_10x10_rms,fluc_re2000_p5_10x10_rms,fluc_plus_re2000_p5_10x10_rms,yele_re2000_p5_10x10_rms,ys_re2000_p5_10x10_rms,u_rms_re2000_p5_10x10_rms,v_rms_re2000_p5_10x10_rms,w_rms_re2000_p5_10x10_rms,uv_rms_re2000_p5_10x10_rms,u_men_re2000_p5_10x10_rms,...
mean_re2000_p6_10x10_rms,mean_plus_re2000_p6_10x10_rms,ut_re2000_p6_10x10_rms,fluc_re2000_p6_10x10_rms,fluc_plus_re2000_p6_10x10_rms,yele_re2000_p6_10x10_rms,ys_re2000_p6_10x10_rms,u_rms_re2000_p6_10x10_rms,v_rms_re2000_p6_10x10_rms,w_rms_re2000_p6_10x10_rms,uv_rms_re2000_p6_10x10_rms,u_men_re2000_p6_10x10_rms,...
mean_re2000_p7_10x10_rms,mean_plus_re2000_p7_10x10_rms,ut_re2000_p7_10x10_rms,fluc_re2000_p7_10x10_rms,fluc_plus_re2000_p7_10x10_rms,yele_re2000_p7_10x10_rms,ys_re2000_p7_10x10_rms,u_rms_re2000_p7_10x10_rms,v_rms_re2000_p7_10x10_rms,w_rms_re2000_p7_10x10_rms,uv_rms_re2000_p7_10x10_rms,u_men_re2000_p7_10x10_rms,...
leg,mytitle,save_pics,pic_dir,pic_file);


pic_dir = "/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/paper";
pic_file = "paper_conv_20";
save_pics = 1;
mytitle = "";
ypmax = 35;
leg = {'DNS [Lee and Moser 2015]','P=5','P=6','P=7'};
ut = plot_stack3_en3_rms_paper(ypmax,...
mu543,moser,ut_moser,moser_fluc,...
mean_p5_20x20_rms,mean_plus_p5_20x20_rms,ut_p5_20x20_rms,fluc_p5_20x20_rms,fluc_plus_p5_20x20_rms,yele_p5_20x20_rms,ys_p5_20x20_rms,u_rms_p5_20x20_rms,v_rms_p5_20x20_rms,w_rms_p5_20x20_rms,uv_rms_p5_20x20_rms,u_men_p5_20x20_rms,...
mean_p6_20x20_rms,mean_plus_p6_20x20_rms,ut_p6_20x20_rms,fluc_p6_20x20_rms,fluc_plus_p6_20x20_rms,yele_p6_20x20_rms,ys_p6_20x20_rms,u_rms_p6_20x20_rms,v_rms_p6_20x20_rms,w_rms_p6_20x20_rms,uv_rms_p6_20x20_rms,u_men_p6_20x20_rms,...
mean_p7_20x20_rms,mean_plus_p7_20x20_rms,ut_p7_20x20_rms,fluc_p7_20x20_rms,fluc_plus_p7_20x20_rms,yele_p7_20x20_rms,ys_p7_20x20_rms,u_rms_p7_20x20_rms,v_rms_p7_20x20_rms,w_rms_p7_20x20_rms,uv_rms_p7_20x20_rms,u_men_p7_20x20_rms,...
mu1000,moser1000,ut_moser1000,moser1000_fluc,...
mean_re1000_p5_20x20_rms,mean_plus_re1000_p5_20x20_rms,ut_re1000_p5_20x20_rms,fluc_re1000_p5_20x20_rms,fluc_plus_re1000_p5_20x20_rms,yele_re1000_p5_20x20_rms,ys_re1000_p5_20x20_rms,u_rms_re1000_p5_20x20_rms,v_rms_re1000_p5_20x20_rms,w_rms_re1000_p5_20x20_rms,uv_rms_re1000_p5_20x20_rms,u_men_re1000_p5_20x20_rms,...
mean_re1000_p6_20x20_rms,mean_plus_re1000_p6_20x20_rms,ut_re1000_p6_20x20_rms,fluc_re1000_p6_20x20_rms,fluc_plus_re1000_p6_20x20_rms,yele_re1000_p6_20x20_rms,ys_re1000_p6_20x20_rms,u_rms_re1000_p6_20x20_rms,v_rms_re1000_p6_20x20_rms,w_rms_re1000_p6_20x20_rms,uv_rms_re1000_p6_20x20_rms,u_men_re1000_p6_20x20_rms,...
mean_re1000_p7_20x20_rms,mean_plus_re1000_p7_20x20_rms,ut_re1000_p7_20x20_rms,fluc_re1000_p7_20x20_rms,fluc_plus_re1000_p7_20x20_rms,yele_re1000_p7_20x20_rms,ys_re1000_p7_20x20_rms,u_rms_re1000_p7_20x20_rms,v_rms_re1000_p7_20x20_rms,w_rms_re1000_p7_20x20_rms,uv_rms_re1000_p7_20x20_rms,u_men_re1000_p7_20x20_rms,...
mu2000,moser2000,ut_moser2000,moser2000_fluc,...
mean_re2000_p5_20x20_rms,mean_plus_re2000_p5_20x20_rms,ut_re2000_p5_20x20_rms,fluc_re2000_p5_20x20_rms,fluc_plus_re2000_p5_20x20_rms,yele_re2000_p5_20x20_rms,ys_re2000_p5_20x20_rms,u_rms_re2000_p5_20x20_rms,v_rms_re2000_p5_20x20_rms,w_rms_re2000_p5_20x20_rms,uv_rms_re2000_p5_20x20_rms,u_men_re2000_p5_20x20_rms,...
mean_re2000_p6_20x20_rms,mean_plus_re2000_p6_20x20_rms,ut_re2000_p6_20x20_rms,fluc_re2000_p6_20x20_rms,fluc_plus_re2000_p6_20x20_rms,yele_re2000_p6_20x20_rms,ys_re2000_p6_20x20_rms,u_rms_re2000_p6_20x20_rms,v_rms_re2000_p6_20x20_rms,w_rms_re2000_p6_20x20_rms,uv_rms_re2000_p6_20x20_rms,u_men_re2000_p6_20x20_rms,...
mean_re2000_p7_20x20_rms,mean_plus_re2000_p7_20x20_rms,ut_re2000_p7_20x20_rms,fluc_re2000_p7_20x20_rms,fluc_plus_re2000_p7_20x20_rms,yele_re2000_p7_20x20_rms,ys_re2000_p7_20x20_rms,u_rms_re2000_p7_20x20_rms,v_rms_re2000_p7_20x20_rms,w_rms_re2000_p7_20x20_rms,uv_rms_re2000_p7_20x20_rms,u_men_re2000_p7_20x20_rms,...
leg,mytitle,save_pics,pic_dir,pic_file);

%% Comparison

pic_dir = "/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/aThesis/paper";
pic_file = "re2000_n20_poly_ss_en_ps";
save_pics = 0;
mytitle = "Re=2000 N=20";
ypmax = 35;
leg = {'DNS [Lee and Moser 2015]','Poly','SSWM','ENWM'};
ut = plot_stack3_poly1_en2_rms_thesis(ypmax,...
mu2000,moser2000,ut_moser2000,moser2000_fluc,...
mean_poly_re2000_p5_20x20_rms,mean_plus_poly_re2000_p5_20x20_rms,ut_poly_re2000_p5_20x20_rms,fluc_poly_re2000_p5_20x20_rms,fluc_plus_poly_re2000_p5_20x20_rms,yele_poly_re2000_p5_20x20_rms,ys_poly_re2000_p5_20x20_rms,u_rms_poly_re2000_p5_20x20_rms,v_rms_poly_re2000_p5_20x20_rms,w_rms_poly_re2000_p5_20x20_rms,uv_rms_poly_re2000_p5_20x20_rms,u_men_poly_re2000_p5_20x20_rms,...
mean_eqm_re2000_p5_20x20_rms,mean_plus_eqm_re2000_p5_20x20_rms,ut_eqm_re2000_p5_20x20_rms,fluc_eqm_re2000_p5_20x20_rms,fluc_plus_eqm_re2000_p5_20x20_rms,yele_eqm_re2000_p5_20x20_rms,ys_eqm_re2000_p5_20x20_rms,u_rms_eqm_re2000_p5_20x20_rms,v_rms_eqm_re2000_p5_20x20_rms,w_rms_eqm_re2000_p5_20x20_rms,uv_rms_eqm_re2000_p5_20x20_rms,u_men_eqm_re2000_p5_20x20_rms,...
mean_re2000_p5_20x20_rms,mean_plus_re2000_p5_20x20_rms,ut_re2000_p5_20x20_rms,fluc_re2000_p5_20x20_rms,fluc_plus_re2000_p5_20x20_rms,yele_re2000_p5_20x20_rms,ys_re2000_p5_20x20_rms,u_rms_re2000_p5_20x20_rms,v_rms_re2000_p5_20x20_rms,w_rms_re2000_p5_20x20_rms,uv_rms_re2000_p5_20x20_rms,u_men_re2000_p5_20x20_rms,...
mu2000,moser2000,ut_moser2000,moser2000_fluc,...
mean_poly_re2000_p6_20x20_rms,mean_plus_poly_re2000_p6_20x20_rms,ut_poly_re2000_p6_20x20_rms,fluc_poly_re2000_p6_20x20_rms,fluc_plus_poly_re2000_p6_20x20_rms,yele_poly_re2000_p6_20x20_rms,ys_poly_re2000_p6_20x20_rms,u_rms_poly_re2000_p6_20x20_rms,v_rms_poly_re2000_p6_20x20_rms,w_rms_poly_re2000_p6_20x20_rms,uv_rms_poly_re2000_p6_20x20_rms,u_men_poly_re2000_p6_20x20_rms,...
mean_eqm_re2000_p6_20x20_rms,mean_plus_eqm_re2000_p6_20x20_rms,ut_eqm_re2000_p6_20x20_rms,fluc_eqm_re2000_p6_20x20_rms,fluc_plus_eqm_re2000_p6_20x20_rms,yele_eqm_re2000_p6_20x20_rms,ys_eqm_re2000_p6_20x20_rms,u_rms_eqm_re2000_p6_20x20_rms,v_rms_eqm_re2000_p6_20x20_rms,w_rms_eqm_re2000_p6_20x20_rms,uv_rms_eqm_re2000_p6_20x20_rms,u_men_eqm_re2000_p6_20x20_rms,...
mean_re2000_p6_20x20_rms,mean_plus_re2000_p6_20x20_rms,ut_re2000_p6_20x20_rms,fluc_re2000_p6_20x20_rms,fluc_plus_re2000_p6_20x20_rms,yele_re2000_p6_20x20_rms,ys_re2000_p6_20x20_rms,u_rms_re2000_p6_20x20_rms,v_rms_re2000_p6_20x20_rms,w_rms_re2000_p6_20x20_rms,uv_rms_re2000_p6_20x20_rms,u_men_re2000_p6_20x20_rms,...
mu2000,moser2000,ut_moser2000,moser2000_fluc,...
mean_poly_re2000_p7_20x20_rms,mean_plus_poly_re2000_p7_20x20_rms,ut_poly_re2000_p7_20x20_rms,fluc_poly_re2000_p7_20x20_rms,fluc_plus_poly_re2000_p7_20x20_rms,yele_poly_re2000_p7_20x20_rms,ys_poly_re2000_p7_20x20_rms,u_rms_poly_re2000_p7_20x20_rms,v_rms_poly_re2000_p7_20x20_rms,w_rms_poly_re2000_p7_20x20_rms,uv_rms_poly_re2000_p7_20x20_rms,u_men_poly_re2000_p7_20x20_rms,...
mean_eqm_re2000_p7_20x20_rms,mean_plus_eqm_re2000_p7_20x20_rms,ut_eqm_re2000_p7_20x20_rms,fluc_eqm_re2000_p7_20x20_rms,fluc_plus_eqm_re2000_p7_20x20_rms,yele_eqm_re2000_p7_20x20_rms,ys_eqm_re2000_p7_20x20_rms,u_rms_eqm_re2000_p7_20x20_rms,v_rms_eqm_re2000_p7_20x20_rms,w_rms_eqm_re2000_p7_20x20_rms,uv_rms_eqm_re2000_p7_20x20_rms,u_men_eqm_re2000_p7_20x20_rms,...
mean_re2000_p7_20x20_rms,mean_plus_re2000_p7_20x20_rms,ut_re2000_p7_20x20_rms,fluc_re2000_p7_20x20_rms,fluc_plus_re2000_p7_20x20_rms,yele_re2000_p7_20x20_rms,ys_re2000_p7_20x20_rms,u_rms_re2000_p7_20x20_rms,v_rms_re2000_p7_20x20_rms,w_rms_re2000_p7_20x20_rms,uv_rms_re2000_p7_20x20_rms,u_men_re2000_p7_20x20_rms,...
leg,mytitle,save_pics,pic_dir,pic_file);

%% SSWM Cartoon
% mu543,moser,ut_moser,moser_fluc,...
% mean_poly_p7_20x20_rms,mean_plus_poly_p7_20x20_rms,ut_poly_p7_20x20_rms,fluc_poly_p7_20x20_rms,fluc_plus_poly_p7_20x20_rms,yele_poly_p7_20x20_rms,ys_poly_p7_20x20_rms,u_rms_poly_p7_20x20_rms,v_rms_poly_p7_20x20_rms,w_rms_poly_p7_20x20_rms,uv_rms_poly_p7_20x20_rms,u_men_poly_p7_20x20_rms,...
% mean_eqm_p7_20x20_rms,mean_plus_eqm_p7_20x20_rms,ut_eqm_p7_20x20_rms,fluc_eqm_p7_20x20_rms,fluc_plus_eqm_p7_20x20_rms,yele_eqm_p7_20x20_rms,ys_eqm_p7_20x20_rms,u_rms_eqm_p7_20x20_rms,v_rms_eqm_p7_20x20_rms,w_rms_eqm_p7_20x20_rms,uv_rms_eqm_p7_20x20_rms,u_men_eqm_p7_20x20_rms,...
% mean_p7_20x20_rms,mean_plus_p7_20x20_rms,ut_p7_20x20_rms,fluc_p7_20x20_rms,fluc_plus_p7_20x20_rms,yele_p7_20x20_rms,ys_p7_20x20_rms,u_rms_p7_20x20_rms,v_rms_p7_20x20_rms,w_rms_p7_20x20_rms,uv_rms_p7_20x20_rms,u_men_p7_20x20_rms,...


figure
semilogx(moser(:,2).*(moser(:,2)<100),moser(:,3).*(moser(:,2)<100),'k-')
hold on
semilogx(mean_plus_eqm_p7_20x20_rms(:,1).*(mean_plus_eqm_p7_20x20_rms(:,1)<100),mean_plus_eqm_p7_20x20_rms(:,8).*(mean_plus_eqm_p7_20x20_rms(:,1)<100),'b--')
semilogx(mean_plus_eqm_p7_20x20_rms(:,1).*(mean_plus_eqm_p7_20x20_rms(:,1)>=100),mean_plus_eqm_p7_20x20_rms(:,8).*(mean_plus_eqm_p7_20x20_rms(:,1)>=100),'r-')
[ d, ix ] = min( abs( mean_plus_eqm_p7_20x20_rms(:,1)-100 ) );
semilogx(mean_plus_eqm_p7_20x20_rms(ix,1),mean_plus_eqm_p7_20x20_rms(ix,8),'m*','MarkerSize',15)
legend('Modeled Profile','Under-resolved LES','Resolved LES','Matching Point','Location','NorthWest')
xlim([0.1,max(moser(:,2))])
ylim([-1,25])
% set(gca,'xtick',[(yele_en_p1(1:2)+1)*ut_en_p1/mu_p1,(yele_en_p2(1:2)+1)*ut_en_p2/mu_p2,(yele_en_p3(1:2)+1)*ut_en_p3/mu_p3])
grid on
xlabel('y^+')
ylabel('u^+')
set(gcf,'Position',[100,100,1000,600])
pic_dir = "/home/steven/Documents/Research/Nek5000/NekMatl/navier_stokes/aThesis/paper";
pic_file = "sswm_schematic";
print(gcf,pic_dir+"/"+pic_file+'.png','-dpng','-r500');   

