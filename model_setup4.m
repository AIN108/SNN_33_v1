   
%script for initialize variable.  
%%Training%%

%setup synapse initial random weight
%Rand_var_a=load('Random_50-100.csv');
%Rand_var_a=load('Random_100-150.csv');
%Rand_var_a=load('Random_50-150.csv');
%Rand_var_a=load('Random_150-200.csv');
%Rand_var_a=load('Random_180-200.csv');
%Rand_var_a=load('Random_65-85.csv');
%Rand_var_a=load('Random_80-120.csv');
Rand_var_a=load('200.csv');

Rand_var=[0 Rand_var_a]; 
random_map=reshape(Rand_var_a(1:36), 9, 4);

same_pre_th=375;
same_post_th=390;
threshold_pre=[0 same_pre_th same_pre_th same_pre_th same_pre_th same_pre_th same_pre_th same_pre_th same_pre_th same_pre_th];
threshold_post=[0 same_post_th same_post_th same_post_th same_post_th];

%Threshold값이 변경되는 주기
Th_control_time2=0.02;
Th_control_time=[0 Th_control_time2];

%Threshold 값이 올라가는 기준 스파이크 수
Th_plus_count2=20;
Th_plus_count=[0 Th_plus_count2];
%Threshold 값이 올라가는 크기
Th_plus=[0 25];

%Threshold 값이 내려가는 기준 스파이크 수
Th_minus_count2=10;
Th_minus_count=[0 Th_minus_count2];
%Threshold 값이 내려가는 크기
Th_minus=[0 -20];

%Threshold 값이 유지되는 평균값
Th_mean_count2=(Th_plus_count2+Th_minus_count2)/2;
Th_mean_count=[0 Th_mean_count2];

%STDP 함수(exponential)의 계수39
initial_LTP=[0 0.003];
initial_LTD=[0 0.009];

%Weight 최댓값, 최솟값
max_weight2=255;
min_weight2=150;
max_weight=[0 max_weight2];
min_weight=[0 min_weight2];

%STDP_RC=[0 0.01];
RC_LTP=[0 0.0002];
RC_LTD=[0 0.0002];

%시냅스의 weight rc값
synapse_weight_rc_s=[0 0.0000001];
synapse_weight_rc_l=[0 0.0000001];


%post neuron의 측면억제 변수53
later_inhibition=1200;
later_table=[0 later_inhibition];

inhibition_rc=[0 0.00002];

%threshold_pre=[0 350 350 350 350 350 350 350 350 350];
%threshold_post=[0 350 350 350 350];

%Threshold 최솟값, 최댓값
min_th=[0 170];
max_th=[0 1000];

%패턴3 전체 랜덤 (150-255)
%full_pattern=load('Pattern3_random.CSV');
%패턴3 500씩 반복 (150-255)
%full_pattern=load('Pattern3_500.CSV');
%패턴3 500씩 반복 (255)
%full_pattern=load('Pattern3_test.CSV');


%패턴4 1개씩 반복(255)
%full_pattern=load('Pattern4_1234.CSV');
%패턴4 2개씩 반복(255)
%full_pattern=load('Pattern4_2.CSV');
%패턴4 5개씩 반복(255)
%full_pattern=load('Pattern4_5.CSV');
%패턴4 10개씩 반복(255)
%full_pattern=load('Pattern4_10.CSV');
%패턴4 20개씩 반복(255)
%full_pattern=load('Pattern4_20.CSV');
%패턴4 100개씩 반복(255)
%full_pattern=load('Pattern4_100.CSV');
%패턴4 250개씩 반복(255)
full_pattern=load('Pattern4_250.CSV');

%Threshold 랜덤 초기값
%threshold_pre=load('threshold_random_pre_200-250.csv');
%threshold_post=load('threshold_random_post_200-250.csv');

%threshold_pre=load('threshold_random_pre_220-250.csv');
%threshold_post=load('threshold_random_post_220-250.csv');

%threshold_pre=load('threshold_random_pre_250-300.csv');
%threshold_post=load('threshold_random_post_250-300.csv');

%threshold_pre=load('threshold_random_pre_300-350.csv');
%threshold_post=load('threshold_random_post_300-350.csv');

%threshold_pre=load('threshold_random_pre_375.csv');
%threshold_post=load('threshold_random_post_390.csv');

%threshold_pre=load('threshold_random_pre_400-450.csv');
%threshold_post=load('threshold_random_post_400-450.csv');

%threshold_pre=load('threshold_random_pre_450-500.csv');
%threshold_post=load('threshold_random_post_450-500.csv');

%threshold_pre=load('threshold_random_pre_500-550.csv');
%threshold_post=load('threshold_random_post_500-550.csv');

%Threshold_var =[0 330];

%test 파일에서 weight 읽어오기
syna_var_a=load('synapes_weight_v1.csv');
syna_var=[0, syna_var_a];
%random_map=reshape(syna_var(2:37), 9, 4);

same_pre_th_test=375;
same_post_th_test=1200;
threshold_pre_test=[0 same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test same_pre_th_test];
threshold_post_test=[0 same_post_th_test same_post_th_test same_post_th_test same_post_th_test];




