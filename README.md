# capital-gains

Capital gains calculator.

This transforms transaction histories into a format suitable for [IRS form
8949](https://www.irs.gov/pub/irs-pdf/f8949.pdf), taking care of wash sale
adjustments.

Note: The logic is ignorant of share type, and cannot account for e.g. bargain
elements for ESPP, ISO, and NSO. You must enter the appropriate cost basis
depending on your situation, e.g. the fair market value on exercise date for
ESPP disqualifying dispositions.

See also
[nkouevda/estimated-taxes](https://github.com/nkouevda/estimated-taxes).

## Usage

```
usage: capital-gains [<options>] [--] <input file>

Capital gains calculator

optional arguments:
  -h, --help            show this help message and exit
  -d <n>, --decimal-places <n>
                        round $ to <n> decimal places (default: 0)
  -s <n>, --shares-decimal-places <n>
                        round shares to <n> decimal places (default: 0)
  -t, --totals          output totals
  -v, --verbose         verbose output
  -V, --version         show program's version number and exit
  -w, --wash-sales, --no-wash-sales
                        identify wash sales and adjust cost basis (default: True)
```

## Input Format

See [input/example.csv](input/example.csv).

Each entry has the following format:

    date,symbol,name,shares,price,fee

- `date`: `YYYY-MM-DD` format
- `name`: optional (can be blank)
- `shares`: purchases have positive `shares`; sales have negative `shares`
- `price`: non-negative
- `fee`: non-negative; optional (can be blank)

Entries must be in ascending date order, i.e. oldest first.

A sale without a `name` will sell all open lots FIFO; a sale with a `name` will
only sell lots with the same `name`. Thus `name` can be used to specify orders
other than FIFO.

## Examples

    docker run -it -v /Users/xxxx/Source/capital-gains/local:/usr/src/app/local capital-gains-app bash

    capital-gains -t input/example.csv > local/example.txt


## License

[MIT License](LICENSE.txt)
