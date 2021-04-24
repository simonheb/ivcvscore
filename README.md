# ivcwscore
Stata package to compute inverse variance-covariance weighted z-scores, following Anderson (2008).

 - [Install](#install) 
 - [Citation](#citation)
 - [Changelog](#changelog)
 - [References](#references)

## Install
To obtain the latest version through github, from the main window in Stata, run:
```
net describe ivcwscore, from(https://raw.githubusercontent.com/simonheb/ivcwscore/master/)
```
If the download from within Stata fails (e.g. because you are behind a firewall),you can always download the files directly: 
 - https://raw.githubusercontent.com/simonheb/ivcwscore/master/ivcwscore.ado
 - https://raw.githubusercontent.com/simonheb/ivcwscore/master/ivcwscore.sthlp

## Citation
`ivcwscore` is not an offical State command. It is a piece of software I wrote and made freely available to the community, similar to a paper. Please cite:

Heß, Simon, "ivcwscore: Stata package to compute inverse covariance weighted z-scores".

## Disclaimer of Warranties and Limitation of Liability
Use at own risk. You agree that use of this software is at your own risk. The author is optimistic but does not make any warranty as to the results that may be obtained from use of this software. The author would be very happy to hear about any issues you might find and will be transparent about changes made in response to user inquiries.

## References
**Anderson, M. L. (2008)**. "Multiple inference and gender differences in the effects of early intervention: A reevaluation of the Abecedarian, Perry Preschool, and Early Training Projects." *Journal of the American statistical Association*, 103(484), 1481-1495.
