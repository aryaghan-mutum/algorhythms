# Contributing to Algorhythms

Thank you for considering contributing to Algorhythms! This document provides guidelines and instructions for contributing.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Code Style Guide](#code-style-guide)
- [Adding New Algorithms](#adding-new-algorithms)
- [Testing](#testing)
- [Pull Request Process](#pull-request-process)
- [Commit Message Convention](#commit-message-convention)

---

## Code of Conduct

Be respectful and inclusive. We welcome contributions from everyone.

---

## Getting Started

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/algorhythms.git
   cd algorhythms
   ```
3. Add upstream remote:
   ```bash
   git remote add upstream https://github.com/aryaghan-mutum/algorhythms.git
   ```

---

## Development Setup

### Prerequisites

- [Racket](https://racket-lang.org/) 8.14 or later

### Installation

```bash
# Install package in development mode
raco pkg install --link .

# Build/compile the package
raco setup algorhythms

# Verify installation
raco pkg show algorhythms
```

---

## Code Style Guide

### Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Functions | `kebab-case` | `prime-factorization`, `sum-of-squares` |
| Predicates | End with `?` | `prime?`, `even?`, `empty-list?` |
| Mutating functions | End with `!` | `set!`, `push!` |
| Conversion functions | Use `->` | `list->string`, `degrees->radians` |
| List operations | Suffix with `-list` | `square-list`, `double-list` |

### Function Definition Style

**Preferred:** Use the short `define` syntax for simple functions:

```racket
;; ✅ Good
(define (square n)
  (* n n))

;; ❌ Avoid
(define square
  (lambda (n)
    (* n n)))
```

### Documentation Comments

Every exported function should have:

1. A brief description
2. Type signature comment
3. Optional examples

```racket
;; Returns the factorial of n
;; factorial : natural? -> natural?
;; Example: (factorial 5) => 120
(define (factorial n)
  (if (<= n 1) 1 (* n (factorial (- n 1)))))
```

### File Structure

```racket
#lang racket

;; Author: Your Name
;; Module Description: Brief description of what this module contains

(require ...)  ; Required modules

(provide ...)  ; Exported functions

;; Function implementations...
```

### Avoid

- ❌ Redundant implementations (multiple versions of the same algorithm)
- ❌ Unused `require` statements
- ❌ Lambda syntax for simple functions
- ❌ Personal names in identifiers (use descriptive names instead)
- ❌ Abbreviations that reduce clarity

---

## Adding New Algorithms

### File Placement

| Category | Location |
|----------|----------|
| Sorting algorithms | `data-structures/sort/` |
| Data structures | `data-structures/` |
| Number theory | `math/number-theory/` |
| Arithmetic operations | `math/arithmetic/` |
| Combinatorics | `math/combinatorics/` |
| Geometry | `math/geometry/` |
| String operations | `data-structures/string/` |

### Checklist for New Algorithms

- [ ] Place file in appropriate directory
- [ ] Follow naming conventions
- [ ] Add documentation comments
- [ ] Export public functions via `provide`
- [ ] Add tests in `tests/` directory
- [ ] Update module aggregator if applicable

### Example: Adding a New Algorithm

1. Create the implementation file:

```racket
;; File: math/number-theory/euclidean-algorithm.rkt
#lang racket

;; Author: Your Name
;; Euclidean Algorithm: Efficient GCD computation

(provide euclidean-gcd)

;; Computes GCD using the Euclidean algorithm
;; euclidean-gcd : natural? natural? -> natural?
(define (euclidean-gcd a b)
  (if (zero? b)
      a
      (euclidean-gcd b (remainder a b))))
```

2. Add tests:

```racket
;; File: tests/math/number-theory/euclidean-algorithm-test.rkt
#lang racket

(require rackunit
         "../../../math/number-theory/euclidean-algorithm.rkt")

(test-case "euclidean-gcd"
  (check-equal? (euclidean-gcd 48 18) 6)
  (check-equal? (euclidean-gcd 17 5) 1)
  (check-equal? (euclidean-gcd 100 25) 25))
```

---

## Testing

### Running Tests

```bash
# Run all tests
raco test .

# Run tests in specific directory
raco test tests/

# Run a specific test file
raco test tests/math/number-theory-test.rkt

# Run with verbose output
raco test -v .
```

### Writing Tests

Use `rackunit` for testing:

```racket
#lang racket

(require rackunit
         "../path/to/module.rkt")

(test-case "descriptive test name"
  (check-equal? (function arg1 arg2) expected-result)
  (check-true (predicate? value))
  (check-false (predicate? other-value)))
```

---

## Pull Request Process

1. **Create a feature branch:**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** following the code style guide

3. **Run tests:**
   ```bash
   raco test .
   ```

4. **Build and verify:**
   ```bash
   raco setup algorhythms
   ```

5. **Commit your changes** using conventional commits

6. **Push and create PR:**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Fill out PR template** with description of changes

---

## Commit Message Convention

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Types

| Type | Description |
|------|-------------|
| `feat` | New feature or algorithm |
| `fix` | Bug fix |
| `docs` | Documentation changes |
| `style` | Code style changes (formatting, naming) |
| `refactor` | Code refactoring |
| `test` | Adding or updating tests |
| `chore` | Maintenance tasks |
| `ci` | CI/CD changes |

### Examples

```
feat(math): add euclidean algorithm for GCD computation

fix(sort): correct off-by-one error in quick-sort partition

refactor(arithmetic): consolidate redundant square implementations

docs: update README with installation instructions

test(number-theory): add tests for prime factorization
```

---

## Questions?

If you have questions, please [open an issue](https://github.com/aryaghan-mutum/algorhythms/issues/new).

Thank you for contributing! 🎉
