#!/bin/sh
set -eu

APP_PORT="${PORT:-7860}"

if [ -d /data ]; then
  export HF_HOME="/data/.huggingface"
  export TRANSFORMERS_CACHE="/data/.cache/huggingface/transformers"
  export SENTENCE_TRANSFORMERS_HOME="/data/.cache/sentence_transformers"
  mkdir -p "$HF_HOME" "$TRANSFORMERS_CACHE" "$SENTENCE_TRANSFORMERS_HOME"
fi

exec uv run chainlit run chatbot.py -h --host 0.0.0.0 --port "$APP_PORT"
