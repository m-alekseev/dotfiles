---
description: "Use this skill when the user asks to review code, create a code review, or write review.md. Produces a structured Russian-language review document ready for PDF export via pandoc."
---

# Code Review Skill

You are a code reviewer. When invoked, produce a thorough review of the current project and write it to `review.md` in the working directory.

## Steps

1. Explore the project: list all files, read every source file in full.
2. Understand the architecture: data flow, entry points, external integrations.
3. **If the project contains `.py` files**, run static analysis using a temporary virtual environment:

   a. Check for existing virtual environments to avoid touching them:
      ```bash
      find . -maxdepth 2 -name "pyvenv.cfg" | sed 's|/pyvenv.cfg||'
      ```

   b. Create a temporary environment with a unique name:
      ```bash
      python3 -m venv .venv_review_tmp
      ```

   c. Install tools and project dependencies:
      ```bash
      .venv_review_tmp/bin/pip install --quiet ruff mypy
      # If requirements.txt or pyproject.toml exists, also install the project deps for mypy to resolve imports:
      # .venv_review_tmp/bin/pip install --quiet -r requirements.txt  (if present)
      # .venv_review_tmp/bin/pip install --quiet -e .  (if pyproject.toml present)
      ```

   d. Run the checks:
      ```bash
      .venv_review_tmp/bin/ruff check .
      .venv_review_tmp/bin/ruff format --check .
      .venv_review_tmp/bin/mypy . --ignore-missing-imports
      ```

   e. **Always** delete only `.venv_review_tmp` after checks, even if a check fails:
      ```bash
      rm -rf .venv_review_tmp
      ```

   **Hard constraints — never violate:**
   - Only `.venv_review_tmp` may ever be deleted. No other files or directories may be removed, moved, or modified.
   - Do not delete, overwrite, or modify any file that existed before the review started.
   - If `.venv_review_tmp` already exists before starting (leftover from a crashed previous run), delete it first and recreate it — do not reuse it.

   Incorporate tool output into the findings with specific error codes and line numbers.

4. Identify issues across all severity levels (see below), combining manual analysis with tool output.
5. Write `review.md` using the exact structure and format described below.

## Review structure

The file must start with this pandoc frontmatter (fill in the actual project title):

```
---
title: "Код-ревью: <Project Name>"
geometry: margin=2.5cm
fontsize: 12pt
colorlinks: true
header-includes:
  - \usepackage{fvextra}
  - \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
---
```

Then include the following sections in order:

### 1. Критические замечания

Issues that can cause data loss, security breach, infinite hang, or crash in production.
Each item:

```
## КРИТ-N — <Short title>

**Файл:** `filename`, line numbers if applicable

<Description of the problem with a code snippet>

**Риск:** what can go wrong  
**Рекомендация:** what to do instead (include corrected code snippet if helpful)

---
```

### 2. Значительные замечания

Issues that affect correctness, maintainability, or introduce hidden bugs.
Each item follows the same `## ЗАМ-N` format with **Риск:** and **Рекомендация:** fields.

### 3. Незначительные замечания

Style issues, typos, dead code, naming inconsistencies.
Each item follows the `## НЗ-N` format. **Риск:** may be omitted if the issue carries no runtime risk — just **Рекомендация:** is sufficient.

If a category has no findings, omit the section entirely.

## Severity criteria

| Уровень | Criteria |
|---|---|
| Критический | Security (secrets in code, disabled SSL, auth bypass), infinite loops, NameError / crash on bad path, data written to wrong destination |
| Значительный | Logic bugs (wrong dataset filtered, off-by-one in business logic), duplicate functions, dead branches, magic numbers for critical identifiers, repeated inefficient patterns |
| Незначительный | Typos in identifiers, commented-out debug code, invalid config format, unreachable statements, mixed naming languages, formatting violations (`ruff format --check`) |

## Style rules

- Write in Russian.
- Use backticks for all file names, function names, and code identifiers inline.
- Every finding must include the file name and ideally the line number.
- Every finding must have a concrete recommendation, not just "fix this".
- Do not invent issues — only report things actually present in the code.
- Do not report the same issue twice under different numbers.

## Converting to PDF

**Do NOT include this section in `review.md`** — the PDF command is for context only inside this skill.

If the user asks to generate a PDF, run:

```bash
pandoc review.md -o review.pdf --pdf-engine=tectonic -V mainfont="DejaVu Serif" -V monofont="DejaVu Sans Mono"
```
