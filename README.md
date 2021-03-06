# ivcvscore
Stata package to compute inverse variance-covariance weighted z-scores, following Anderson (2008).

 - [Install](#install) 
 - [Citation](#citation)
 - [Changelog](#changelog)
 - [References](#references)
 - [Example code](#illustrative-code-example)

## Install
To obtain the latest version through github, from the main window in Stata, run:
```
net describe ivcvscore, from(https://raw.githubusercontent.com/simonheb/ivcvscore/master/)
net install ivcvscore
```
If the download from within Stata fails (e.g. because you are behind a firewall),you can always download the files directly: 
 - https://raw.githubusercontent.com/simonheb/ivcvscore/master/ivcvscore.ado
 - https://raw.githubusercontent.com/simonheb/ivcvscore/master/ivcvscore.sthlp

## Citation
`ivcvscore` is not an offical State command. It is a piece of software I wrote and made freely available to the community, similar to a paper. Please cite:

Heß, Simon, "ivcvscore: Stata package to compute inverse covariance weighted z-scores".

## Disclaimer of Warranties and Limitation of Liability
Use at own risk. You agree that use of this software is at your own risk. The author is optimistic but does not make any warranty as to the results that may be obtained from use of this software. The author would be very happy to hear about any issues you might find and will be transparent about changes made in response to user inquiries.

## References
**Anderson, M. L. (2008)**. "Multiple inference and gender differences in the effects of early intervention: A reevaluation of the Abecedarian, Perry Preschool, and Early Training Projects." *Journal of the American statistical Association*, 103(484), 1481-1495.

## Illustrative code example
```
//generate data with correlated variables
clear
set obs 100
gen a = rnormal() 
gen x1 = rnormal() + a 
gen x2 = rnormal() + a 
gen x3 = rnormal() 
gen x4 = x3 
gen x5 = 1 
//compute score
ivcvscore x1 x2 x3 x4 x5, gen(s)
```
