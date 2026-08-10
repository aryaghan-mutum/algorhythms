---
name: racket-test-coverage
description: >
  Use when the user asks to check, verify, or enforce unit test coverage (and
  doc comments) for this Racket (algorhythms) package, after adding a new
  .rkt function, after moving/renaming/reorganizing files under src/math/,
  src/data-structures/, or src/encoding/, or when asked to "make sure
  everything has tests", "close coverage gaps", "write test cases from
  the dev code", "remove -v1/-v2 function names", or "no tests inside src".
  Scans every provided function, ensures a real (non-mock) rackunit test
  lives in tests/ (never in src/) and a one-line contract doc comment exists
  for it, enforces a single professionally-named function per concept (no
  -v1/-v2/-vN survivors), writes whatever is missing, and rechecks
  everything already written.
---

# Racket Test Coverage

## When to Use

- After adding a new function (or a new `.rkt` file) anywhere under
  `src/math/`, `src/data-structures/`, or `src/encoding/`.
- After moving, renaming, or reorganizing folders (source or test) — files
  "sliding around" must not silently drop coverage.
- Before a release, or when asked to verify/enforce 100% function coverage.
- When wiring a previously-orphaned file into a `main.rkt` aggregator.

## Non-negotiable project conventions

These are established conventions for this repository — do not deviate:

1. **One test file per module, not per function.** Test files mirror the
   `main.rkt` aggregation boundary (e.g. all of `src/math/combinatorics/*.rkt`
   is covered by a single `tests/math/combinatorics-test.rkt`). Never create
   a `<function>-test.rkt` file for a single function.
2. **Style: `test-suite` / `test-case` + `rackunit/text-ui`.** Every test
   file defines one top-level `test-suite`, with nested `test-suite`s
   grouped by function and then by category (`- valid`, `- edge`,
   `- invalid`), and ends with `(run-tests <name>-tests)`.
3. **Every test file starts with this exact author header** (after the
   `#lang racket` line, before requires):
   ```racket
   #lang racket

   ;; Author: Anurag Muthyam
   ;; Email: anu.drumcoder@gmail.com
   ```
4. **No mocks.** Tests call the real, unmodified functions from `src/math/`,
   `src/data-structures/`, or `src/encoding/`. Use tolerance-based checks
   (`check-within`) only for floating-point/approximation functions
   (trigonometry, sqrt, pi-approximation); use exact `check-equal?`
   everywhere else.
5. **Tests never live in `src/`.** Any `check-equal?`/`check-true`/etc. call
   found at the top level of a file under `src/` is a violation — move it
   into the corresponding `tests/` file (merge into the existing suite,
   don't create a new one) and delete it from source. `src/` files may
   `(require rackunit)` only if they use contracts, never to run assertions.
6. **One canonical function per concept — no `-v1`/`-v2`/`-vN` survivors.**
   When a file has multiple implementations of the same behavior (same
   inputs → same outputs, just different style/algorithm), pick the best one
   (most idiomatic/efficient/correct), give it a clean professional name with
   no version suffix, and wrap the rest in a `#|CODE|#` block with a comment
   explaining which one is active and why. If two "versions" actually behave
   differently (different arity, different edge-case handling, different
   semantics) they are NOT duplicates — keep both under distinct descriptive
   names (e.g. `range-exclusive-end` / `range-inclusive-end`), never force
   them into one.
7. **File names must be professional too**, not exercise/scratch-style
   (e.g. prefer `find-shortest-list.rkt` over `prob3.rkt`). Rename files
   (via `git mv`) when the name doesn't describe what the module does, and
   update every `require` that points at the old path.
5. **Valid / edge / invalid categorization per function:**
   - *Valid*: at least one representative, correct-input case.
   - *Edge*: boundary values relevant to the function (0, empty list,
     single element, negative, largest/smallest meaningful input).
   - *Invalid*: only if the function actually raises/contracts on bad
     input (`check-exn`) — don't invent an invalid case for functions with
     no error path.
6. **Test file location:** `tests/<mirrored-path>-test.rkt`, e.g.
   `src/math/geometry/*` → `tests/math/geometry-test.rkt`;
   `src/data-structures/hof/*` → `tests/data-structures/hof-test.rkt`.
8. **Doc comments on the source function itself, not just the test.** Every
   provided function should have a one-line contract comment directly
   above its `define`, matching this repo's existing convention (see
   `src/math/arithmetic/square.rkt`):
   ```racket
   ;; One-line description of what it does
   ;; func-name : arg-type? ... -> return-type?
   (define (func-name ...) ...)
   ```
   If a function you're adding tests for is missing this, add it — derive
   the contract from the function's actual parameter usage and return
   value, don't guess types you haven't verified by reading the body.

## Instructions

1. **Inventory every provided function.**
   - For each `main.rkt` under `src/math/`, `src/data-structures/`,
     `src/encoding/`, read its `require`/`provide` chain to find every
     `.rkt` file it aggregates, and read each of those files' own
     `(provide ...)` clause.
   - Flag any `.rkt` file under these trees with **no `provide` clause** or
     **not required by any `main.rkt`** — it's orphaned/dead code. Report
     it; don't silently wire it in or delete it without asking (see step 5).
2. **Find the corresponding test file** for each module (per the mirroring
   rule above). If it doesn't exist, it needs to be created from scratch.
3. **Diff functions vs. test cases.** For each provided function, confirm
   there's at least one `test-case` exercising it in the corresponding
   suite, AND that it has the doc comment described in convention #7.
   List any function missing either one.
4. **Verify behavior before writing assertions — do not guess.** Read the
   actual function body (not just a name or a prior report) to derive the
   correct expected value by hand, or cross-check against Racket's
   built-in equivalent (e.g. compare a custom `sine` against `(sin x)`
   with `check-within`) for anything approximate/iterative. If a function's
   correctness can't be confidently determined by reading it, say so rather
   than writing a test with a guessed value.
5. **If gaps or bugs are found:**
   - Missing tests → add them directly (this is safe/reversible; no need
     to ask).
   - Actual bugs in source (wrong formula, crash, swapped
     names/arguments) → **flag and ask before fixing.** These are public
     API behavior changes, not test additions. List them concisely with
     the offending code and proposed fix; wait for confirmation.
   - Orphaned files with real, correct, unique functionality → propose
     wiring them into the appropriate `main.rkt` (ask if it's ambiguous
     which module they belong in).
6. **When files move (folder reorg):** update the corresponding test
   file's `require` paths in the same change. If a source file moves to a
   new module, move its test cases into that module's test file (not a
   copy) and delete them from the old one.
7. **After edits**, list the full set of files touched and a coverage
   summary: functions found, functions covered, gaps closed, bugs flagged.

## Verification

Run `raco setup --pkgs algorhythms` (expect exit code 0) and
`raco test tests/` (expect `N tests passed`, 0 failures/errors) after any
change. Don't claim tests pass without having actually run one of these.

## Example (reference shape)

```racket
#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/math/combinatorics/factorial.rkt")

(define combinatorics-tests
  (test-suite
   "combinatorics"
   (test-suite
    "factorial - valid"
    (test-case "5! is 120" (check-equal? (factorial 5) 120)))
   (test-suite
    "factorial - invalid"
    (test-case "negative input violates the natural-number contract"
      (check-exn exn:fail:contract? (lambda () (factorial -1)))))))

(run-tests combinatorics-tests)
```
