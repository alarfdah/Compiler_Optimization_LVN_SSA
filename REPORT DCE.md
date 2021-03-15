# Ahmed Radwan
## Report for Dead Code Elimination
| Benchmark   | Orig. # Inst. | Opt. Time | Opt. # Inst. |
| ----------- | ------------: | --------: | -----------: |
| Arrayparam  |           841 |    0.296s |          444 |
| Bubble      |          4374 |    0.286s |         2747 |
| Check       |           140 |    0.251s |            9 |
| Dynamic     |         39155 |    0.351s |        24335 |
| Fib         |           274 |    0.262s |          230 |
| Gcd         |           103 |    0.251s |           81 |
| Newdyn      |        136919 |    0.294s |        85151 |
| QS          |          4574 |    0.296s |         3368 |
| While Array |           377 |    0.247s |          278 |

## IOPT Bash Script Output
> Bash script found in root directory named `iopt`.
```r
Program starting
----------arrayparam----------
Parsed.

real	0m0.326s
user	0m0.462s
sys	0m0.063s
21c21
< Total Instructions Executed = 841
---
> Total Instructions Executed = 444
------------------------------
------------bubble------------
Parsed.

real	0m0.343s
user	0m0.583s
sys	0m0.059s
16c16
< Total Instructions Executed = 4374
---
> Total Instructions Executed = 2747
------------------------------
------------check-------------
Parsed.

real	0m0.270s
user	0m0.376s
sys	0m0.046s
2c2
< Total Instructions Executed = 140
---
> Total Instructions Executed = 9
------------------------------
-----------dynamic------------
Parsed.

real	0m0.428s
user	0m0.836s
sys	0m0.068s
2c2
< Total Instructions Executed = 39155
---
> Total Instructions Executed = 24335
------------------------------
-------------fib--------------
Parsed.

real	0m0.270s
user	0m0.373s
sys	0m0.051s
21c21
< Total Instructions Executed = 274
---
> Total Instructions Executed = 230
------------------------------
--------------gcd-------------
Parsed.

real	0m0.294s
user	0m0.399s
sys	0m0.053s
2c2
< Total Instructions Executed = 103
---
> Total Instructions Executed = 81
------------------------------
------------newdyn------------
Parsed.

real	0m0.346s
user	0m0.603s
sys	0m0.057s
2c2
< Total Instructions Executed = 136919
---
> Total Instructions Executed = 85151
------------------------------
--------------qs--------------
Parsed.

real	0m0.324s
user	0m0.534s
sys	0m0.059s
61c61
< Total Instructions Executed = 4574
---
> Total Instructions Executed = 3368
------------------------------
---------while_array----------
Parsed.

real	0m0.285s
user	0m0.402s
sys	0m0.051s
11c11
< Total Instructions Executed = 377
---
> Total Instructions Executed = 278
Done.
```