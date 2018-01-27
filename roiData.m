% this script is used to exstract roi data from all voxels
clear;

% data
all_data=load('state_exp.txt');

% right disk/ring pos/neg
rdn=load('rh.001.txt');
rdp=load('rh.002.txt');
rrp=load('rh.003.txt');
rrn=load('rh.004.txt');
rnn=load('rh.005.txt'); % right neg-neg

% left disk/ring pos/neg
ldn=load('lh.001.txt');
ldp=load('lh.002.txt');
lrp=load('lh.003.txt');
lrn=load('lh.004.txt');
lnn=load('lh.005.txt'); % left neg-neg

% all_data's rows' and columns' numbers
all_voxels=numel(all_data(:,1));
all_columns=numel(all_data(1,:));

% each roi's number of voxels
num_rdn=numel(rdn(:,1));
num_rdp=numel(rdp(:,1));
num_rrp=numel(rrp(:,1));
num_rrn=numel(rrn(:,1));
num_rnn=numel(rnn(:,1));

num_ldn=numel(ldn(:,1));
num_ldp=numel(ldp(:,1));
num_lrp=numel(lrp(:,1));
num_lrn=numel(lrn(:,1));
num_lnn=numel(lnn(:,1));

% set roi
rdn_roi=zeros(num_rdn, all_columns);
rdp_roi=zeros(num_rdp, all_columns);
rrp_roi=zeros(num_rrp, all_columns);
rrn_roi=zeros(num_rrn, all_columns);
rnn_roi=zeros(num_rnn, all_columns);

ldn_roi=zeros(num_ldn, all_columns);
ldp_roi=zeros(num_ldp, all_columns);
lrp_roi=zeros(num_lrp, all_columns);
lrn_roi=zeros(num_lrn, all_columns);
lnn_roi=zeros(num_lnn, all_columns);

% from all_data select each roi
for i = 1:num_rdn
    for j=1:all_voxels
        if (all_data(j,1)==rdn(i,1) && all_data(j,2)==rdn(i,2) && all_data(j,3)==rdn(i,3))
            rdn_roi(i,:)=all_data(j,:);
        end
    end
end

for i = 1:num_rdp
    for j=1:all_voxels
        if (all_data(j,1)==rdp(i,1) && all_data(j,2)==rdp(i,2) && all_data(j,3)==rdp(i,3))
            rdp_roi(i,:)=all_data(j,:);
        end
    end
end

for i = 1:num_rrp
    for j=1:all_voxels
        if (all_data(j,1)==rrp(i,1) && all_data(j,2)==rrp(i,2) && all_data(j,3)==rrp(i,3))
            rrp_roi(i,:)=all_data(j,:);
        end
    end
end

for i = 1:num_rrn
    for j=1:all_voxels
        if (all_data(j,1)==rrn(i,1) && all_data(j,2)==rrn(i,2) && all_data(j,3)==rrn(i,3))
            rrn_roi(i,:)=all_data(j,:);
        end
    end
end

for i =1:num_rnn
    for j=1:all_voxels
        if (all_data(j,1)==rnn(i,1) && all_data(j,2)==rnn(i,2) && all_data(j,3)==rnn(i,3))
            rnn_roi(i,:)=all_data(j,:);
        end
    end
end

for i = 1:num_ldn
    for j=1:all_voxels
        if (all_data(j,1)==ldn(i,1) && all_data(j,2)==ldn(i,2) && all_data(j,3)==ldn(i,3))
            ldn_roi(i,:)=all_data(j,:);
        end
    end
end

for i=1:num_ldp
    for j=1:all_voxels
        if (all_data(j,1)==ldp(i,1) && all_data(j,2)==ldp(i,2) && all_data(j,3)==ldp(i,3))
            ldp_roi(i,:)=all_data(j,:);
        end
    end
end

for i=1:num_lrp
    for j=1:all_voxels
        if (all_data(j,1)==lrp(i,1) && all_data(j,2)==lrp(i,2) && all_data(j,3)==lrp(i,3))
            lrp_roi(i,:)=all_data(j,:);
        end
    end
end

for i=1:num_lrn
    for j=1:all_voxels
        if (all_data(j,1)==lrn(i,1) && all_data(j,2)==lrn(i,2) && all_data(j,3)==lrn(i,3))
            lrn_roi(i,:)=all_data(j,:);
        end
    end
end

for i=1:num_lnn
    for j=1:all_voxels
        if (all_data(j,1)==lnn(i,1) && all_data(j,2)==lnn(i,2) && all_data(j,3)==lnn(i,3))
            lnn_roi(i,:)=all_data(j,:);
        end
    end
end

save roi_Data rdn_roi rdp_roi rrp_roi rrn_roi rnn_roi ... 
    ldn_roi ldp_roi lrp_roi lrn_roi lnn_roi;

