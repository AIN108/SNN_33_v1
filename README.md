# SNN_33_v1

3x3 Spiking Neural Network (SNN) 패턴 인식 시스템의 MATLAB Simulink 구현

## 개요

본 프로젝트는 STDP(Spike-Timing Dependent Plasticity) 학습 규칙을 적용한 3x3 입력 구조의 스파이킹 신경망 시뮬레이션 환경을 제공합니다. 저전력 뉴로모픽 하드웨어 설계 검증을 위한 기능적 시뮬레이션 목적으로 개발되었습니다.

## 시스템 요구사항

- MATLAB R2023a 이상
- Simulink
- (권장) Simulink Coder

## 프로젝트 구조

```
SNN_33_v1/
├── slprj/                          # Simulink 프로젝트 캐시
├── model_setup4.m                  # 학습 모델 파라미터 초기화
├── model_setup_test.m              # 테스트 모델 파라미터 초기화
│
├── [Simulink 모델 - 학습]
│   ├── pattern3x3_training_2023clock.slx      # 클럭 동기 학습 모델
│   ├── pattern3x3_training_2023noclock.slx    # 비동기 학습 모델
│   └── stdp_pattern3x3_training_2023noclock.slx  # STDP 학습 모델
│
├── [Simulink 모델 - 추론]
│   └── pattern3x3_testing_2023v1.slx          # 테스트/추론 모델
│
├── [시냅스 분석 스크립트]
│   ├── ext_syna_3by3_v4.m
│   ├── ext_syna_3by3_v5.m
│   └── ext_syna_3by3_v6.m
│
├── [입력 패턴 데이터]
│   ├── Pattern3x3_4x250.CSV        # 학습용 패턴 (4종류 x 250샘플)
│   ├── Pattern4_250.CSV            # 추가 학습 데이터
│   └── Pattern4_test.CSV           # 테스트 데이터
│
└── [출력 데이터]
    ├── synapse_weight_v1.csv       # 최종 시냅스 가중치
    ├── synapse_weight_fine_v1.csv  # 정밀 가중치 데이터
    ├── synapse_weight_timeseries_v1.csv  # 시계열 가중치 변화
    └── weight_changes_v1.csv       # 학습 중 가중치 변화 기록
```

## 사용법

### 1. 학습 실행

```matlab
% 파라미터 초기화
model_setup4

% Simulink 모델 실행
open_system('stdp_pattern3x3_training_2023noclock')
sim('stdp_pattern3x3_training_2023noclock')
```

### 2. 시냅스 가중치 추출

```matlab
% 학습 완료 후 가중치 추출
ext_syna_3by3_v6
```

### 3. 테스트/추론 실행

```matlab
% 테스트 파라미터 초기화
model_setup_test

% 테스트 모델 실행
open_system('pattern3x3_testing_2023v1')
sim('pattern3x3_testing_2023v1')
```

## 패턴 데이터 형식

입력 패턴은 3x3 = 9개 픽셀을 1차원으로 펼친 형태의 CSV 파일입니다.

```
p1, p2, p3, p4, p5, p6, p7, p8, p9
```

각 값은 스파이크 발생 여부 또는 스파이크 타이밍을 나타냅니다.

## 주요 파라미터

학습 관련 파라미터는 `model_setup4.m`에서 설정합니다:

- 시냅스 가중치 초기값 및 범위
- STDP 학습률 (A+, A-)
- 시간 상수 (τ+, τ-)
- 뉴런 임계값

## 출력 결과

- `synapse_weight_v1.csv`: 학습 완료 후 최종 시냅스 가중치 행렬
- `weight_changes_v1.csv`: 에포크별 가중치 변화 추이

## 라이선스

연구 및 교육 목적으로 사용 가능합니다.

## 참고문헌

- Bi, G. Q., & Poo, M. M. (1998). Synaptic modifications in cultured hippocampal neurons: dependence on spike timing, synaptic strength, and postsynaptic cell type. *Journal of Neuroscience*, 18(24), 10464-10472.
