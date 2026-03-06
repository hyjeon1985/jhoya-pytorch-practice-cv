import random
import torch
import torch.backends.cudnn as cudnn


def fix_all_seeds(num: int) -> None:
    torch.manual_seed(num)
    torch.cuda.manual_seed(num)
    torch.cuda.manual_seed_all(num)
    cudnn.benchmark = False
    cudnn.deterministic = True
    random.seed(num)
