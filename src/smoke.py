import torch


def main() -> None:
    print(f"torch: {torch.__version__}")
    print(f"cuda available: {torch.cuda.is_available()}")
    if torch.cuda.is_available():
        print(f"gpu count: {torch.cuda.device_count()}")
        print(f"gpu name: {torch.cuda.get_device_name(0)}")

    x = torch.rand(3, 3)
    y = torch.rand(3, 3)
    z = x @ y
    print("matmul ok:", z.shape)


if __name__ == "__main__":
    main()
