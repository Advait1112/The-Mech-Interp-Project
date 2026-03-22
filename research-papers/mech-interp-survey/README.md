# LLM Mechanistic Interpretability — Literature Survey (2021–2026)

A comprehensive sweep of high-impact, open-access papers on Large Language Model Mechanistic Interpretability, focusing on publications from **Anthropic (Transformer Circuits Thread)**, **Google DeepMind**, **OpenAI**, and heavily-cited **arXiv pre-prints** (cs.LG · cs.CL · cs.AI).

Papers are grouped into four thematic categories:

1. [Sparse Autoencoders (SAEs) & Dictionary Learning](#1-sparse-autoencoders-saes--dictionary-learning)
2. [Feature Superposition & Monosemanticity](#2-feature-superposition--monosemanticity)
3. [Feature Geometry, Compositional Arithmetic & Latent Space Dynamics](#3-feature-geometry-compositional-arithmetic--latent-space-dynamics)
4. [Circuits, Automated Discovery & Foundational Frameworks](#4-circuits-automated-discovery--foundational-frameworks)

---

## 1. Sparse Autoencoders (SAEs) & Dictionary Learning

| # | Title | Primary Authors | Year | Summary | Open-Access URL |
|---|-------|----------------|------|---------|----------------|
| 1 | **Toward Monosemanticity: Decomposing Language Models With Dictionary Learning** | Bricken, T., Jermyn, A., Lindsey, J., *et al.* (Anthropic) | 2023 | Introduces sparse autoencoders (SAEs) to decompose MLP activations of a one-layer transformer into monosemantic features, demonstrating that polysemantic neurons can be cleanly separated into interpretable, human-understandable concepts. | [HTML](https://transformer-circuits.pub/2023/monosemantic-features/index.html) |
| 2 | **Scaling Monosemanticity: Extracting Interpretable Features from Claude 3 Sonnet** | Templeton, A., Conerly, T., Marcus, J., *et al.* (Anthropic) | 2024 | Scales SAE training to Claude 3 Sonnet, recovering millions of interpretable features—including multimodal, multilingual, and safety-relevant concepts (e.g., a "dark triad" feature)—providing the strongest evidence yet for the universality of the superposition hypothesis. | [HTML](https://transformer-circuits.pub/2024/scaling-monosemanticity/index.html) |
| 3 | **Scaling and Evaluating Sparse Autoencoders** | Gao, L., la Tour, T. D., Tillman, H., *et al.* (OpenAI) | 2024 | Trains SAEs (dubbed "TopK-SAEs") up to GPT-4 scale and derives empirical scaling laws for dictionary learning, while also introducing improved automated and human evaluation metrics for feature interpretability. | [arXiv:2406.04093](https://arxiv.org/abs/2406.04093) · [PDF](https://arxiv.org/pdf/2406.04093) |
| 4 | **Gemma Scope: Open Sparse Autoencoders Everywhere All At Once on Gemma 2** | Lieberum, T., Rajamanoharan, S., Conmy, A., *et al.* (Google DeepMind) | 2024 | Releases a comprehensive open-source suite of JumpReLU-SAEs trained at every layer and sub-layer of Gemma 2 (2B, 9B, 27B), providing the community with a standardised toolkit for studying features at scale. | [arXiv:2408.05147](https://arxiv.org/abs/2408.05147) · [PDF](https://arxiv.org/pdf/2408.05147) |
| 5 | **Sparse Autoencoders Find Highly Interpretable Features in Language Models** | Cunningham, H., Ewart, A., Riggs, L., Huben, R., Sharkey, L. | 2023 | Demonstrates that SAEs trained on GPT-2 residual-stream activations recover monosemantic, context-invariant features that are substantially more interpretable than individual neurons, validated via automated and human scoring. | [arXiv:2309.08600](https://arxiv.org/abs/2309.08600) · [PDF](https://arxiv.org/pdf/2309.08600) |
| 6 | **Codebook Features: Sparse and Discrete Interpretability for Neural Networks** | Tamkin, A., Taufeeque, M., Goodman, N. D. (Anthropic / Stanford) | 2023 | Proposes replacing continuous MLP activations with discrete vector-quantised codebooks, yielding sparse, human-interpretable codes and enabling fine-grained causal intervention experiments on GPT-2. | [arXiv:2310.17230](https://arxiv.org/abs/2310.17230) · [PDF](https://arxiv.org/pdf/2310.17230) |

---

## 2. Feature Superposition & Monosemanticity

| # | Title | Primary Authors | Year | Summary | Open-Access URL |
|---|-------|----------------|------|---------|----------------|
| 7 | **Toy Models of Superposition** | Elhage, N., Henighan, T., Conerly, T., *et al.* (Anthropic) | 2022 | Uses controlled toy models to show that neural networks store more features than dimensions by exploiting almost-orthogonal directions; provides the theoretical foundation for the superposition hypothesis and explains polysemanticity. | [arXiv:2209.11169](https://arxiv.org/abs/2209.11169) · [PDF](https://arxiv.org/pdf/2209.11169) |
| 8 | **Polysemanticity and Capacity in Neural Networks** | Scherlis, A., Sachan, K., Jermyn, A., Bricken, T., Veit, A. (Anthropic / Cornell) | 2022 | Introduces the concept of *capacity*—the share of a feature stored in a neuron—to quantify polysemanticity; shows that features with higher importance and lower interference earn more dedicated capacity during training. | [arXiv:2210.01892](https://arxiv.org/abs/2210.01892) · [PDF](https://arxiv.org/pdf/2210.01892) |
| 9 | **Privileged Bases in the Transformer Residual Stream** | Elhage, N., *et al.* (Anthropic) | 2023 | Argues that the transformer residual stream has a privileged computational basis (unlike attention heads), meaning neurons in MLP layers are more interpretable than arbitrary linear combinations; motivates SAE work that decomposes along this basis. | [HTML](https://transformer-circuits.pub/2023/privileged-basis/index.html) |
| 10 | **Superposition, Memorization, and Double Descent** | Henighan, T., *et al.* (Anthropic) | 2023 | Connects superposition to the double-descent generalisation phenomenon, showing that memorisation of training data can be stored in superposed representations and that SAE sparsity can separate memorised vs. generalised features. | [HTML](https://transformer-circuits.pub/2023/toy-double-descent/index.html) |

---

## 3. Feature Geometry, Compositional Arithmetic & Latent Space Dynamics

| # | Title | Primary Authors | Year | Summary | Open-Access URL |
|---|-------|----------------|------|---------|----------------|
| 11 | **Not All Language Model Features Are Linear** | Engels, J., Liao, I., Michaud, E. J., Gurnee, W., Tegmark, M. (MIT) | 2024 | Identifies multi-dimensional *irreducible* features (e.g., days-of-the-week, months) in GPT-2 and Mistral-7B that live on non-linear manifolds (circles, toruses) inside residual-stream activation space, challenging the purely linear representation hypothesis. | [arXiv:2405.14860](https://arxiv.org/abs/2405.14860) · [PDF](https://arxiv.org/pdf/2405.14860) |
| 12 | **The Linear Representation Hypothesis and the Geometry of Large Language Models** | Park, K., Choe, Y. J., Veitch, V. (Google / UChicago) | 2023 | Formally defines the *linear representation hypothesis* and provides theoretical and empirical evidence that high-level semantic concepts are encoded as linear directions in embedding space, with concept arithmetic obeying simple vector operations. | [arXiv:2311.03658](https://arxiv.org/abs/2311.03658) · [PDF](https://arxiv.org/pdf/2311.03658) |
| 13 | **The Geometry of Truth: Emergent Linear Structure in Large Language Model Representations of True/False Datasets** | Marks, S., Tegmark, M. (MIT) | 2023 | Shows that truth values of factual statements are linearly represented across LLM layers and introduces the *probing* + *mass-mean* probing methodology, demonstrating that a single linear "truth direction" generalises across unrelated topics. | [arXiv:2310.06824](https://arxiv.org/abs/2310.06824) · [PDF](https://arxiv.org/pdf/2310.06824) |
| 14 | **Linear Representations of Sentiment in Large Language Models** | Tigges, C., Hollinsworth, O. J., Geiger, A., Nanda, N. (EleutherAI / Anthropic) | 2023 | Discovers a linear sentiment direction in GPT-2 residual streams that is causally responsible for downstream valence predictions; demonstrates that targeted activation addition along this direction reliably flips model sentiment. | [arXiv:2310.15154](https://arxiv.org/abs/2310.15154) · [PDF](https://arxiv.org/pdf/2310.15154) |
| 15 | **Representation Engineering: A Top-Down Approach to AI Transparency** | Zou, A., Phan, L., Chen, S., *et al.* (UIUC / CMU / Berkeley) | 2023 | Introduces *representation engineering* (RepE), which identifies concept-specific linear directions in LLM activations (honesty, harm, emotion) via PCA on contrastive stimulus pairs and uses them to monitor and steer model behaviour. | [arXiv:2310.01405](https://arxiv.org/abs/2310.01405) · [PDF](https://arxiv.org/pdf/2310.01405) |

---

## 4. Circuits, Automated Discovery & Foundational Frameworks

| # | Title | Primary Authors | Year | Summary | Open-Access URL |
|---|-------|----------------|------|---------|----------------|
| 16 | **A Mathematical Framework for Transformer Circuits** | Elhage, N., Nanda, N., Olsson, C., *et al.* (Anthropic) | 2021 | Introduces the *residual stream* and *QK/OV circuit* decomposition of transformers, enabling precise mathematical analysis of attention-head functions and laying the groundwork for all subsequent circuits-based interpretability work. | [HTML](https://transformer-circuits.pub/2021/framework/index.html) |
| 17 | **Interpretability in the Wild: A Circuit for Indirect Object Identification in GPT-2 Small** | Wang, K. R., Variengien, A., Conmy, A., Shlegeris, B., Steinhardt, J. | 2022 | Performs the first full end-to-end circuit analysis of a real NLP task (indirect object identification) in GPT-2 small, identifying a 26-attention-head circuit and validating it via ablation and activation patching. | [arXiv:2211.00593](https://arxiv.org/abs/2211.00593) · [PDF](https://arxiv.org/pdf/2211.00593) |
| 18 | **Towards Automated Circuit Discovery for Mechanistic Interpretability** | Conmy, A., Mavor-Parker, A. N., Lynch, A., Heimersheim, S., Garriga-Alonso, A. | 2023 | Proposes ACDC (Automated Circuit DisCovery), a greedy edge-pruning algorithm that automatically identifies faithful minimal circuits for tasks like IOI, docstring completion, and greater-than without manual analysis. | [arXiv:2304.14997](https://arxiv.org/abs/2304.14997) · [PDF](https://arxiv.org/pdf/2304.14997) |
| 19 | **Sparse Feature Circuits: Discovering and Editing Interpretable Causal Graphs in Language Models** | Samuel, B., Rager, C., Marks, S., Ferrando, J., Bhatt, G., Mueller, A. | 2024 | Combines SAE features with activation patching to build *sparse feature circuits*—DAGs of SAE latents—that provide sparse, human-interpretable causal accounts of model behaviour on classification tasks such as gender-bias detection. | [arXiv:2403.19647](https://arxiv.org/abs/2403.19647) · [PDF](https://arxiv.org/pdf/2403.19647) |
| 20 | **Progress Measures for Grokking via Mechanistic Interpretability** | Nanda, N., Chan, L., Lieberum, T., Smith, J., Steinhardt, J. | 2023 | Reverse-engineers the "grokking" generalisation phase transition in a small transformer trained on modular arithmetic, identifying the algorithm the model learns (Fourier multiplication) and the circuit implementing it, yielding interpretable progress measures. | [arXiv:2301.05217](https://arxiv.org/abs/2301.05217) · [PDF](https://arxiv.org/pdf/2301.05217) |

---

## Quick Reference: arXiv IDs by Category

| Category | arXiv IDs |
|----------|-----------|
| SAEs & Dictionary Learning | 2406.04093, 2408.05147, 2309.08600, 2310.17230 |
| Feature Superposition | 2209.11169, 2210.01892 |
| Feature Geometry | 2405.14860, 2311.03658, 2310.06824, 2310.15154, 2310.01405 |
| Circuits & Frameworks | 2211.00593, 2304.14997, 2403.19647, 2301.05217 |

> **Note on Transformer Circuits Thread papers** (papers 1, 2, 9, 10, 16): these were published directly as interactive HTML articles on [transformer-circuits.pub](https://transformer-circuits.pub) without a separate arXiv PDF. They are linked above and excluded from the automated download script. The remaining 15 papers have direct arXiv PDF URLs and are downloaded by the script below.

---

## Downloading the PDFs

Run the companion script to download all 15 arXiv PDFs into this directory:

```bash
bash download_papers.sh
```

See [`download_papers.sh`](./download_papers.sh) for the fully commented download script.
