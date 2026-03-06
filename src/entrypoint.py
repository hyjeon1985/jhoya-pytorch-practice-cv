import torch
from cv.dnn import run_dnn_practice

def build_sample_batch(batch_size: int = 4, channels: int = 3, height: int = 224, width: int = 224) -> torch.Tensor:
    return torch.rand(batch_size, channels, height, width)


def main() -> None:
    run_dnn_practice()


if __name__ == "__main__":
    main()
