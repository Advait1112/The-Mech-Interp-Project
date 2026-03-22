#!/usr/bin/env bash
# =============================================================================
# download_papers.sh
#
# Downloads all open-access arXiv PDFs identified in the LLM Mechanistic
# Interpretability literature survey (README.md in this directory).
#
# Five papers in the survey are published exclusively as interactive HTML on
# the Anthropic Transformer Circuits Thread (transformer-circuits.pub) and do
# NOT have standalone PDF versions; they are therefore omitted here. The
# remaining 15 papers have direct arXiv PDF URLs and are downloaded below.
#
# Usage:
#   bash download_papers.sh
#
# Requirements:
#   curl (standard on macOS and most Linux distributions)
#
# The script will:
#   1. Create the output directory if it does not already exist.
#   2. Download each PDF with a descriptive filename.
#   3. Skip files that were already downloaded (idempotent).
#   4. Print a summary of successes and failures.
# =============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------

# Directory (relative to CWD, or change to an absolute path) where PDFs are
# saved. The script will create it if it does not exist.
OUTPUT_DIR="$(dirname "$0")/pdfs"

# curl flags (stored as an array to avoid word-splitting issues):
#   -L  follow HTTP redirects (arXiv redirects /pdf/<id> → /pdf/<id>.pdf)
#   -f  fail silently on HTTP errors (return exit code 22 instead of saving
#       an HTML error page as the output file)
#   -s  suppress the progress meter
#   -S  still show errors even with -s
CURL_FLAGS=(-L -f -s -S)

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No color

ok=0
skip=0
fail=0

# download <url> <filename>
#   Downloads <url> into ${OUTPUT_DIR}/<filename> unless the file already
#   exists, in which case it prints a skip notice.
download() {
    local url="$1"
    local filename="$2"
    local dest="${OUTPUT_DIR}/${filename}"

    if [[ -f "$dest" ]]; then
        echo -e "${YELLOW}[SKIP]${NC}  $filename (already exists)"
        (( skip++ )) || true
        return
    fi

    echo -e "       Downloading: $filename"
    if curl "${CURL_FLAGS[@]}" -o "$dest" "$url"; then
        echo -e "${GREEN}[ OK ]${NC}  $filename"
        (( ok++ )) || true
    else
        echo -e "${RED}[FAIL]${NC}  $filename  (URL: $url)"
        # Remove any partial / empty file left behind by curl
        rm -f "$dest"
        (( fail++ )) || true
    fi
}

# ---------------------------------------------------------------------------
# Setup
# ---------------------------------------------------------------------------

echo "============================================================"
echo "  LLM Mechanistic Interpretability — PDF Downloader"
echo "  Output directory: ${OUTPUT_DIR}"
echo "============================================================"

mkdir -p "${OUTPUT_DIR}"

# ---------------------------------------------------------------------------
# Category 1 — Sparse Autoencoders (SAEs) & Dictionary Learning
# ---------------------------------------------------------------------------
# Papers 1 & 2 (Bricken 2023, Templeton 2024) are HTML-only on
# transformer-circuits.pub and are omitted.

echo ""
echo "--- SAEs & Dictionary Learning ---"

# Paper 3 — Scaling and Evaluating Sparse Autoencoders
# Gao et al., 2024 (OpenAI)
download \
    "https://arxiv.org/pdf/2406.04093" \
    "gao2024_scaling_evaluating_sparse_autoencoders.pdf"

# Paper 4 — Gemma Scope: Open Sparse Autoencoders Everywhere All At Once on Gemma 2
# Lieberum et al., 2024 (Google DeepMind)
download \
    "https://arxiv.org/pdf/2408.05147" \
    "lieberum2024_gemma_scope.pdf"

# Paper 5 — Sparse Autoencoders Find Highly Interpretable Features in Language Models
# Cunningham et al., 2023
download \
    "https://arxiv.org/pdf/2309.08600" \
    "cunningham2023_sparse_autoencoders_interpretable_features.pdf"

# Paper 6 — Codebook Features: Sparse and Discrete Interpretability for Neural Networks
# Tamkin et al., 2023 (Anthropic / Stanford)
download \
    "https://arxiv.org/pdf/2310.17230" \
    "tamkin2023_codebook_features.pdf"

# ---------------------------------------------------------------------------
# Category 2 — Feature Superposition & Monosemanticity
# ---------------------------------------------------------------------------
# Papers 9 & 10 (Privileged Bases, Superposition+Double Descent) are HTML-only
# on transformer-circuits.pub and are omitted.

echo ""
echo "--- Feature Superposition & Monosemanticity ---"

# Paper 7 — Toy Models of Superposition
# Elhage et al., 2022 (Anthropic)
download \
    "https://arxiv.org/pdf/2209.11169" \
    "elhage2022_toy_models_of_superposition.pdf"

# Paper 8 — Polysemanticity and Capacity in Neural Networks
# Scherlis et al., 2022 (Anthropic / Cornell)
download \
    "https://arxiv.org/pdf/2210.01892" \
    "scherlis2022_polysemanticity_and_capacity.pdf"

# ---------------------------------------------------------------------------
# Category 3 — Feature Geometry, Compositional Arithmetic & Latent Space
# ---------------------------------------------------------------------------

echo ""
echo "--- Feature Geometry, Compositional Arithmetic & Latent Space Dynamics ---"

# Paper 11 — Not All Language Model Features Are Linear
# Engels et al., 2024 (MIT)
download \
    "https://arxiv.org/pdf/2405.14860" \
    "engels2024_not_all_features_are_linear.pdf"

# Paper 12 — The Linear Representation Hypothesis and the Geometry of LLMs
# Park et al., 2023 (Google / UChicago)
download \
    "https://arxiv.org/pdf/2311.03658" \
    "park2023_linear_representation_hypothesis.pdf"

# Paper 13 — The Geometry of Truth: Emergent Linear Structure in LLM Representations
# Marks & Tegmark, 2023 (MIT)
download \
    "https://arxiv.org/pdf/2310.06824" \
    "marks2023_geometry_of_truth.pdf"

# Paper 14 — Linear Representations of Sentiment in Large Language Models
# Tigges et al., 2023 (EleutherAI / Anthropic)
download \
    "https://arxiv.org/pdf/2310.15154" \
    "tigges2023_linear_representations_sentiment.pdf"

# Paper 15 — Representation Engineering: A Top-Down Approach to AI Transparency
# Zou et al., 2023 (UIUC / CMU / Berkeley)
download \
    "https://arxiv.org/pdf/2310.01405" \
    "zou2023_representation_engineering.pdf"

# ---------------------------------------------------------------------------
# Category 4 — Circuits, Automated Discovery & Foundational Frameworks
# ---------------------------------------------------------------------------
# Paper 16 (A Mathematical Framework for Transformer Circuits, Elhage 2021) is
# HTML-only on transformer-circuits.pub and is omitted.

echo ""
echo "--- Circuits, Automated Discovery & Foundational Frameworks ---"

# Paper 17 — Interpretability in the Wild: A Circuit for Indirect Object
#             Identification in GPT-2 Small
# Wang et al., 2022
download \
    "https://arxiv.org/pdf/2211.00593" \
    "wang2022_interpretability_in_the_wild_ioi.pdf"

# Paper 18 — Towards Automated Circuit Discovery for Mechanistic Interpretability
# Conmy et al., 2023
download \
    "https://arxiv.org/pdf/2304.14997" \
    "conmy2023_automated_circuit_discovery_acdc.pdf"

# Paper 19 — Sparse Feature Circuits: Discovering and Editing Interpretable
#             Causal Graphs in Language Models
# Samuel et al., 2024
download \
    "https://arxiv.org/pdf/2403.19647" \
    "samuel2024_sparse_feature_circuits.pdf"

# Paper 20 — Progress Measures for Grokking via Mechanistic Interpretability
# Nanda et al., 2023
download \
    "https://arxiv.org/pdf/2301.05217" \
    "nanda2023_progress_measures_grokking.pdf"

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------

echo ""
echo "============================================================"
echo -e "  ${GREEN}Downloaded: ${ok}${NC}   ${YELLOW}Skipped: ${skip}${NC}   ${RED}Failed: ${fail}${NC}"
echo "============================================================"
echo ""

if [[ "$fail" -gt 0 ]]; then
    echo "Some downloads failed. This can happen if:"
    echo "  • arXiv is rate-limiting requests (try again in a few minutes)"
    echo "  • The PDF URL has changed (check the README for the current URL)"
    echo "  • You do not have internet access in this environment"
    exit 1
fi

echo "All PDFs are in: ${OUTPUT_DIR}"
echo ""
echo "HTML-only papers (no PDF available — see README for links):"
echo "  1. Toward Monosemanticity (Bricken 2023)       — transformer-circuits.pub"
echo "  2. Scaling Monosemanticity (Templeton 2024)    — transformer-circuits.pub"
echo "  9. Privileged Bases (Elhage 2023)              — transformer-circuits.pub"
echo " 10. Superposition & Double Descent (Henighan 2023) — transformer-circuits.pub"
echo " 16. A Mathematical Framework (Elhage 2021)      — transformer-circuits.pub"
