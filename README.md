---
title: Alzheimer's Disease RAG Chatbot
emoji: 🧠
colorFrom: blue
colorTo: indigo
sdk: docker
app_port: 7860
pinned: false
---

# Alzheimer's Disease RAG Chatbot

This Space runs a Chainlit + LangChain RAG chatbot over a prebuilt FAISS index created from the Alzheimer's disease PDF in `data/`.

## Runtime

- App server: Chainlit
- Retrieval store: local FAISS index in `vectorstore/db_faiss`
- Embedding model: `sentence-transformers/all-MiniLM-L6-v2`
- Default LLM: `HuggingFaceTB/SmolLM2-360M-Instruct`
- Dependency manager: `uv`

## Local development

```bash
uv lock
uv sync
uv run chainlit run chatbot.py -h --host 127.0.0.1 --port 8000
```

## Space Secrets / Variables

- `HF_TOKEN`: optional, recommended if you want authenticated Hugging Face model downloads
- `LLM_MODEL_ID`: optional override for the default language model

## Notes

- The first cold start may take longer because the Space needs to download the model weights.
- If you attach persistent storage, the startup script will reuse `/data` as the Hugging Face cache directory.
- The FAISS index is already committed, so the Space does not rebuild embeddings at startup.
- The Docker image expects `uv.lock` to exist, installs dependencies with `uv sync --frozen`, and launches the app with `uv run`.
