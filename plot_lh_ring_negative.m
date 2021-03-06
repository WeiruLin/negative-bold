% left hemisphere's Ring-negative ROI
clear;
close all;

load('roi_Data.mat', 'lrn_roi');

% threshold for discriminating the biased voxels
t_thr=1;    % t-statistics threshold
B_thr=1;    % beta coefficients
B_lim=5;

% bin width and bin limits for plotting
bin_width=0.2;
bin_limit=[-5, 5];

%%
% extract left eye biased voxels
j=1; 
for i=1:numel(lrn_roi(:,1))
    if (lrn_roi(i, 11)+lrn_roi(i, 14)) - (lrn_roi(i, 23)+lrn_roi(i, 26)) > 2*B_thr ...
            && (abs(lrn_roi(i, 5))<B_lim && abs(lrn_roi(i, 8))<B_lim && abs(lrn_roi(i, 17))<B_lim && abs(lrn_roi(i, 20))<B_lim) ...
            && (abs(lrn_roi(i, 11))<B_lim && abs(lrn_roi(i, 14))<B_lim && abs(lrn_roi(i, 23))<B_lim && abs(lrn_roi(i, 26))<B_lim) ...
%             && (lrn_roi(i, 6)>t_thr || lrn_roi(i, 9)>t_thr || lrn_roi(i, 18)>t_thr || lrn_roi(i, 21)>t_thr) ... 
%             && (lrn_roi(i, 12)<-t_thr || lrn_roi(i, 15)<-t_thr || lrn_roi(i, 24)<-t_thr || lrn_roi(i, 27)<-t_thr) %((ldn_roi(i, 6)+ldn_roi(i, 9))> 2*t_thr || (ldn_roi(i, 18)+ldn_roi(i, 21)> 2*t_thr))
        leye_bias_ldn(j, :)=lrn_roi(i, :);
        j=j+1;
    end
end

% beta-values under left/right eye disk condition in left eye biased voxels
left_disk_eye=(leye_bias_ldn(:, 5) + leye_bias_ldn(:, 8))/2;
right_disk_eye=(leye_bias_ldn(:, 17) + leye_bias_ldn(:, 20))/2;

% beta values under left/right eye ring conditin in left eye biased voxels
left_ring_eye=(leye_bias_ldn(:, 11) + leye_bias_ldn(:, 14))/2;
right_ring_eye=(leye_bias_ldn(:, 23) + leye_bias_ldn(:, 26))/2;

% plot figure
figure 
subplot(2,2,1)
histogram(left_disk_eye, 'BinWidth', bin_width, 'FaceColor', 'b', 'BinLimit', bin_limit);
hold on
histogram(right_disk_eye, 'BinWidth', bin_width, 'FaceColor', 'y', 'BinLimit', bin_limit);
hold off
title('left/right eye disk beta value')
xlabel('beta value');
ylabel('voxels number');
legend('left eye disk', 'right eye disk');

subplot(2,2,2)
histogram(left_ring_eye, 'BinWidth', bin_width, 'FaceColor', 'b', 'BinLimit', bin_limit);
hold on 
histogram(right_ring_eye, 'BinWidth', bin_width, 'FaceColor', 'y', 'BinLimit', bin_limit);
title('left/right eye ring beta value')
xlabel('beta value');
ylabel('voxels number');
legend('left eye ring', 'right eye ring');

subplot(2,2,3)
boxplot([left_disk_eye, right_disk_eye],'Labels',{'left', 'right'}, 'symbol', '-');
ylabel('beta- value');

subplot(2,2,4)
boxplot([left_ring_eye, right_ring_eye],'Labels',{'left', 'right'}, 'symbol', '-');
ylabel('beta- value');

suptitle('Left hemisphere: left eye biased');


% %%
% % extract left biased voxels, but this time biased for negative signal
% j=1; 
% for i=1:numel(ldn_roi(:,1))
%     if (ldn_roi(i, 11)+ldn_roi(i, 14)) < (ldn_roi(i, 23)+ldn_roi(i, 26)) + 2*B_thr
%         N_leye_bias_ldn(j, :)=ldn_roi(i, :);
%         j=j+1;
%     end
% end
% 
% % beta-values under left/right eye disk condition in left eye biased voxels
% N_left_disk_eye=(N_leye_bias_ldn(:, 5) + N_leye_bias_ldn(:, 8))/2;
% N_right_disk_eye=(N_leye_bias_ldn(:, 17) + N_leye_bias_ldn(:, 20))/2;
% 
% % beta values under right eye disk conditin in left eye biased voxels
% N_left_ring_eye=(N_leye_bias_ldn(:, 11) + N_leye_bias_ldn(:, 14))/2;
% N_right_ring_eye=(N_leye_bias_ldn(:, 23) + N_leye_bias_ldn(:, 26))/2;
% 
% % plot figure
% figure 
% subplot(2,2,1)
% histogram(N_left_disk_eye, 'BinWidth', bin_width, 'FaceColor', 'b', 'BinLimit', bin_limit);
% hold on
% histogram(N_right_disk_eye, 'BinWidth', bin_width, 'FaceColor', 'y', 'BinLimit', bin_limit);
% hold off
% title('Distribution of left/right eye disk beta value in left eye biased voxels')
% xlabel('beta value');
% ylabel('voxels number');
% legend('left eye disk', 'right eye disk');
% 
% subplot(2,2,2)
% histogram(N_left_ring_eye, 'BinWidth', bin_width, 'FaceColor', 'b', 'BinLimit', bin_limit);
% hold on 
% histogram(N_right_ring_eye, 'BinWidth', bin_width, 'FaceColor', 'y', 'BinLimit', bin_limit);
% title('Distribution of left/right eye ring beta value in left eye biased voxels')
% xlabel('beta value');
% ylabel('voxels number');
% legend('left eye ring', 'right eye ring');
% 
% subplot(2,2,3)
% boxplot([N_left_disk_eye, N_right_disk_eye],'Labels',{'left eye disk', 'right eye disk'});
% ylabel('beta- value');
% 
% subplot(2,2,4)
% boxplot([N_left_ring_eye, N_right_ring_eye],'Labels',{'left eye ring', 'right eye ring'});
% ylabel('beta- value');
% 
% suptitle('Negative first Left hemisphere: left eye biased voxels analysis');

%%
% extract right eye biased voxels
j=1; 
for i=1:numel(lrn_roi(:,1))
    if (lrn_roi(i, 23)+lrn_roi(i, 26)) - (lrn_roi(i, 11)+lrn_roi(i, 14)) > 2*B_thr ... 
            && (abs(lrn_roi(i, 5))<B_lim && abs(lrn_roi(i, 8))<B_lim && abs(lrn_roi(i, 17))<B_lim && abs(lrn_roi(i, 20))<B_lim) ...
            &&  (abs(lrn_roi(i, 11))<B_lim && abs(lrn_roi(i, 14))<B_lim && abs(lrn_roi(i, 23))<B_lim && abs(lrn_roi(i, 26))<B_lim) ...
%             && (lrn_roi(i, 6)>t_thr || lrn_roi(i, 9)>t_thr || lrn_roi(i, 18)>t_thr || lrn_roi(i, 21)>t_thr) ...
%             && (lrn_roi(i, 12)<-t_thr || lrn_roi(i, 15)<-t_thr || lrn_roi(i, 24)<-t_thr || lrn_roi(i, 27)<-t_thr) %((ldn_roi(i, 6)+ldn_roi(i, 9))> 2*t_thr || (ldn_roi(i, 18)+ldn_roi(i, 21)> 2*t_thr))
        reye_bias_ldn(j, :)=lrn_roi(i, :);
        j=j+1;
    end
end

% beta-values under left/right eye disk condition in right eye biased voxels
left_disk_eye=(reye_bias_ldn(:, 5) + reye_bias_ldn(:, 8))/2;
right_disk_eye=(reye_bias_ldn(:, 17) + reye_bias_ldn(:, 20))/2;

% beta values under left/right eye ring conditin in right eye biased voxels
left_ring_eye=(reye_bias_ldn(:, 11) + reye_bias_ldn(:, 14))/2;
right_ring_eye=(reye_bias_ldn(:, 23) + reye_bias_ldn(:, 26))/2;

% plot figure
figure 
subplot(2,2,1)
histogram(left_disk_eye, 'BinWidth', bin_width, 'FaceColor', 'b', 'BinLimit', bin_limit);
hold on
histogram(right_disk_eye, 'BinWidth', bin_width, 'FaceColor', 'y', 'BinLimit', bin_limit);
hold off
title('left/right eye disk beta value')
xlabel('beta value');
ylabel('voxels number');
legend('left eye disk', 'right eye disk');

subplot(2,2,2)
histogram(left_ring_eye, 'BinWidth', bin_width, 'FaceColor', 'b', 'BinLimit', bin_limit);
hold on 
histogram(right_ring_eye, 'BinWidth', bin_width, 'FaceColor', 'y', 'BinLimit', bin_limit);
title('left/right eye ring beta value')
xlabel('beta value');
ylabel('voxels number');
legend('left eye ring', 'right eye ring');

subplot(2,2,3)
boxplot([left_disk_eye, right_disk_eye],'Labels',{'left', 'right'}, 'symbol', '-');
ylabel('beta- value');

subplot(2,2,4)
boxplot([left_ring_eye, right_ring_eye],'Labels',{'left', 'right'}, 'symbol', '-');
ylabel('beta- value');

suptitle('Left hemisphere: right eye biased');

%%
% extract left orientation biased voxels
j=1; 
for i=1:numel(lrn_roi(:,1))
    if (lrn_roi(i, 11)+lrn_roi(i, 23)) - (lrn_roi(i, 14)+lrn_roi(i, 26)) > 2*B_thr ...
            && (abs(lrn_roi(i, 5))<B_lim && abs(lrn_roi(i, 8))<B_lim && abs(lrn_roi(i, 17))<B_lim && abs(lrn_roi(i, 20))<B_lim) ...
            &&  (abs(lrn_roi(i, 11))<B_lim && abs(lrn_roi(i, 14))<B_lim && abs(lrn_roi(i, 23))<B_lim && abs(lrn_roi(i, 26))<B_lim) ...
%             && (lrn_roi(i, 6)>t_thr || lrn_roi(i, 9)>t_thr || lrn_roi(i, 18)>t_thr || lrn_roi(i, 21)>t_thr) ...
%             && (lrn_roi(i, 12)<-t_thr || lrn_roi(i, 15)<-t_thr || lrn_roi(i, 24)<-t_thr || lrn_roi(i, 27)<-t_thr) %((ldn_roi(i, 9)+ldn_roi(i, 21))> 2*t_thr || (ldn_roi(i, 6)+ldn_roi(i, 18)> 2*t_thr))
        lori_bias_ldn(j, :)=lrn_roi(i, :);
        j=j+1;
    end
end

% beta-values under left/right eye disk condition in left orientation biased voxels
left_disk_ori=(lori_bias_ldn(:, 5) + lori_bias_ldn(:, 17))/2;
right_disk_ori=(lori_bias_ldn(:, 8) + lori_bias_ldn(:, 20))/2;

% beta values under left/right eye ring conditin in left orientation biased voxels
left_ring_ori=(lori_bias_ldn(:, 11) + lori_bias_ldn(:, 23))/2;
right_ring_ori=(lori_bias_ldn(:, 14) + lori_bias_ldn(:, 26))/2;

% plot figure
figure 
subplot(2,2,1)
histogram(left_disk_ori, 'BinWidth', bin_width, 'FaceColor', 'b', 'BinLimit', bin_limit);
hold on
histogram(right_disk_ori, 'BinWidth', bin_width, 'FaceColor', 'y', 'BinLimit', bin_limit);
hold off
title('left/right eye disk beta value')
xlabel('beta value');
ylabel('voxels number');
legend('left ori disk', 'right ori disk');

subplot(2,2,2)
histogram(left_ring_ori, 'BinWidth', bin_width, 'FaceColor', 'b', 'BinLimit', bin_limit);
hold on 
histogram(right_ring_ori, 'BinWidth', bin_width, 'FaceColor', 'y', 'BinLimit', bin_limit);
title('left/right eye ring beta value')
xlabel('beta value');
ylabel('voxels number');
legend('left ori ring', 'right ori ring');

subplot(2,2,3)
boxplot([left_disk_ori, right_disk_ori],'Labels',{'left', 'right'}, 'symbol', '-');
ylabel('beta- value');

subplot(2,2,4)
boxplot([left_ring_ori, right_ring_ori],'Labels',{'left', 'right'}, 'symbol', '-');
ylabel('beta- value');

suptitle('Left hemisphere: left orientation biased');

%%
% extract right orientation biased voxels
j=1; 
for i=1:numel(lrn_roi(:,1))
    if (lrn_roi(i, 14)+lrn_roi(i, 26)) - (lrn_roi(i, 11)+lrn_roi(i, 23)) > 2*B_thr ... 
            && (abs(lrn_roi(i, 5))<B_lim && abs(lrn_roi(i, 8))<B_lim && abs(lrn_roi(i, 17))<B_lim && abs(lrn_roi(i, 20))<B_lim) ...
            && (abs(lrn_roi(i, 11))<B_lim && abs(lrn_roi(i, 14))<B_lim && abs(lrn_roi(i, 23))<B_lim && abs(lrn_roi(i, 26))<B_lim) ...
%             && (lrn_roi(i, 6)>t_thr || lrn_roi(i, 9)>t_thr || lrn_roi(i, 18)>t_thr || lrn_roi(i, 21)>t_thr) ...
%             && (lrn_roi(i, 12)<-t_thr || lrn_roi(i, 15)<-t_thr || lrn_roi(i, 24)<-t_thr || lrn_roi(i, 27)<-t_thr) %((ldn_roi(i, 9)+ldn_roi(i, 21))> 2*t_thr || (ldn_roi(i, 6)+ldn_roi(i, 18)> 2*t_thr))
        rori_bias_ldn(j, :)=lrn_roi(i, :);
        j=j+1;
    end
end

% beta-values under left/right ori disk condition in right orientation biased voxels
left_disk_ori=(rori_bias_ldn(:, 5) + rori_bias_ldn(:, 17))/2;
right_disk_ori=(rori_bias_ldn(:, 8) + rori_bias_ldn(:, 20))/2;

% beta values under left/right ori ring conditin in right orientation biased voxels
left_ring_ori=(rori_bias_ldn(:, 11) + rori_bias_ldn(:, 23))/2;
right_ring_ori=(rori_bias_ldn(:, 14) + rori_bias_ldn(:, 26))/2;

% plot figure
figure 
subplot(2,2,1)
histogram(left_disk_ori, 'BinWidth', bin_width, 'FaceColor', 'b', 'BinLimit', bin_limit);
hold on
histogram(right_disk_ori, 'BinWidth', bin_width, 'FaceColor', 'y', 'BinLimit', bin_limit);
hold off
title('left/right eye disk beta value')
xlabel('beta value');
ylabel('voxels number');
legend('left ori disk', 'right ori disk');

subplot(2,2,2)
histogram(left_ring_ori, 'BinWidth', bin_width, 'FaceColor', 'b', 'BinLimit', bin_limit);
hold on 
histogram(right_ring_ori, 'BinWidth', bin_width, 'FaceColor', 'y', 'BinLimit', bin_limit);
title('left/right eye ring beta value')
xlabel('beta value');
ylabel('voxels number');
legend('left ori ring', 'right ori ring');

subplot(2,2,3)
boxplot([left_disk_ori, right_disk_ori],'Labels',{'left', 'right'}, 'symbol', '-');
ylabel('beta- value');

subplot(2,2,4)
boxplot([left_ring_ori, right_ring_ori],'Labels',{'left', 'right'}, 'symbol', '-');
ylabel('beta- value');

suptitle('Left hemisphere: right orientation biased');