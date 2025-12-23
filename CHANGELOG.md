# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- CLI tool for command-line access to algorithms (`bin/cli.rkt`)
- GitHub Pages documentation deployment workflow
- Organized examples directory with README and categorized examples
- Module contracts for type safety on public APIs
- `main.rkt` entry points for all module folders
- Scribble documentation (`scribblings/algorhythms.scrbl`)
- Package caching in CI workflows for faster builds
- Code coverage reporting with Codecov integration
- Exposed `memoize` and `lazy` utilities from private module

### Changed
- Reorganized module structure using aggregator pattern
- Updated `setup-racket` action to v1.14
- Simplified root `algorhythms.rkt` to use aggregator imports
- Synced version across `info.rkt` and README badges

### Fixed
- Removed references to non-existent `fractions.rkt`
- Fixed CI git configuration errors (exit code 128)
- Removed duplicate example files

### Removed
- Deprecated `coverage.yml` workflow (merged into `ci.yml`)

## [0.3.0] - 2024-12-23

### Added
- Algebra module with matrices, logarithms, quadratic formula
- Statistics module with complement, identity, rotations
- Combinatorics module with factorial
- Geometry module with 2D and 3D shapes
- Trigonometry module with trig functions and identities
- Number theory module with primes, fibonacci, GCD, LCM
- Sorting algorithms: bubble, insertion, quick, selection
- Higher-order functions: map, filter, reduce, fold, flatten
- Morse code encoding/decoding
- Queue and stack data structures

### Changed
- Updated to Racket 8.18 compatibility
- Improved module organization

## [0.2.0] - 2024-01-15

### Added
- Initial data structures module
- Basic arithmetic operations
- List manipulation functions

## [0.1.0] - 2023-12-01

### Added
- Initial release
- Basic project structure
- Core algorithm implementations

---

## Version History Summary

| Version | Date | Highlights |
|---------|------|------------|
| 0.3.0 | 2024-12-23 | Major refactor, full module system |
| 0.2.0 | 2024-01-15 | Data structures, arithmetic |
| 0.1.0 | 2023-12-01 | Initial release |

[Unreleased]: https://github.com/aryaghan-mutum/algorhythms/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/aryaghan-mutum/algorhythms/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/aryaghan-mutum/algorhythms/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/aryaghan-mutum/algorhythms/releases/tag/v0.1.0
