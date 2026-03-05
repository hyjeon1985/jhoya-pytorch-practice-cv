# PyTorch Practice Template (DGX Spark)

이 저장소는 DGX Spark에서 PyTorch 학습/실험 레포를 빠르게 시작하기 위한 **GitHub 템플릿 저장소**입니다.

## 이 템플릿의 기본 원칙

- 기본 실행 환경: NVIDIA NGC PyTorch 컨테이너
- 보조 실행 환경: 로컬 `venv` (컨테이너가 어려울 때만)
- 목표: 새 학습 레포를 5분 내에 실행 가능한 상태로 만들기

## GitHub 템플릿 저장소로 사용하는 방법

1. 이 저장소를 GitHub에 push
2. GitHub 저장소 `Settings`에서 `Template repository` 활성화
3. 새 프로젝트를 만들 때 `Use this template` 클릭
4. 생성된 새 저장소를 로컬로 clone

## 새로 만든 저장소에서 최초 1회 실행

```bash
cp .env.template .env
make check-host
docker login nvcr.io
make up
make deps
make run
make test
make notebook
```

## 자주 쓰는 명령

- `make shell`: 컨테이너 시작 + 셸 진입
- `make up`: 컨테이너 백그라운드 실행
- `make down`: 컨테이너 종료
- `make logs`: 컨테이너 로그 확인
- `make deps`: `requirements.txt` 의존성 설치
- `make run`: 고정 엔트리포인트 `src/entrypoint.py` 실행
- `make test`: 고정 테스트 엔트리포인트 `tests/test_entrypoint.py` 실행
- `make notebook`: 고정 노트북 엔트리포인트 `notebooks/entrypoint.ipynb` 실행
- `make check-host`: 호스트에서 Docker/NVIDIA 상태 점검
- `make local-venv`: 로컬 venv 보조 환경 구성

## 템플릿 커스터마이징 체크리스트

새 레포를 만든 뒤 `TEMPLATE_CHECKLIST.md`를 순서대로 처리하세요.

## 기본 디렉토리 구조

```text
.
├── .env.template
├── .gitignore
├── docker-compose.yml
├── Makefile
├── requirements.txt
├── notebooks/
│   └── entrypoint.ipynb
├── scripts/
│   ├── check_host.sh
│   ├── run_container.sh
│   └── setup_local_venv.sh
├── src/
│   ├── __init__.py
│   ├── entrypoint.py
│   └── smoke.py
└── tests/
    ├── test_entrypoint.py
    └── test_smoke_import.py
```

## 설정 포인트

- 컨테이너 이미지 태그: `.env.template`의 `NVIDIA_PYTORCH_IMAGE`
- 워크스페이스 마운트 경로: `.env.template`의 `HOST_WORKSPACE` (`.` 기본값으로 레포 루트 마운트)
- Jupyter 사용 시: 컨테이너 내부에서 `jupyter lab --ip=0.0.0.0 --port=8888 --no-browser`

## 참고

- DGX Spark PyTorch 가이드: https://docs.nvidia.com/dgx-spark-user-guide/use-pytorch.html
- DGX Spark 설정 가이드: https://docs.nvidia.com/dgx-spark-user-guide/setup.html
