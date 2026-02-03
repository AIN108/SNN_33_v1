%% 통합된 가중치 추출 및 저장 코드
% 3by3 수동검증 코드, nonclock, clock 차이 없음

% 가중치 테이블 생성
weight_table=[out.w1_1 out.w2_1 out.w3_1 out.w4_1 out.w5_1 out.w6_1 out.w7_1 out.w8_1 out.w9_1  ...
              out.w1_2 out.w2_2 out.w3_2 out.w4_2 out.w5_2 out.w6_2 out.w7_2 out.w8_2 out.w9_2  ...
              out.w1_3 out.w2_3 out.w3_3 out.w4_3 out.w5_3 out.w6_3 out.w7_3 out.w8_3 out.w9_3  ...
              out.w1_4 out.w2_4 out.w3_4 out.w4_4 out.w5_4 out.w6_4 out.w7_4 out.w8_4 out.w9_4 ];   
           
[wrow, wcol] = size(weight_table);
time_table = out.tout(:,1);

% 샘플링 설정
fixedStepSize = 0.005;
samplingInterval = 0.400 / fixedStepSize; % 2초 기준

% 각 시간점에서 가중치 추출
for k = 1:36
    synapse_var(k).time = time_table(:,1);
    synapse_var(k).weight = weight_table(:,k);
    synapse_var(k).last = weight_table(wrow,k);
    last_table(1,k) = synapse_var(k).last;
    
    weight_table0(1,k) = weight_table(1,k);
    weight_table1(1,k) = weight_table(2 * samplingInterval + 1,k);
    weight_table2(1,k) = weight_table(4 * samplingInterval + 1,k);
    weight_table3(1,k) = weight_table(6 * samplingInterval + 1,k);
    weight_table4(1,k) = weight_table(8 * samplingInterval + 1,k);
    weight_table5(1,k) = weight_table(10 * samplingInterval + 1,k);
    weight_table6(1,k) = weight_table(12 * samplingInterval + 1,k);
    weight_table7(1,k) = weight_table(14 * samplingInterval + 1,k);
    weight_table8(1,k) = weight_table(16 * samplingInterval + 1,k);
    weight_table9(1,k) = weight_table(18 * samplingInterval + 1,k);
end

%% 시각화
% Figure 설정
width = 1000;
height = 800;
screenSize = get(0, 'ScreenSize');
left = (screenSize(3) - width) / 2;
bottom = (screenSize(4) - height) / 2;
figure('Position', [left, bottom, width, height]);

% Synapse map 생성
synapse_map = [ weight_table0(1:9)' ...
               weight_table0(10:18)' ...
               weight_table0(19:27)' ...
               weight_table0(28:36)' ...
               weight_table1(1:9)' ...
               weight_table1(10:18)' ...
               weight_table1(19:27)' ...
               weight_table1(28:36)' ...
               weight_table2(1:9)' ...
               weight_table2(10:18)' ...
               weight_table2(19:27)' ...
               weight_table2(28:36)' ...
               weight_table3(1:9)' ...
               weight_table3(10:18)' ...
               weight_table3(19:27)' ...
               weight_table3(28:36)' ...
               weight_table4(1:9)' ...
               weight_table4(10:18)' ...
               weight_table4(19:27)' ...
               weight_table4(28:36)' ...
               weight_table5(1:9)' ...
               weight_table5(10:18)' ...
               weight_table5(19:27)' ...
               weight_table5(28:36)' ...
               weight_table6(1:9)' ...
               weight_table6(10:18)' ...
               weight_table6(19:27)' ...
               weight_table6(28:36)' ...
               weight_table7(1:9)' ...
               weight_table7(10:18)' ...
               weight_table7(19:27)' ...
               weight_table7(28:36)' ...
               weight_table8(1:9)' ...
               weight_table8(10:18)' ...
               weight_table8(19:27)' ...
               weight_table8(28:36)' ...
               weight_table9(1:9)' ...
               weight_table9(10:18)' ...
               weight_table9(19:27)' ...
               weight_table9(28:36)' ...
               last_table(1:9)' ...
               last_table(10:18)' ...
               last_table(19:27)' ...
               last_table(28:36)' ...
              ];
        
colormap(flipud(gray));
clim([0 150]);

for k = 1:44
    subplot(11,4, k);
    imagesc(reshape(synapse_map(:, k), 3, 3)')
    hold on;
    current_map = reshape(synapse_map(:, k), 3, 3)';
    
    % for i = 1:size(current_map, 1)
    %     for j = 1:size(current_map, 2)
    %         text(j, i, num2str(current_map(i, j), '%.2f'), ...
    %             'Color', 'red', 'HorizontalAlignment', 'center');
    %     end
    %end
end

%% 수정된 데이터 저장 부분

% 옵션 1: 전체 시계열 데이터 저장 (샘플링된 시간 포인트)
sampled_weights = [weight_table0; 
                   weight_table1;
                   weight_table2; 
                   weight_table3;
                   weight_table4;
                   weight_table5;
                   weight_table6;
                   weight_table7;
                   weight_table8;
                   weight_table9;
                   last_table];

% 시간 정보 포함
time_stamps = [0; 0.2; 0.4; 0.6; 0.8; 1.0; 1.2; 1.4; 1.6; 1.8; 2.0];
weights_with_time = [time_stamps, sampled_weights];

% CSV로 저장 (첫 열은 시간, 나머지는 가중치)
writematrix(weights_with_time, 'synapse_weight_timeseries_v1.csv');
fprintf('시계열 데이터 저장 완료: %d 시간점 x %d 시냅스\n', size(sampled_weights, 1), size(sampled_weights, 2));

% 옵션 2: 더 세밀한 샘플링
downsample_factor = 1000; % 1000개 단위로 샘플링
if wrow > downsample_factor
    fine_sampled_weights = weight_table(1:downsample_factor:end, :);
    fine_time_points = time_table(1:downsample_factor:end);
    weights_fine = [fine_time_points, fine_sampled_weights];
    writematrix(weights_fine, 'synapse_weight_fine_v1.csv');
    fprintf('세밀한 샘플링 데이터 저장: %d 시간점\n', length(fine_time_points));
end

% 옵션 3: 가중치 변화 이벤트만 저장
significant_changes = [];
for syn = 1:36
    weight_diff = diff(weight_table(:, syn));
    change_indices = find(abs(weight_diff) > 0.1); % 유의미한 변화만
    
    if ~isempty(change_indices)
        for idx = change_indices'
            significant_changes = [significant_changes; 
                                 time_table(idx), syn, weight_table(idx, syn), weight_diff(idx)];
        end
    end
end

if ~isempty(significant_changes)
    change_table = array2table(significant_changes, ...
        'VariableNames', {'Time', 'Synapse', 'Weight', 'Change'});
    writetable(change_table, 'weight_changes_v1.csv');
    fprintf('가중치 변화 이벤트 저장: %d개 이벤트\n', size(significant_changes, 1));
else
    fprintf('유의미한 가중치 변화가 없습니다.\n');
end

% 기존 단일 시점 저장 (호환성 유지)
writematrix(last_table, 'synapse_weight_v1.csv');

%% 데이터 요약 출력
fprintf('\n=== 데이터 저장 완료 ===\n');
fprintf('1. synapse_weight_v1.csv: 최종 가중치 (1x36)\n');
fprintf('2. synapse_weight_timeseries_v1.csv: 시계열 데이터 (11x37, 시간 포함)\n');
if exist('weights_fine', 'var')
    fprintf('3. synapse_weight_fine_v1.csv: 세밀한 샘플링 데이터\n');
end
if ~isempty(significant_changes)
    fprintf('4. weight_changes_v1.csv: 가중치 변화 이벤트\n');
end
fprintf('========================\n');