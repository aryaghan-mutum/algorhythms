# Algorhythms

[![CI](https://github.com/aryaghan-mutum/algorhythms/actions/workflows/ci.yml/badge.svg)](https://github.com/aryaghan-mutum/algorhythms/actions/workflows/ci.yml)
[![Release](https://github.com/aryaghan-mutum/algorhythms/actions/workflows/release.yml/badge.svg)](https://github.com/aryaghan-mutum/algorhythms/actions/workflows/release.yml)
[![codecov](https://codecov.io/gh/aryaghan-mutum/algorhythms/graph/badge.svg)](https://codecov.io/gh/aryaghan-mutum/algorhythms)
[![License: BSD-3](https://img.shields.io/badge/License-BSD--3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Racket](https://img.shields.io/badge/Racket-%3E%3D8.14-blue)](https://racket-lang.org)
[![Version](https://img.shields.io/badge/version-0.3.0-green)](https://github.com/aryaghan-mutum/algorhythms/releases)

A Racket library of algorithms and data structures.

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
# Run all tests
raco test .

# Run tests in specific directory
raco test tests/

# Run a specific test file
raco test tests/encoding/morse-code-test.rkt

# Run tests with verbose output
raco test -v .
```

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
