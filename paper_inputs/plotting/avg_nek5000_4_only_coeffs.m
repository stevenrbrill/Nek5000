function [ys,u_avg,v_avg,w_avg,P_avg,yele] = avg_nek5000_4_only_coeffs(dir,poly_file,Ex,Ey,Ez)
E = Ex*Ey*Ez;


%   - data:   nek5000 data ordered as (iel,inode,[x|y|(z)|u|v|(w)|p|T|s_i])
%   - lr1:    element-size vector (lx1,ly1,lz1)
[poly_data,poly_lr1,poly_elmap,poly_time,poly_istep] = readnek(dir+poly_file);
    

P = poly_lr1(1)-1;
[z,w] = zwgll(P);

poly_x = reshape(poly_data(:,:,1),[E,P+1,P+1,P+1]);
poly_y = reshape(poly_data(:,:,2),[E,P+1,P+1,P+1]);
poly_z = reshape(poly_data(:,:,3),[E,P+1,P+1,P+1]);
poly_u = reshape(poly_data(:,:,4),[E,P+1,P+1,P+1]);
poly_v = reshape(poly_data(:,:,5),[E,P+1,P+1,P+1]);
poly_w = reshape(poly_data(:,:,6),[E,P+1,P+1,P+1]);
poly_P = reshape(poly_data(:,:,7),[E,P+1,P+1,P+1]);

% Get element sizes
Lx = zeros(E,1); Ly = zeros(E,1); Lz = zeros(E,1);
for i = 1:E
    Lx(i) = poly_x(i,end,1,1) - poly_x(i,1,1,1);
    Ly(i) = poly_y(i,1,end,1) - poly_y(i,1,1,1);
    Lz(i) = poly_z(i,1,1,end) - poly_z(i,1,1,1);
end
Lx_all = poly_x(end,end,1,1) - poly_x(1,1,1,1);
Lz_all = poly_z(end,1,1,end) - poly_z(1,1,1,1);

yele = zeros(Ey+1,1);
ys = zeros(Ey*(P+1),1);
for i = 1:Ey
    yele(i) = poly_y((i-1)*Ex+1,1,1,1);
    for j = 1:P+1
        ys((i-1)*(P+1)+j) = poly_y((i-1)*Ex+1,1,j,1);
    end
end
yele(Ey+1) = poly_y((i-1)*Ex+1,1,end,1);


y_avg = reshape(poly_y(:,1,:,1),[E,P+1]);
u_sum1 = zeros(E,P+1);
v_sum1 = zeros(E,P+1);
w_sum1 = zeros(E,P+1);
P_sum1 = zeros(E,P+1);
for i = 1:E
    w2d = (w/2*Lx(i))*(w/2*Lz(i))';
    for j = 1:P+1
        u_temp = w2d.*reshape(poly_u(i,:,j,:),[P+1,P+1]);
        u_sum1(i,j) = sum(u_temp,'all');
        v_temp = w2d.*reshape(poly_v(i,:,j,:),[P+1,P+1]);
        v_sum1(i,j) = sum(v_temp,'all');
        w_temp = w2d.*reshape(poly_w(i,:,j,:),[P+1,P+1]);
        w_sum1(i,j) = sum(w_temp,'all');
        P_temp = w2d.*reshape(poly_P(i,:,j,:),[P+1,P+1]);
        P_sum1(i,j) = sum(P_temp,'all');
    end
end

u_sum2 = zeros(1,Ey*(P+1));
v_sum2 = zeros(1,Ey*(P+1));
w_sum2 = zeros(1,Ey*(P+1));
P_sum2 = zeros(1,Ey*(P+1));
for iy = 1:Ey
    for iz = 1:Ez
        for ix = 1:Ex
            iel = (iz-1)*(Ex*Ey)+(iy-1)*Ex+ix;
            u_sum2((iy-1)*(P+1)+1:iy*(P+1)) = u_sum2((iy-1)*(P+1)+1:iy*(P+1)) + u_sum1(iel,:);
            v_sum2((iy-1)*(P+1)+1:iy*(P+1)) = v_sum2((iy-1)*(P+1)+1:iy*(P+1)) + v_sum1(iel,:);
            w_sum2((iy-1)*(P+1)+1:iy*(P+1)) = w_sum2((iy-1)*(P+1)+1:iy*(P+1)) + w_sum1(iel,:);
            P_sum2((iy-1)*(P+1)+1:iy*(P+1)) = P_sum2((iy-1)*(P+1)+1:iy*(P+1)) + P_sum1(iel,:);
        end
    end
end

u_avg = u_sum2/(Lx_all*Lz_all);
v_avg = v_sum2/(Lx_all*Lz_all);
w_avg = w_sum2/(Lx_all*Lz_all);
P_avg = P_sum2/(Lx_all*Lz_all);
end