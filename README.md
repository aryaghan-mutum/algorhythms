### Algorhythms

#### Run Tests
```bash
- all: raco test tests/
- individually: raco test tests/math/factorial.rkt
```

#### Cmds

##### Code Formatting
To check and fix code style for all Racket files:

```bash
raco pkg install racket-format    # one-time setup
raco format --check .            # check formatting
raco format -i .                 # auto-format all files
```

test: `raco test tests/`
