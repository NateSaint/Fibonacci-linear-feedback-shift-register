#### Fibonacci Linear Feedback Shift Register (LFSR)

Implemented by: Nathen St. Germain,
Resources used: <https://en.wikipedia.org/wiki/Linear-feedback_shift_register>

Fibonacci LFSR implemented in R for the purpose of random number generation. The functions included 
will generate a function that will generate n random number with a periodicity of (2^k) - 1, where 
k is the number of bits.

## To Run:
    * Load .R file into memory (lfsr.R)
    * To test periodicity, load periodicity.R into memory

## Sample Use in R Console:
```
> sevenBitLFSR <- genSevenBitLFSR()
> sevenBitLFSR(10)
 [1] 107  53  90 109 118 123  61  94 111  55
> sevenBitLFSR(2)
[1] 27 13
> sevenBitLFSR(12)
 [1]  70  99  49  88  44  22  75  37  82 105 116  58
> 
> fourteenBitLFSR <- genFourteenBitLFSR()
> fourteenBitLFSR(10)
 [1] 11114 13749 15066  7533 11958  5979 11181  5590 10987  5493
> fourteenBitLFSR(2)
[1] 10938 13661
> fourteenBitLFSR(12)
 [1] 15022 15703  7851 12117  6058  3029  1514  8949  4474  2237  1118
[12]   559
```


Periodicity function can be found in periodicity.R
```
> sevenBitLFSR <- genSevenBitLFSR()
> periodicity(sevenBitLFSR)
[1] 127 127   0
> fourteenBitLFSR <- genFourteenBitLFSR()
> periodicity(fourteenBitLFSR)
[1] 16383 16383     0
```
