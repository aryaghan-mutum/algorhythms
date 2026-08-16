# Algorhythms

[![CI](https://github.com/aryaghan-mutum/algorhythms/actions/workflows/ci.yml/badge.svg)](https://github.com/aryaghan-mutum/algorhythms/actions/workflows/ci.yml)
[![Release](https://github.com/aryaghan-mutum/algorhythms/actions/workflows/release.yml/badge.svg)](https://github.com/aryaghan-mutum/algorhythms/actions/workflows/release.yml)
[![codecov](https://codecov.io/gh/aryaghan-mutum/algorhythms/graph/badge.svg)](https://codecov.io/gh/aryaghan-mutum/algorhythms)
[![License: BSD-3](https://img.shields.io/badge/License-BSD--3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Racket](https://img.shields.io/badge/Racket-%3E%3D8.14-blue)](https://racket-lang.org)
[![Version](https://img.shields.io/badge/version-0.3.0-green)](https://github.com/aryaghan-mutum/algorhythms/releases)

A Racket library of algorithms and data structures.

## Documentation & Resources

| Resource | Link |
|----------|------|
| Racket Docs (Algorhythms) | [Algorhythms](https://docs.racket-lang.org/algorhythms/index.html#%28part._top%29) |
| Package Catalog | [pkgs.racket-lang.org — algorhythms](https://pkgs.racket-lang.org/package/algorhythms) |
| GitHub Source | [aryaghan-mutum/algorhythms](https://github.com/aryaghan-mutum/algorhythms) |
| CI Workflows | [GitHub Actions](https://github.com/aryaghan-mutum/algorhythms/actions) |
| Code Coverage | [Codecov](https://codecov.io/gh/aryaghan-mutum/algorhythms) |
| Releases | [GitHub Releases](https://github.com/aryaghan-mutum/algorhythms/releases) |
| Racket Language | [racket-lang.org](https://racket-lang.org) |
| Rackunit Test Framework | [Rackunit Docs](https://docs.racket-lang.org/rackunit/index.html) |
| Raco Cover (Coverage Tool) | [raco cover](https://docs.racket-lang.org/cover/index.html) |
| Scribble (Doc Format) | [Scribble Docs](https://docs.racket-lang.org/scribble/index.html) |

📦 **Package**: [Racket Package Catalog](https://pkgs.racket-lang.org/package/algorhythms)

📖 **Source**: [GitHub Repository](https://github.com/aryaghan-mutum/algorhythms)

🔧 **CI/CD**: [GitHub Actions](https://github.com/aryaghan-mutum/algorhythms/actions)

📊 **Coverage**: [Codecov Report](https://codecov.io/gh/aryaghan-mutum/algorhythms)

---

## Installation

### From Package Catalog
```bash
raco pkg install algorhythms
```

### From Source (Development)
```bash
git clone https://github.com/aryaghan-mutum/algorhythms.git
cd algorhythms
raco pkg install --link .
```

---

## Quick Start

```racket
#lang racket
(require algorhythms)

;; Use factorial
(factorial 10)  ; => 3628800

;; Morse code
(encode-to-morse "SOS")  ; => "... --- ..."
```

---

## Development Commands

### Avoid scattered compiled/ folders

By default, `raco` writes a `compiled/` bytecode cache next to every file it touches. Set `PLTCOMPILEDROOTS` once per shell session (or add it to your PowerShell profile) to redirect all of it to one external cache directory instead:

```powershell
# Windows (PowerShell)
$env:PLTCOMPILEDROOTS = "$env:LOCALAPPDATA/racket-compiled-cache/@(version)/"
```
```bash
# macOS/Linux (bash/zsh)
export PLTCOMPILEDROOTS="$HOME/.cache/racket-compiled/@(version)/"
```

`scripts/unit-test-report.ps1` already sets this automatically, so running it never leaves `compiled/` behind.

### Setup & Build
```bash
# Verify Racket installation
racket --version
raco --version

# Build/compile the package
raco setup --pkgs algorhythms

# Clean compiled files
raco setup --clean algorhythms
```

### Testing
```bash
# Run all tests (tests/ folder only — fast, no src/ files)
raco test tests/

# Run tests across the full repo (slower — also validates src/ files have no stray top-level code)
raco test .

# Run tests in a specific subdirectory
raco test tests/math/

# Run a specific test file
raco test tests/encoding/morse-code-test.rkt

# Run tests with verbose output (shows per-file pass/fail counts)
raco test tests/
```

#### HTML Test Report + Code Coverage

Racket 9.2 does not include a built-in HTML reporter. Use the included PowerShell script:

```powershell
# One-time: install the code-coverage tool
raco pkg install cover

# Generate reports/unit-test-report.html + reports/coverage/index.html and open the report
.\scripts\unit-test-report.ps1

# Custom output path
.\scripts\unit-test-report.ps1 -OutputFile reports/my-report.html

# Run against a specific subdirectory
.\scripts\unit-test-report.ps1 -TestDir tests/math/

# Skip the coverage pass (faster)
.\scripts\unit-test-report.ps1 -SkipCoverage
```

The main report is written to **`reports/unit-test-report.html`** — includes an overall
pass/fail badge, a coverage-percentage card that links to the full raco-cover HTML tree,
a doughnut chart of pass/fail/error distribution, a stacked bar chart of tests per file,
and per-test-case drill-down with inline failure detail. The `reports/` folder is
tracked in git via `.gitkeep`; generated HTML/TXT files (and the `reports/coverage/`
subdirectory) are gitignored.

The raco-cover HTML tree lives at **`reports/coverage/index.html`** — click any source
file to see line-by-line covered/uncovered highlighting.

**Plain text alternative** (no extra files):
```powershell
raco test tests/ 2>&1 | Tee-Object reports/test-results.txt
```
Each test file prints `N success(es) 0 failure(s) 0 error(s)`.
Failures are listed inline with the test-case name and the failing `check-*` call.

### Code Formatting
```bash
# Install formatter (one-time)
raco pkg install fmt

# Check formatting
raco fmt --check .

# Auto-format all files
raco fmt -i .
```

### Package Management
```bash
# Show package info
raco pkg show algorhythms

# Update package
raco pkg update algorhythms

# Remove package
raco pkg remove algorhythms

# Reinstall from local directory
raco pkg install --link .
```

### Documentation
```bash
# Build documentation
raco setup --doc-index algorhythms

# Open docs in browser
raco docs algorhythms
```

---

## License

BSD-3-Clause
