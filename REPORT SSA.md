# Ahmed Radwan
## Report
| Benchmark   | Orig. # Inst. | Opt. Time | Opt. # Inst. |
| ----------- | ------------: | --------: | -----------: |
| Arrayparam  |           841 |    0.296s |          657 |
| Bubble      |          4374 |    0.286s |         3184 |
| Check       |           140 |    0.251s |          120 |
| Dynamic     |         39155 |    0.351s |        25782 |
| Fib         |           274 |    0.262s |          232 |
| Gcd         |           103 |    0.251s |           86 |
| Newdyn      |        136919 |    0.294s |        92795 |
| QS          |          4574 |    0.296s |         3782 |
| While Array |           377 |    0.247s |          321 |

## IOPT Bash Script Output
> Bash script found in root directory named `iopt`.
```r
Program starting
----------arrayparam----------
Parsed.

real	0m0.372s
user	0m0.503s
sys	0m0.065s
21c21
< Total Instructions Executed = 657
---
> Total Instructions Executed = 841
------------------------------
------------bubble------------
Parsed.

real	0m0.352s
user	0m0.582s
sys	0m0.058s
16c16
< Total Instructions Executed = 3184
---
> Total Instructions Executed = 4374
------------------------------
------------check-------------
Parsed.

real	0m0.280s
user	0m0.389s
sys	0m0.052s
2c2
< Total Instructions Executed = 120
---
> Total Instructions Executed = 140
------------------------------
-----------dynamic------------
Parsed.

real	0m0.462s
user	0m0.857s
sys	0m0.070s
2c2
< Total Instructions Executed = 25782
---
> Total Instructions Executed = 39155
------------------------------
-------------fib--------------
Parsed.

real	0m0.270s
user	0m0.375s
sys	0m0.050s
21c21
< Total Instructions Executed = 232
---
> Total Instructions Executed = 274
------------------------------
--------------gcd-------------
Parsed.

real	0m0.309s
user	0m0.438s
sys	0m0.057s
2c2
< Total Instructions Executed = 86
---
> Total Instructions Executed = 103
------------------------------
------------newdyn------------
Parsed.

real	0m0.346s
user	0m0.555s
sys	0m0.053s
2c2
< Total Instructions Executed = 92795
---
> Total Instructions Executed = 136919
------------------------------
--------------qs--------------
Parsed.

real	0m0.368s
user	0m0.619s
sys	0m0.062s
61c61
< Total Instructions Executed = 3782
---
> Total Instructions Executed = 4574
------------------------------
---------while_array----------
Parsed.

real	0m0.298s
user	0m0.408s
sys	0m0.054s
11c11
< Total Instructions Executed = 321
---
> Total Instructions Executed = 377
Done.
```