
%MATLAB Code for ERP graphs published in Afzali et al. (2022) (https://doi.org/10.1111/psyp.14110) ...
% and Afzali et al. (2023) (https://doi.org/10.1002/acp.4050).
% The code is developed by Usman Afzali (https://github.com/usman-afzali) with help from Dr Roland Pfister
% (http://roland-pfister.net)

% Date 10 March 2023

% Read all ERP data from xls.x files to MATLAB.

% Reading ERP data for Afzali et al. Real Crime (2022)

L22 = xlsread('graphsRealLife2022.xlsx', 'L22');
L24 = xlsread('graphsRealLife2022.xlsx', 'L24');
L28 = xlsread('graphsRealLife2022.xlsx', 'L28');

% Reading ERP data for Afzali et al. Real Crime (2022)

C01 = xlsread('graphs-1.xlsx', 'C01-Flatmate Assault');
C02 = xlsread('graphs-1.xlsx', 'C02-Flatmate Assault');
C03 = xlsread('graphs-1.xlsx', 'C03-Flatmate Assault');
C07 = xlsread('graphs-1.xlsx', 'C07-Armour Guard Heist');
C08 = xlsread('graphs-1.xlsx', 'C08-Armour Guard Heist');
C09 = xlsread('graphs-1.xlsx', 'C09-Armour Guard Heist');
C10 = xlsread('graphs-1.xlsx', 'C10-Armour Guard Heist');
C11AGH = xlsread('graphs-1.xlsx', 'C11-Armour Guard Heist');
C13 = xlsread('graphs-1.xlsx', 'C13-Robbery');
C14 = xlsread('graphs-1.xlsx', 'C14-Robbery');
C15 = xlsread('graphs-1.xlsx', 'C15-Robbery');
C16 = xlsread('graphs-1.xlsx', 'C16-Robbery');
C11R = xlsread('graphs-1.xlsx', 'C11-Robbery');
C11SD = xlsread('graphs-1.xlsx', 'C11-Stolen Dog');

% AND for 2023

% Reading ERP data for Afzali et al. (2023)

% S03E1 = xlsread('graphs-1.xlsx', 'CAT09-c');
% S04E1 = xlsread('graphs-1.xlsx', 'CAT10');
% S01E1 = xlsread('graphs-1.xlsx', 'S01SC');
% S01E2 = xlsread('graphs-1.xlsx', 'SCC23-man');
% S05E1 = xlsread('graphs-1.xlsx', 'INR07-c');
% S05E2 = xlsread('graphs-1.xlsx', 'INR07-manip');
% S07E1 = xlsread('graphs-1.xlsx', 'SPR03-cont');
% S07E2 = xlsread('graphs-1.xlsx', 'spr031-man');
% S09E1 = xlsread('graphs-1.xlsx', 'POC21-c');
% S09E2 = xlsread('graphs-1.xlsx', 'POC21-m');
% S11E1 = xlsread('graphs-1.xlsx', 'BFI17');
% S11E2 = xlsread('graphs-1.xlsx', 'BFI17-m');
% S31E1 = xlsread('graphs-1.xlsx', 'RUC01');
% S31E2 = xlsread('graphs-1.xlsx', 'RUC01-man2');
% S33E1 = xlsread('graphs-1.xlsx', 'RUC25');
% S02E1 = xlsread('graphs-1.xlsx', 'SCC24');
% S26E1 = xlsread('graphs-1.xlsx', 'HPT11-c');
% S26E2 = xlsread('graphs-1.xlsx', 'HPT11-man');
% S29E1 = xlsread('graphs-1.xlsx', 'BMO15-c');
% S29E2 = xlsread('graphs-1.xlsx', 'BMO15-m');
% S30E1 = xlsread('graphs-1.xlsx', 'BMO16');
% S03E2 = xlsread('graphs-1.xlsx', 'CAT09-man');
% S06E1 = xlsread('graphs-1.xlsx', 'INR08');
% S08E1 = xlsread('graphs-1.xlsx', 'spr04');
% S34E1 = xlsread('graphs-1.xlsx', 'TVE05');
% S34E2 = xlsread('graphs-1.xlsx', 'TVE05-manip');
% S36E1 = xlsread('graphs-1.xlsx', 'TVE27');
% S10E1 = xlsread('graphs-1.xlsx', 'POC22');
% S13E1 = xlsread('BFI37.xlsx', 'BFI37');
% S14E1 = xlsread('graphs-1.xlsx', 'SEW19-c');
% S14E2 = xlsread('graphs-1.xlsx', 'SEW19-m');
% S15E1 = xlsread('graphs-1.xlsx', 'SEW20');
% S16E1 = xlsread('graphs-1.xlsx', 'TQT31-c');
% S16E2 = xlsread('graphs-1.xlsx', 'TQT31-m');
% S17E1 = xlsread('graphs-1.xlsx', 'TQT32');
% S18E1 = xlsread('graphs-1.xlsx', 'STS29c');
% S18E2 = xlsread('graphs-1.xlsx', 'STS29-m');
% S19E1 = xlsread('graphs-1.xlsx', 'STS30');
% S20E1 = xlsread('graphs-1.xlsx', 'TCP13-c');
% S20E2 = xlsread('graphs-1.xlsx', 'TPC13-m');
% S21E1 = xlsread('graphs-1.xlsx', 'TPC14');
% S22E1 = xlsread('graphs-1.xlsx', 'MOS33-c');
% S22E2 = xlsread('MOS33-m.xlsx', 'MOS33-m');
% S23E1 = xlsread('MOS34.xlsx', 'MOS34');
% S24E1 = xlsread('HOR31-c.xlsx', 'HOR31-c');
% S24E2 = xlsread('HOR31-m.xlsx', 'HOR31-m');
% S25E1 = xlsread('HOR32.xlsx', 'HOR32');



%% Section 1

% Create ERP graphs for all subjects of Afzali et al. 2022

allSubjects2022 = {'C01','C02','C03','C07', ...
     'C08','C09','C10','C11AGH','C13',      ...
     'C14','C15','C16','C11R','C11SD'};

% Create subfolder for plots if not available already
outdir = 'allSubjects2022Plots';
if ~exist(outdir,'dir')
    mkdir(outdir);
end

% Write one plot each
for iplotdat = 1:length(allSubjects2022)
%if false
    cursbj_str = allSubjects2022{iplotdat};
    curplotdat = eval(cursbj_str);
    
    irrelevant_PD = curplotdat (1,:);
    target_PD = curplotdat (2, :);
    probe_PD = curplotdat (3, :);
    
    figure(1);
    subplot(1,1,1);
    hold off
    plot (irrelevant_PD);
    hold on
    plot (target_PD);
    plot(probe_PD);
    
    title([cursbj_str]);
    legend('Irrelevant', 'Target', 'Probe');
    
    saveas(gcf, ['allSubjects2022Plots/' cursbj_str '.png']);
    
end


% Write 4x4 grid plot
figure(2)
hold off
for iplotdat = 1:length(allSubjects2022)
    subplot(4,4,iplotdat)
    cursbj_str = allSubjects2022{iplotdat};
    curplotdat = eval(cursbj_str);
    
    irrelevant_PD = curplotdat (1,:);
    target_PD = curplotdat (2, :);
    probe_PD = curplotdat (3, :);
    
    hold off
    plot (irrelevant_PD);
    hold on
    plot (target_PD);
    plot(probe_PD);
    
    title(cursbj_str);
    %ylim ([-10,20]); %We'd use this and turn the `if` statment off in the
    %previous command if we wanted to keep the same ylim for all ERPs.
    
end

% Add legend
subplot(4,4,16)
plot(1);
hold on;
plot(2);
plot(3);
set(gca,'Visible','off');
legend('Irrelevant', 'Target', 'Probe', 'Location', 'bestoutside');
    
saveas(gcf,'allSubjects2022Plots/allSubjects2022.png');


%% Section 2

% Create ERP graphs for all IPc subjects in Exp-1 of Afzali et al. 2023

ipc2023Exp1 = {'S01E1','S03E1','S05E1',      ...
     'S07E1', 'S09E1', ...
     'S11E1', 'S14E1', ...
     'S16E1', ...
     'S18E1', 'S20E1', ...
     'S22E1', 'S24E1', ...
     'S26E1', 'S29E1', ...
     'S31E1', ...
     'S34E1'};

% Create subfolder for plots if not available already
outdir = 'ipc2023Exp1Plots';
if ~exist(outdir,'dir')
    mkdir(outdir);
end

% Write one plot each
for iplotdat = 1:length(ipc2023Exp1)
%if false
    cursbj_str = ipc2023Exp1{iplotdat};
    curplotdat = eval(cursbj_str);
    
    irrelevant_PD = curplotdat (1,:);
    target_PD = curplotdat (2, :);
    probe_PD = curplotdat (3, :);
    
    figure(1);
    subplot(1,1,1);
    hold off
    plot (irrelevant_PD);
    hold on
    plot (target_PD);
    plot(probe_PD);
    
    title([cursbj_str]);
    legend('Irrelevant', 'Target', 'Probe');
    
    saveas(gcf, ['ipc2023Exp1Plots/' cursbj_str '.png']);
    
end


% Write 4x5 grid plot
figure(2)
hold off
for iplotdat = 1:length(ipc2023Exp1)
    subplot(4,5,iplotdat)
    cursbj_str = ipc2023Exp1{iplotdat};
    curplotdat = eval(cursbj_str);
    
    irrelevant_PD = curplotdat (1,:);
    target_PD = curplotdat (2, :);
    probe_PD = curplotdat (3, :);
    
    hold off
    plot (irrelevant_PD);
    hold on
    plot (target_PD);
    plot(probe_PD);
    
    title(cursbj_str);
    %ylim ([-10,20]);
    
end

% Add legend
subplot(4,4,16)
plot(1);
hold on;
plot(2);
plot(3);
set(gca,'Visible','off');
legend('Irrelevant', 'Target', 'Probe', 'Location', 'bestoutside');
    
saveas(gcf,'ipc2023Exp1Plots/ipc2023Exp1.png');

%% Section 3

% Create ERP graphs for all IPc subjects in Exp-2 of Afzali et al. 2023

ipc2023Exp2 = {'S01E2', ...
     'S03E2','S05E2',      ...
     'S07E2', 'S09E2' ...
     'S11E2', ...
     'S14E2', 'S16E2', ...
     'S18E2', 'S20E2', ...
     'S22E2', ...
     'S24E2', 'S26E2', ...
     'S29E2', 'S31E2', ...
     'S34E2'};

% Create subfolder for plots if not available already
outdir = 'ipc2023Exp2Plots';
if ~exist(outdir,'dir')
    mkdir(outdir);
end

% Write one plot each
for iplotdat = 1:length(ipc2023Exp2)
%if false
    cursbj_str = ipc2023Exp2{iplotdat};
    curplotdat = eval(cursbj_str);
    
    irrelevant_PD = curplotdat (1,:);
    target_PD = curplotdat (2, :);
    probe_PD = curplotdat (3, :);
    
    figure(1);
    subplot(1,1,1);
    hold off
    plot (irrelevant_PD);
    hold on
    plot (target_PD);
    plot(probe_PD);
    
    title([cursbj_str]);
    legend('Irrelevant', 'Target', 'Probe');
    
    saveas(gcf, ['ipc2023Exp2Plots/' cursbj_str '.png']);
    
end


% Write 4x5 grid plot
figure(2)
hold off
for iplotdat = 1:length(ipc2023Exp2)
    subplot(4,5,iplotdat)
    cursbj_str = ipc2023Exp2{iplotdat};
    curplotdat = eval(cursbj_str);
    
    irrelevant_PD = curplotdat (1,:);
    target_PD = curplotdat (2, :);
    probe_PD = curplotdat (3, :);
    
    hold off
    plot (irrelevant_PD);
    hold on
    plot (target_PD);
    plot(probe_PD);
    
    title(cursbj_str);
    %ylim ([-10,20]);
    
end

% Add legend
subplot(4,4,16)
plot(1);
hold on;
plot(2);
plot(3);
set(gca,'Visible','off');
legend('Irrelevant', 'Target', 'Probe', 'Location', 'bestoutside');
    
saveas(gcf,'ipc2023Exp2Plots/ipc2023Exp2.png');


%% Section 4

% Create ERP graphs for all IAc subjects in Exp-1 of Afzali et al. 2023

iac2023Exp1 = {'S02E1', ...
     'S04E1', 'S06E1',      ...
     'S08E1', ...
     'S10E1', 'S13E1', 'S15E1', 'S17E1', ...
     'S19E1', ...
     'S21E1', 'S23E1', ...
     'S25E1', 'S30E1', 'S33E1', ...
     'S36E1'};

% Create subfolder for plots if not available already
outdir = 'iac2023Exp1Plots';
if ~exist(outdir,'dir')
    mkdir(outdir);
end

% Write one plot each
for iplotdat = 1:length(iac2023Exp1)
%if false
    cursbj_str = iac2023Exp1{iplotdat};
    curplotdat = eval(cursbj_str);
    
    irrelevant_PD = curplotdat (1,:);
    target_PD = curplotdat (2, :);
    probe_PD = curplotdat (3, :);
    
    figure(1);
    subplot(1,1,1);
    hold off
    plot (irrelevant_PD);
    hold on
    plot (target_PD);
    plot(probe_PD);
    
    title([cursbj_str]);
    legend('Irrelevant', 'Target', 'Probe');
    
    saveas(gcf, ['iac2023Exp1Plots/' cursbj_str '.png']);
    
end


% Write 4x4 grid plot
figure(2)
hold off
for iplotdat = 1:length(iac2023Exp1)
    subplot(4,4,iplotdat)
    cursbj_str = iac2023Exp1{iplotdat};
    curplotdat = eval(cursbj_str);
    
    irrelevant_PD = curplotdat (1,:);
    target_PD = curplotdat (2, :);
    probe_PD = curplotdat (3, :);
    
    hold off
    plot (irrelevant_PD);
    hold on
    plot (target_PD);
    plot(probe_PD);
    
    title(cursbj_str);
    %ylim ([-10,20]);
    
end

% Add legend
subplot(4,4,16)
plot(1);
hold on;
plot(2);
plot(3);
set(gca,'Visible','off');
legend('Irrelevant', 'Target', 'Probe', 'Location', 'bestoutside');
    
saveas(gcf,'iac2023Exp1Plots/iac2023Exp1.png');

%% Section 5: This is to recreate only ERPs that are reported in Afzali et al. (2022) 
% - that is a subset of all ERPs.

% Create ERP graphs for all subjects of Afzali et al. 2022

allSubjects2022b = {'L22', 'L24', 'L28', 'C01','C02','C03','C07', ...
     'C08','C09','C10','C11AGH','C13',      ...
     'C14','C15','C16','C11R','C11SD'};

% Create subfolder for plots if not available already
outdir = 'allSubjects2022Plots2';
if ~exist(outdir,'dir')
    mkdir(outdir);
end

% Write one plot each
for iplotdat = 1:length(allSubjects2022b)
%if false
    cursbj_str = allSubjects2022b{iplotdat};
    curplotdat = eval(cursbj_str);
    
    irrelevant_PD = curplotdat (1,:);
    target_PD = curplotdat (2, :);
    probe_PD = curplotdat (3, :);
    
    figure(1);
    subplot(1,1,1);
    hold off
    plot (irrelevant_PD);
    hold on
    plot (target_PD);
    plot(probe_PD);
    
    title([cursbj_str]);
    legend('Irrelevant', 'Target', 'Probe');
    
    saveas(gcf, ['allSubjects2022Plots2/' cursbj_str '.png']);
    
end


% Write 5x4 grid plot
figure(2)
hold off
for iplotdat = 1:length(allSubjects2022b)
    subplot(5,4,iplotdat)
    cursbj_str = allSubjects2022b{iplotdat};
    curplotdat = eval(cursbj_str);
    
    irrelevant_PD = curplotdat (1,:);
    target_PD = curplotdat (2, :);
    probe_PD = curplotdat (3, :);
    
    hold off
    plot (irrelevant_PD);
    hold on
    plot (target_PD);
    plot(probe_PD);
    
    title(cursbj_str);
    %ylim ([-10,20]); %We'd use this and turn the `if` statment off in the
    %previous command if we wanted to keep the same ylim for all ERPs.
    
end

% Add legend
subplot(5,4,20)
plot(1);
hold on;
plot(2);
plot(3);
set(gca,'Visible','off');
legend('Irrelevant', 'Target', 'Probe', 'Location', 'bestoutside');
    
saveas(gcf,'allSubjects2022Plots2/allSubjects2022b.png');



% THE END.