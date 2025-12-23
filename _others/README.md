# Examples

This directory contains example code demonstrating the usage of the Algorhythms library.

## Directory Structure

```
examples/
├── README.md              # This file
├── quick-start.rkt        # Quick start examples
├── collatz-variant-conjecture.rkt  # Collatz conjecture exploration
├── algorithms/            # Algorithm demonstrations
│   ├── sorting.rkt        # Sorting algorithm comparisons
│   ├── searching.rkt      # Search algorithms
│   └── number-theory.rkt  # Prime, GCD, LCM examples
├── data-structures/       # Data structure examples
│   ├── lists.rkt          # List operations
│   ├── higher-order.rkt   # Map, filter, reduce examples
│   └── strings.rkt        # String manipulation
├── math/                  # Mathematical examples
│   ├── arithmetic.rkt     # Basic math operations
│   ├── geometry.rkt       # Geometry calculations
│   └── trigonometry.rkt   # Trig functions
└── encoding/              # Encoding examples
    └── morse-code.rkt     # Morse code encoding/decoding
```

## Quick Start

```racket
#lang racket
(require algorhythms)

;; Calculate factorial
(factorial 10)  ; => 3628800

;; Check if number is prime
(prime? 17)  ; => #t

;; Encode to Morse code
(encode-to-morse "SOS")  ; => "... --- ..."

;; Sort a list
(quick-sort '(5 2 8 1 9))  ; => '(1 2 5 8 9)
```

## Running Examples

```bash
# Run a specific example
racket examples/quick-start.rkt

# Run from REPL
racket
> (require algorhythms)
> (factorial 5)
120
```

## Categories

### Algorithms
Examples demonstrating sorting, searching, and mathematical algorithms.

### Data Structures
Examples showing list operations, higher-order functions, and set operations.

### Math
Examples of arithmetic, geometry, trigonometry, and number theory functions.

### Encoding
Examples of text encoding and decoding (Morse code, etc.).

## Contributing

When adding new examples:
1. Place them in the appropriate category folder
2. Add clear comments explaining the example
3. Include expected output in comments
4. Keep examples focused and concise
