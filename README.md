### Algorhythms

A Racket library of algorithms and data structures.

---

#### Running Tests

To run all tests:
```bash
raco test tests/
```
To run an individual test file:
```bash
raco test tests/math/factorial.rkt
```

---

#### Code Formatting

Check and fix code style for all Racket files:

```bash
raco pkg install racket-format    # one-time setup
raco format --check .            # check formatting
raco format -i .                 # auto-format all files
```

---

#### Package Management

Remove the package:
```bash
raco pkg remove algorhythms
```
Install the package:
```bash
raco pkg install algorhythms
```
Update the package:
```bash
raco pkg update algorhythms
```
