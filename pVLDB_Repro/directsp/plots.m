%%---------------------------
goodplot();
m=[1,2,3,4,5,6,7];
qp = [0.272476252,0.417396488,0.362110309,0.322956758,0.348760669,6.9949,19.86031937];
wlse = [0.023253694,0.079537463,0.060177243,0.069038549,0.154773795,6.721330481,16.81294083];
direct = [0.005,0.0086,0.009,0.0091,0.0214,0.8135,2];
%labels = {'N-182_E-183_SD-495','N-191_E-192_SD-574','N-230_E-237_SD-690','N-274_E-281_SD-827','N-389_E-403_SD-1222','N-1123_E-1278_SD-9330','N-1231_E-1421_SD-21058'};
plot(m, qp, 's-', 'LineWidth', 4,'markers',14,'Color', [200, 20, 20]/256);
hold on;
grid on;
plot(m,wlse, 'o-', 'LineWidth', 4,'markers',14,'Color', [20, 20, 200]/256);
plot(m,direct, '^-', 'LineWidth', 4,'markers',14, 'Color', [20, 200 , 20]/256);
legend('QP','WLSE','Direct','location','northwest');
ylabel('time (sec) -- logscale');
axis([1 7 0.005 20]);
set(gca,'XTick',1:1:7);
set(gca,'xticklabels',{'N1','N2','N3','N4','N5','N6','N7'});
%set(gca,'XTickLabelRotation',45)
set(gca,'FontSize',14);
set(gca,'FontWeight','Bold');
set(get(gca,'xlabel'),'FontSize', 14, 'FontWeight', 'Bold');
set(get(gca,'ylabel'),'FontSize', 14, 'FontWeight', 'Bold');
set(gca,'YScale','log');
%xlabel('');
%set(gca,'YTick',cellstr(num2str(round(log10(YTick(:))), '10^%d')));
print -dpdf -r150 baselinevsdirect.pdf;
hold off;
%%--------------------------------
goodplot();
seven = [2, 16.81294083, 19.86031937];
bar(seven);
set(gca,'xticklabels',{'Direct','WLSE','QP'});
ylabel('time (sec)');
%set(gca,'XTickLabelRotation',45)
set(gca,'FontSize',16);
set(gca,'FontWeight','Bold');
set(get(gca,'xlabel'),'FontSize', 16, 'FontWeight', 'Bold');
set(get(gca,'ylabel'),'FontSize', 16, 'FontWeight', 'Bold');
print -dpdf -r150 baseline7.pdf;
six = [0.8135, 6.721330481,6.9949];
bar(six);
set(gca,'xticklabels',{'Direct','WLSE','QP'});
ylabel('time (sec)');
%set(gca,'XTickLabelRotation',45)
set(gca,'FontSize',16);
set(gca,'FontWeight','Bold');
set(get(gca,'xlabel'),'FontSize', 16, 'FontWeight', 'Bold');
set(get(gca,'ylabel'),'FontSize', 16, 'FontWeight', 'Bold');
print -dpdf -r150 baseline6.pdf;
five = [0.0214, 0.154773795, 0.348760669];
bar(five);
set(gca,'xticklabels',{'Direct','WLSE','QP'});
ylabel('time (sec)');
%set(gca,'XTickLabelRotation',45)
set(gca,'FontSize',16);
set(gca,'FontWeight','Bold');
set(get(gca,'xlabel'),'FontSize', 16, 'FontWeight', 'Bold');
set(get(gca,'ylabel'),'FontSize', 16, 'FontWeight', 'Bold');
print -dpdf -r150 baseline5.pdf;
four = [0.0091, 0.069038549, 0.322956758];
bar(four);
set(gca,'xticklabels',{'Direct','WLSE','QP'});
ylabel('time (sec)');
%set(gca,'XTickLabelRotation',45)
set(gca,'FontSize',16);
set(gca,'FontWeight','Bold');
set(get(gca,'xlabel'),'FontSize', 16, 'FontWeight', 'Bold');
set(get(gca,'ylabel'),'FontSize', 16, 'FontWeight', 'Bold');
print -dpdf -r150 baseline4.pdf;
three = [0.009, 0.060177243, 0.362110309];
bar(three);
set(gca,'xticklabels',{'Direct','WLSE','QP'});
ylabel('time (sec)');
%set(gca,'XTickLabelRotation',45)
set(gca,'FontSize',16);
set(gca,'FontWeight','Bold');
set(get(gca,'xlabel'),'FontSize', 16, 'FontWeight', 'Bold');
set(get(gca,'ylabel'),'FontSize', 16, 'FontWeight', 'Bold');
print -dpdf -r150 baseline3.pdf;
two = [0.0086, 0.079537463,0.417396488];
bar(two);
set(gca,'xticklabels',{'Direct','WLSE','QP'});
ylabel('time (sec)');
%set(gca,'XTickLabelRotation',45)
set(gca,'FontSize',16);
set(gca,'FontWeight','Bold');
set(get(gca,'xlabel'),'FontSize', 16, 'FontWeight', 'Bold');
set(get(gca,'ylabel'),'FontSize', 16, 'FontWeight', 'Bold');
print -dpdf -r150 baseline2.pdf;
one =[0.005, 0.023253694, 0.272476252];
bar(one);
set(gca,'xticklabels',{'Direct','WLSE','QP'});
ylabel('time (sec)');
%set(gca,'XTickLabelRotation',45)
set(gca,'FontSize',16);
set(gca,'FontWeight','Bold');
set(get(gca,'xlabel'),'FontSize', 16, 'FontWeight', 'Bold');
set(get(gca,'ylabel'),'FontSize', 16, 'FontWeight', 'Bold');
print -dpdf -r150 baseline1.pdf;
%%-------------------------------------
goodplot();
th = [2 3 4 5 6 7 8 9 10 11 12];
time = [4.5215020e-01,4.1004980e-01,3.2412780e-01,4.9913000e-02,4.5666200e-02,3.9931200e-02,2.0413600e-02,1.9482200e-02,1.8108200e-02,1.8083200e-02,1.8027000e-02]
error = [2.2082297e+02,2.2333971e+02,2.3338192e+02,2.4951006e+02,2.4960592e+02,2.4997162e+02,2.5215543e+02,2.5215543e+02,2.5215543e+02,2.5215543e+02,2.5215543e+02]
yyaxis left
plot(th, time, 'LineWidth', 4,'markers',14);
hold on;
grid on;
xlabel('Threshold');
ylabel('Time (sec)');
%axis([3 6 0 inf]);
%set(gca,'XTick',3:1:6);
yyaxis right
plot(th, error, 'LineWidth', 4,'markers',14);
ylabel('Average error'); 
print -dpdf -r150 3187.pdf;
hold off;
%%-------------------------------------
goodplot();
th = [2 3 4 5 6 7 8 9 10 11 12];
time = [3.9516634e+02,3.951e+02,3.6842164e+02,3.1682117e+02,2.5142054e+02,2.5029986e+02,2.2934760e+02,2.2362973e+02,2.3032704e+02,1.8381847e+02,1.8522921e+02]
error = [6.1170216e+03,6.1170216e+03,6.1339781e+03,6.2915411e+03,6.3483029e+03,6.3491335e+03,6.3587262e+03,6.3626722e+03,6.3668589e+03,6.3677315e+03,6.3680873e+03]
yyaxis left
plot(th, time, 'LineWidth', 4,'markers',14);
hold on;
grid on;
xlabel('Threshold');
ylabel('Time (sec)');
%axis([3 6 0 inf]);
%set(gca,'XTick',3:1:6);
yyaxis right
plot(th, error, 'LineWidth', 4,'markers',14);
ylabel('Average error'); 
print -dpdf -r150 136099.pdf;
hold off;