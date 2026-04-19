FROM python:3.10-slim

RUN useradd -m -u 1000 user

USER user
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    UV_LINK_MODE=copy

WORKDIR $HOME/app

RUN pip install --no-cache-dir --upgrade pip uv

COPY --chown=user pyproject.toml uv.lock ./

RUN uv sync --frozen --no-dev

COPY --chown=user . .

EXPOSE 7860

CMD ["sh", "start.sh"]
