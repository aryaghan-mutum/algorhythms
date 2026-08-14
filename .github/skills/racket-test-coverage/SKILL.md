---
name: racket-test-coverage
description: >
  Use when the user asks to check, verify, or enforce unit test coverage (and
  doc comments) for this Racket (algorhythms) package, after adding a new
  .rkt function, after moving/renaming/reorganizing files under src/math/,
  src/data-structures/, or src/encoding/, or when asked to "make sure
  everything has tests", "close coverage gaps", "write test cases from
  the dev code", "remove -v1/-v2 function names", "no tests inside src",
  "merge these files into one", "arrange/reorganize methods by single
  responsibility principle", "put commented-out code at the bottom of the
  file", or "add extreme/edge assertions (negative, decimal, etc.) to tests".
  Scans every provided function, ensures a real (non-mock) rackunit test
  lives in tests/ (never in src/) and a one-line contract doc comment exists
  for it, enforces a single professionally-named function per concept (no
  -v1/-v2/-vN survivors), keeps live code before retired/commented code in
  every file, writes whatever is missing (including extreme-input test
  cases), and rechecks everything already written.
---

# Racket Test Coverage

## When to Use

- After adding a new function (or a new `.rkt` file) anywhere under
  `src/math/`, `src/data-structures/`, or `src/encoding/`.
- After moving, renaming, or reorganizing folders (source or test) — files
  "sliding around" must not silently drop coverage.
- Before a release, or when asked to verify/enforce 100% function coverage.
- When wiring a previously-orphaned file into a `main.rkt` aggregator.
- When asked to merge/split files for Single Responsibility Principle, or
  to rename files/functions professionally within a topic tree.
- When asked to add extreme/edge-case assertions (negative, zero, decimal)
  to existing tests.

## Non-negotiable project conventions

These are established conventions for this repository — do not deviate:

1. **One subfolder per topic, one small file per function/concept, never
   one flat file per topic.** `src/math/<topic>/` (e.g. `arithmetic/`,
   `algebra/`, `matrix/`, `financial/`) holds many small `.rkt` files (a
   handful of closely related functions each), aggregated by that folder's
   `main.rkt`. Do NOT create a single `src/math/<topic>.rkt` dumping every
   function for a topic — that pattern was tried and reverted because it
   doesn't scale and creates a second, parallel structure to the existing
   subfolders. When a brand-new topic needs adding (no existing subfolder),
   create a new subfolder following this same pattern, not a flat file.
2. **One test file per module, not per function.** Test files mirror the
   `main.rkt` aggregation boundary (e.g. all of `src/math/combinatorics/*.rkt`
   is covered by a single `tests/math/combinatorics-test.rkt`). Never create
   a `<function>-test.rkt` file for a single function.
3. **Style: `test-suite` / `test-case` + `rackunit/text-ui`.** Every test
   file defines one top-level `test-suite`, with nested `test-suite`s
   grouped by function and then by category (`- valid`, `- edge`,
   `- invalid`), and ends with `(run-tests <name>-tests)`.
4. **Every test file starts with this exact author header** (after the
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
6. **Tests never live in `src/`.** Any `check-equal?`/`check-true`/etc. call
   found at the top level of a file under `src/` is a violation — move it
   into the corresponding `tests/` file (merge into the existing suite,
   don't create a new one) and delete it from source. `src/` files may
   `(require rackunit)` only if they use contracts, never to run assertions.
7. **One canonical function per concept — no `-v1`/`-v2`/`-vN` survivors.**
   When a file has multiple implementations of the same behavior (same
   inputs → same outputs, just different style/algorithm), pick the best one
   (most idiomatic/efficient/correct), give it a clean professional name with
   no version suffix, and wrap the rest in a `#|CODE|#` block with a comment
   explaining which one is active and why. If two "versions" actually behave
   differently (different arity, different edge-case handling, different
   semantics) they are NOT duplicates — keep both under distinct descriptive
   names (e.g. `range-exclusive-end` / `range-inclusive-end`), never force
   them into one.
8. **File names must be professional too**, not exercise/scratch-style
   (e.g. prefer `find-shortest-list.rkt` over `prob3.rkt`). Rename files
   (via `git mv`) when the name doesn't describe what the module does, and
   update every `require` that points at the old path.
9. **Live code first, retired code last, in every file.** Every active
   (non-commented) `define` must appear before any `#|...|#` block in that
   file — never interleave a comment block between live definitions. If a
   file has scattered `#|...|#` blocks (a common leftover pattern in this
   codebase), consolidate them into one block at the very bottom the next
   time you touch that file.
10. **Collapse a lone-file "subfolder" back to a top-level file.** Subfolders
    (`primes/`, `divisibility/`, etc.) exist only while a topic has *multiple*
    small files. If merging or retiring functions leaves a subfolder holding
    exactly one file, promote that file to a plain top-level file in the
    parent topic directory and delete the now-empty subfolder — don't keep a
    directory around for a single file (this is what "make these into one
    file if possible" should resolve to when three small files collapse
    into one).
11. **Duplicate concepts across files/folders count too.** Rule 7 isn't
    limited to one file: if two functions in *different* files/folders
    produce the same output for the same input (e.g. a "divisors" helper
    duplicating a "prime factors" helper, or a trial-division `primes-up-to`
    duplicating a sieve-based one), that's the same violation. Pick one
    canonical home, retire or clearly cross-reference the other, and name
    both distinctly and professionally if you keep both for a legitimate
    reason (e.g. one is asymptotically better for bulk generation).
12. **Extreme/edge test inputs are mandatory.** Every test suite you write
    or touch must include, per function where meaningful: a negative-number
    case, a zero/boundary case, and a non-integer/decimal case — categorized
    under `- edge` or `- invalid` per the rule below. The expected outcome
    (a specific value, or `check-exn`) must come from actually running the
    function (see Instructions #4), never guessed. If a negative or decimal
    input hangs forever (infinite loop) or silently gives a wrong answer,
    that's a bug in the source, not an acceptable test outcome — add a
    guard/contract to the function so it fails fast and clearly instead
    (flag the fix in your summary; see Instructions #5).
13. **Never shadow a built-in with a reduced-capability version.** If a
    custom function reimplements something Racket already provides (e.g.
    `min`/`max`, `sqrt`, `gcd`), give the custom version its own name
    (`min-custom`, `sqrt-root`, `gcd-euclidean`) and separately re-`provide`
    the built-in — don't `(define min ...)` a fixed-2-argument version that
    replaces the built-in's real (often variadic) contract for anyone who
    `(require)`s the module. This is a silent, easy-to-miss regression:
    check for it specifically whenever a function's name matches a Racket
    built-in.
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
   than writing a test with a guessed value. This applies doubly to
   extreme/edge inputs (convention #12): run the function yourself (a
   throwaway `racket -e`/scratch script, deleted afterward) with negative,
   zero, and decimal inputs before asserting what it does — a stale code
   comment claiming a specific behavior (e.g. "n=40 is not prime") can
   itself be wrong; verify, don't trust prose. Guard any exploratory call
   that might not terminate (e.g. with a `thread`/`sync/timeout`) so a
   genuine infinite loop doesn't hang your session — a case that never
   returns is itself the bug to report/fix (see convention #12).
5. **If gaps or bugs are found:**
   - Missing tests → add them directly (this is safe/reversible; no need
     to ask).
   - Actual bugs in source (wrong formula, crash, swapped
     names/arguments, or an extreme input that hangs forever) → for a
     narrowly-scoped reorg/coverage pass, flag and ask before fixing since
     these are public API behavior changes. If the user has already granted
     broad authority to rename/restructure/delete in the same request
     (e.g. "you may delete existing files, up to you"), fixing the bug
     (typically: add a guard/contract for the invalid domain) is in scope —
     still call it out explicitly in your final summary so it's never a
     silent behavior change.
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
    "factorial - edge"
    (test-case "0! is 1 (base case)" (check-equal? (factorial 0) 1)))
   (test-suite
    "factorial - invalid"
    (test-case "negative input violates the natural-number contract"
      (check-exn exn:fail:contract? (lambda () (factorial -1))))
    (test-case "decimal input violates the natural-number contract"
      (check-exn exn:fail:contract? (lambda () (factorial 4.5)))))))

(run-tests combinatorics-tests)
```
