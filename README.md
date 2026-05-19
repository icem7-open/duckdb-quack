---
title: DuckDB Quack Server
emoji: 🦆
colorFrom: yellow
colorTo: yellow
sdk: docker
app_port: 9494
pinned: false
---

Serveur DuckDB Quack — mémoire seule.
À partir d'un space gratuit chez Hugging Face : https://huggingface.co/spaces

Les données viennent du dataset public `https://huggingface.co/datasets/ericmauviere/insee_rpdetail/`.
nginx gère le health check HF sur 9494 et proxifie vers Quack sur 9495.