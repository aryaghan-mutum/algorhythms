---
name: racket-test-coverage
description: >
  Use when the user asks to check, verify, or enforce unit-test coverage,
  documentation coverage (scribble .scrbl entries), or clean-code discipline
  for this Racket (algorhythms) package. Trigger phrases include: "make sure
  everything has tests", "close coverage gaps", "write test cases from the
  dev code", "remove -v1/-v2 function names", "no tests inside src", "merge
  these files into one", "arrange/reorganize methods by single responsibility
  principle", "put commented-out code at the bottom of the file", "add
  extreme/edge assertions (negative, decimal, etc.) to tests", "update the
  scribble docs for each function", "run the test report / coverage report",
  or after adding, moving, renaming, or reorganizing anything under src/math/,
  src/data-structures/, or src/encoding/. Enforces: every provided function
  has (1) a rackunit test in tests/, (2) a two-line contract doc comment
  above its define, (3) a @defproc entry in scribblings/algorhythms.scrbl,
  and (4) a professional single-word-per-concept name; and that no file
  keeps -vN survivors, dead code before live code, or embedded assertions
  inside src/.
---

# Racket Test Coverage

## 1. Summary — What this skill does

When invoked, this skill performs the following, in order:

1. **Inventory every provided function** across `src/math/`, `src/data-structures/`, `src/encoding/` — walk each `main.rkt` and the files it `require`s, and read each file's `(provide ...)` clause.
2. **Diff each provided function against 3 required artifacts**:
   - a rackunit test case in `tests/<mirrored-path>-test.rkt` (never in `src/`),
   - a two-line doc comment (`;; description` + `;; name : type -> type`) directly above its `define`,
   - a `@defproc` entry in `scribblings/algorhythms.scrbl`.
3. **Flag naming violations**: `-v1`/`-v2`/`-vN` survivors, misspellings, unprofessional/scratch-style file names, and Racket-built-in shadowing.
4. **Flag structural violations**: test assertions inside `src/`, commented code interleaved with (or placed before) live code, nested topic subfolders (e.g. `list/list/`), lone-file subfolders that should be collapsed, and orphaned files not required by any `main.rkt`.
5. **Verify behaviour before writing assertions** (never guess) — run the function or cross-check against Racket built-ins for approximations; guard exploratory calls that might not terminate.
6. **Write what's missing** (tests, doc comments, scribble entries, edge cases) — this is safe/reversible.
7. **Flag actual bugs** in source separately (wrong formula, crash, hang, misleading API name) — these are behaviour changes and need explicit callouts in the summary. Fix them if the user has already granted broad restructuring authority; otherwise ask first.
8. **Run `raco setup --pkgs algorhythms` (exit 0) and `raco test tests/` (0 failures/errors)** after any change, and report the coverage delta.
9. **(Optional) Regenerate the HTML test + coverage report** via `.\scripts\unit-test-report.ps1` if the user asks for a visual summary.

## 2. When to use

- After adding a new function or a new `.rkt` file anywhere under `src/math/`, `src/data-structures/`, `src/encoding/`.
- After moving/renaming/reorganising folders (source or tests) — files "sliding around" must not silently drop coverage.
- Before a release, or when asked to verify/enforce 100% function coverage.
- When wiring a previously-orphaned file into a `main.rkt` aggregator.
- When asked to merge/split files for Single Responsibility Principle, or to rename files/functions professionally within a topic tree.
- When asked to add extreme/edge-case assertions (negative, zero, decimal) to existing tests.
- When asked to update `scribblings/algorhythms.scrbl` for each method professionally.

## 3. Non-negotiable project conventions

These are established conventions for this repository — do not deviate.

### 3.1 Structure

1. **One subfolder per topic; one small file per function/concept.** `src/math/<topic>/` (e.g. `arithmetic/`, `combinatorics/`, `matrix/`) holds many small `.rkt` files aggregated by that folder's `main.rkt`. Do NOT create a single flat `src/math/<topic>.rkt` dumping every function for a topic — that scales poorly and creates a parallel structure. When a brand-new topic needs adding (no existing subfolder), create a new subfolder following this same pattern, not a flat file. **Corollary: never nest one topic subfolder inside another** (e.g. a `list/list/` directory holding exercise variants of the parent `list/` files). Treat any such nested subfolder as either a duplicate (delete) or a genuinely different implementation that belongs in the parent folder under a distinct professional name (move up, then delete the nested directory).
2. **Collapse a lone-file "subfolder" back to a top-level file.** Subfolders (`primes/`, `divisibility/`, etc.) exist only while a topic has *multiple* small files. If merging or retiring functions leaves a subfolder holding exactly one file, promote that file to a plain top-level file in the parent topic directory and delete the now-empty subfolder.
3. **Test file location mirrors source aggregation.** `src/math/geometry/*` → `tests/math/geometry-test.rkt`; `src/data-structures/hof/*` → `tests/data-structures/hof-test.rkt`. **One test file per module, not per function.** Never create a `<function>-test.rkt` file for a single function.
4. **Live code first, retired code last, in every file.** Every active (non-commented) `define` must appear before any `#|...|#` block — never interleave a comment block between live definitions. If a file has scattered `#|...|#` blocks, consolidate them into one block at the very bottom the next time you touch that file.

### 3.2 Naming

5. **One canonical function per concept — no `-v1`/`-v2`/`-vN` survivors.** When a file has multiple implementations of the same behaviour (same inputs → same outputs, just different style/algorithm), pick the best one (most idiomatic/efficient/correct), give it a clean professional name, and wrap the rest in a `#|CODE|#` block with a one-line rationale for why the active one is active. If two "versions" actually behave differently (different arity, different edge-case handling, different semantics) they are NOT duplicates — keep both under distinct descriptive names (e.g. `range-exclusive-end` / `range-inclusive-end`).
6. **Duplicate concepts across files/folders count too.** Rule 5 isn't limited to one file: if two functions in *different* files/folders produce the same output for the same input (e.g. a "divisors" helper duplicating a "prime factors" helper, or a trial-division `primes-up-to` duplicating a sieve-based one), that's the same violation. Pick one canonical home, retire or clearly cross-reference the other, and name both distinctly if you keep both for a legitimate reason (e.g. one is asymptotically better for bulk generation).
7. **File names must be professional too**, not exercise/scratch-style (e.g. prefer `find-shortest-list.rkt` over `prob3.rkt`). Rename files (via `git mv`) when the name doesn't describe what the module does, and update every `require` that points at the old path.
8. **Never shadow a built-in with a reduced-capability version.** If a custom function reimplements something Racket already provides (e.g. `min`/`max`/`sqrt`/`gcd`/`flatten`/`range`/`string-downcase`), give the custom version its own name (`min-custom`, `sqrt-root`, `gcd-euclidean`, `flatten-list`, `range-1-to-n`, `string-downcase-custom`). Silent regressions here are hard to detect once code is published — check for it whenever a function's name matches a Racket built-in.

### 3.3 Testing

9. **Tests never live in `src/`.** Any `check-equal?`/`check-true`/`check-within`/`check-=` call found at the top level of a file under `src/` is a violation — move it into the corresponding `tests/` file (merge into the existing suite, don't create a new one) and delete it from source. `src/` files may `(require rackunit)` only if they use contracts, never to run assertions.
10. **No mocks.** Tests call the real, unmodified functions from `src/math/`, `src/data-structures/`, or `src/encoding/`. Use tolerance-based checks (`check-within`) only for floating-point/approximation functions (trigonometry, sqrt, pi-approximation); use exact `check-equal?` everywhere else.
11. **Style: `test-suite` / `test-case` + `rackunit/text-ui`.** Every test file defines one top-level `test-suite`, with nested `test-suite`s grouped by function and then by category (`- valid`, `- edge`, `- invalid`), and ends with `(run-tests <name>-tests)`.
12. **Every test file starts with this exact author header** (after the `#lang racket` line, before requires):
    ```racket
    #lang racket

    ;; Author: Anurag Muthyam
    ;; Email: anu.drumcoder@gmail.com
    ```
13. **Valid / edge / invalid categorisation per function:**
    - *Valid*: at least one representative, correct-input case.
    - *Edge*: boundary values relevant to the function (0, empty list, single element, negative, largest/smallest meaningful input).
    - *Invalid*: only if the function actually raises/contracts on bad input (`check-exn`) — don't invent an invalid case for functions with no error path.
14. **Extreme/edge test inputs are mandatory.** Every test suite you write or touch must include, per function where meaningful: a negative-number case, a zero/boundary case, and a non-integer/decimal case — categorised under `- edge` or `- invalid` per rule 13. The expected outcome (a specific value, or `check-exn`) must come from actually running the function (see §5 below), never guessed. If a negative or decimal input hangs forever (infinite loop) or silently gives a wrong answer, that's a bug in the source, not an acceptable test outcome — add a guard/contract to the function so it fails fast and clearly instead (flag the fix in your summary; see §5).

### 3.4 Documentation (source + scribble)

15. **Two-line doc comment on the source function itself.** Every provided function must have a description line and a contract line directly above its `define`:
    ```racket
    ;; One-line description of what it does
    ;; func-name : arg-type? ... -> return-type?
    (define (func-name ...) ...)
    ```
    Derive the contract from the function's actual parameter usage and return value; don't guess types you haven't verified by reading the body.
16. **Scribble `@defproc` entry in `scribblings/algorhythms.scrbl` for every publicly-provided function.** The scribble file is the user-facing API reference (renders at <https://docs.racket-lang.org/algorhythms/index.html>). Each `@defproc` should mirror the two-line source doc: contract signature identical to the source comment, and a one-line description. Add a short `@racketblock[...]` example for anything non-obvious (calculator ops, encoding, sorting, memoize/lazy). When you rename a source export, rename its `@defproc` in the same commit; when you add a new provided function, add its `@defproc` in the same commit. **After editing, run `raco setup --pkgs algorhythms` and verify the "building documentation" step completes without warnings.**

## 4. Instructions (workflow the skill executes)

1. **Inventory every provided function.**
   - For each `main.rkt` under the three trees, read its `require`/`provide` chain to find every `.rkt` file it aggregates, and read each of those files' own `(provide ...)` clause.
   - Flag any `.rkt` file under these trees with no `provide` clause or not required by any `main.rkt` — it's orphaned/dead code. Report it; don't silently wire it in or delete it without asking (see step 5).
2. **Find the corresponding test file** for each module per §3.3 rule 3. If it doesn't exist, it needs to be created from scratch.
3. **Diff functions vs. required artifacts.** For each provided function, confirm there's at least one `test-case` in the corresponding suite AND a two-line doc comment above its `define` AND a `@defproc` in `scribblings/algorhythms.scrbl`. List every function missing any of the three.
4. **Verify behaviour before writing assertions — do not guess.** Read the actual function body to derive the correct expected value by hand, or cross-check against Racket's built-in equivalent (e.g. compare a custom `sine` against `(sin x)` with `check-within`) for anything approximate/iterative. This applies doubly to extreme/edge inputs (§3.3 rule 14): run the function yourself (a throwaway `racket -e` or scratch script, deleted afterward) with negative, zero, and decimal inputs before asserting what it does. Guard any exploratory call that might not terminate (e.g. with a `thread`/`sync/timeout`) so a genuine infinite loop doesn't hang your session — a case that never returns is itself the bug to report/fix.
5. **If gaps or bugs are found:**
   - **Missing tests / doc comments / scribble entries** → add them directly (safe/reversible; no need to ask).
   - **Actual bugs in source** (wrong formula, crash, swapped names/arguments, extreme input that hangs forever) → for a narrowly-scoped reorg/coverage pass, flag and ask before fixing since these are public-API behaviour changes. If the user has already granted broad authority to rename/restructure/delete/fix (e.g. "you may delete existing files, up to you"), fixing the bug (typically: add a guard/contract for the invalid domain, or correct the formula) is in scope — still call it out explicitly in your final summary so it's never a silent change.
   - **Orphaned files with real, correct, unique functionality** → propose wiring them into the appropriate `main.rkt` (ask if it's ambiguous which module they belong in).
6. **When files move (folder reorg):** update the corresponding test file's `require` paths in the same change. If a source file moves to a new module, move its test cases into that module's test file (not a copy) and delete them from the old one. Also update `scribblings/algorhythms.scrbl` if the export name or module grouping changed.
7. **Scratch-folder disposition — inventory → migrate → prune.** When a "junk drawer" folder appears (e.g. `src/_others/`, an `exercises/` tree, or a `lambda-prob*.rkt` scratchpad), do not skim it. Do:
    - (a) List every function and cross-check each against the production trees — is this a duplicate of something already exported?
    - (b) For anything genuinely unique with real reuse value (during the 2026 clean-code pass this was `lazy`, `memoize`, `leap-year?`, `collatz-steps`), migrate it into the correct production folder with a professional name, a two-line doc comment, a `@defproc` in `algorhythms.scrbl`, valid/edge/invalid tests, and a `require` line in the matching `main.rkt`; then delete the source in the scratch folder.
    - (c) Delete everything else in the scratch tree (broken code, exact duplicates, pure lecture notes, side-effecting demos that run on load) — do not leave it behind as `#|...|#` blocks or as an omit-path in `info.rkt`.
    - (d) Once the folder is empty, drop the `compile-omit-paths` / `test-omit-paths` entries in `info.rkt` that referenced it.
    - Get explicit user approval at step (a) before deleting the rest.
8. **After edits**, list the full set of files touched and a coverage summary: functions found, functions covered, gaps closed, bugs flagged, scribble entries added/renamed.

## 5. Verification

- **Compilation:** `raco setup --pkgs algorhythms` — expect exit code 0 and no scribble warnings.
- **Tests:** `raco test tests/` — expect `N tests passed`, 0 failures/errors.
- **Grep for regressions** after finishing:
  - `-v[1-9]` in `src/**/*.rkt` outside `#|...|#` blocks → should be zero.
  - `check-equal?|check-true|check-false|check-within|check-=|check-exn|check-eqv?|check-pred|check-not-equal?` at top level of any `src/` file → should be zero.
- **HTML test + coverage report (optional visual summary):**
  ```powershell
  .\scripts\unit-test-report.ps1
  ```
  Produces `reports/unit-test-report.html` (pass/fail badge, doughnut+bar charts, per-case drill-down, coverage-% card) and `reports/coverage/index.html` (raco-cover per-line highlighting).

Don't claim tests pass without having actually run one of the above.

## 6. Example (reference shape for a test file)

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

## 7. Example (reference shape for a scribble entry)

Every provided function gets an entry like this in `scribblings/algorhythms.scrbl`:

```scribble
@defproc[(factorial [n exact-nonnegative-integer?]) exact-nonnegative-integer?]{
  Factorial of @racket[n]. @racket[(factorial 0)] is @racket[1] (base case).
}
```

Match the contract exactly to the source's two-line doc comment. Group related
functions under `@subsection{...}` headings that mirror the `src/` folder layout
(one subsection per topic subfolder). Add an `@racketblock[...]` example only
when the behaviour is non-obvious from the contract alone.
