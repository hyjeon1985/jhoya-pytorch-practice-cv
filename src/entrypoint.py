import torch
from cv.__main__ import main as run_cv

def build_sample_batch(batch_size: int = 4, channels: int = 3, height: int = 224, width: int = 224) -> torch.Tensor:
    return torch.rand(batch_size, channels, height, width)


def main() -> None:
    run_cv()


if __name__ == "__main__":
    main()
