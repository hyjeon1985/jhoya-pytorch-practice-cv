import matplotlib.pyplot as plt  # 시각화를 위한 라이브러리
import torch  # PyTorch 라이브러리
import torch.nn as nn  # 모델 구성을 위한 라이브러리
from torch.utils.data import DataLoader  # optimizer 설정을 위한 라이브러리

import torchvision  # PyTorch의 컴퓨터 비전 라이브러리
import torchvision.transforms as T  # 이미지 변환을 위한 모듈
import torchvision.utils as vutils  # 이미지를 쉽게 처리하기 위한 유틸리티 모듈

from cv.utils.seeds import fix_all_seeds


def run_dnn_practice() -> None:
    fix_all_seeds(42)
    print("running cv dnn practice")
