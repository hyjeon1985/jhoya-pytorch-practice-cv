def test_import_torch():
    import torch

    assert hasattr(torch, "__version__")
