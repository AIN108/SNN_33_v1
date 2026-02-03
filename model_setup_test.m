   
%script for initialize variable.  
%%Training%%

same_pre_th_test=240;
same_post_th_test=1300;
threshold_pre_test=[0 same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test];
threshold_post_test=[0 same_post_th_test same_post_th_test same_post_th_test same_post_th_test];

%Threshold값이 변경되는 주기
Th_control_time2=2;
Th_control_time=[0 Th_control_time2];

%Threshold 값이 올라가는 기준 스파이크 수
Th_plus_count2=20;
Th_plus_count=[0 Th_plus_count2];
%Threshold 값이 올라가는 크기
Th_plus=[0 25];

%Threshold 값이 내려가는 기준 스파이크 수
Th_minus_count2=5;
Th_minus_count=[0 Th_minus_count2];
%Threshold 값이 내려가는 크기
Th_minus=[0 -20];

%Threshold 값이 유지되는 평균값
Th_mean_count2=(Th_plus_count2+Th_minus_count2)/2;
Th_mean_count=[0 Th_mean_count2];

%post neuron의 측면억제 변수53
later_inhibition=250;
later_table=[0 later_inhibition];

inhibition_rc=[0 0.00002];

%Threshold 최솟값, 최댓값
min_th=[0 170];
max_th=[0 1500];

%Threshold_var =[0 330];

%test 파일에서 weight 읽어오기
syna_var_a=load('synapes_weight_v1.csv');
syna_var=[0, syna_var_a];
%random_map=reshape(syna_var(2:37), 9, 4);


%test용 패턴(패턴당 500번씩 반복)
test_pattern=load('Pattern4_test.CSV');

