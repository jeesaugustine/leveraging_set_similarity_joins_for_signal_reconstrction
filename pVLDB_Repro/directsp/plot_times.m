%%---------------------------
goodplot();
m=[1,2,3,4,5,6,7];
qp = [0.272476252,0.417396488,0.362110309,0.322956758,0.348760669,6.9949,19.86031937];
wlse = [0.023253694,0.079537463,0.060177243,0.069038549,0.154773795,6.721330481,16.81294083];
direct = [0.005,0.0086,0.009,0.0091,0.0214,0.8135,2];
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
