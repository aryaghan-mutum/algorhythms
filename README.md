### Algorhythms

A Racket library of algorithms and data structures.

---

#### Installation
- Open a new Command Prompt (press Windows key, type cmd, hit Enter): `C:\Users\865aam64\Racket\racket.exe --version` or `C:\Users\865aam64\Racket\raco.exe --version`

- Or, if you added Racket to your PATH, just: `racket --version` or `raco --version`

#### Running Tests
- Before pushing changes, test package locally: `raco setup` and `raco test .`
- To run all tests: `raco test tests`
- To run an individual test file: `raco test tests/encoding/morse-code-test.rkt`

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
#### Package
`raco pkg show @aryaghan-mutum/algorhythms`
`raco pkg show algorhythms`
