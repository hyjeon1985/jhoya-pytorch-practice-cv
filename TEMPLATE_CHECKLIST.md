# Template Bootstrap Checklist

새 저장소 생성 직후 아래를 처리하세요.

- [ ] 저장소 이름/설명/가시성(public/private) 설정
- [ ] `README.md` 제목과 프로젝트 소개를 현재 목적에 맞게 수정
- [ ] `.env.example`의 `NVIDIA_PYTORCH_IMAGE`를 팀 표준 태그로 고정
- [ ] `make check-host`로 Docker/NVIDIA 상태 확인
- [ ] `docker login nvcr.io` 완료
- [ ] `make shell` 진입 후 `python src/smoke.py` 실행
- [ ] `pytest -q` 실행
- [ ] 첫 실습 노트북을 `notebooks/`에 추가
- [ ] 첫 커밋 생성 (`init from template`)
