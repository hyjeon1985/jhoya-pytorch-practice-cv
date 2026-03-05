import torch


def build_sample_batch(batch_size: int = 4, channels: int = 3, height: int = 224, width: int = 224) -> torch.Tensor:
    return torch.rand(batch_size, channels, height, width)


def main() -> None:
    batch = build_sample_batch()
    print(f"torch: {torch.__version__}")
    print(f"cuda available: {torch.cuda.is_available()}")
    print(f"sample batch shape: {tuple(batch.shape)}")


if __name__ == "__main__":
    main()
