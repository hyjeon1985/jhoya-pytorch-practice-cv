from src.entrypoint import build_sample_batch


def test_build_sample_batch_shape():
    batch = build_sample_batch(batch_size=2, channels=1, height=64, width=64)
    assert tuple(batch.shape) == (2, 1, 64, 64)
