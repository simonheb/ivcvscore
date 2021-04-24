{smcl}
{* *! version 0.0.1 2021}{...}
{vieweralsosee "[R] egen" "help egen"}{...}
{viewerjumpto "Syntax" "ivcwscore##syntax"}{...}
{viewerjumpto "Description" "ivcwscore##description"}{...}
{viewerjumpto "Options" "ivcwscore##options"}{...}
{viewerjumpto "Examples" "ivcwscore##examples"}{...}
{viewerjumpto "Author" "ivcwscore##author"}{...}
{viewerjumpto "References" "ivcwscore##references"}{...}
{title:Title}

{p2colset 5 20 22 2}{...}
{p2col :{bf:ivcwscore} {hline 2}} Stata package to compute inverse variance-covariance weighted z-scores.{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{pstd}
Computes inverse variance-covariance weighted z-scores, following Anderson (2008), to compute indexes.

{p 8 16 2}
{cmd:ivcwscore}
	{it:varlist}
	{cmd:,} {it:{help ritest##options_table:generate(varname)}}
	{cmd::} [{it:treatment(varname)}]

{synoptset 27 tabbed}{...}
{marker options_table}{...}
{synopthdr}
{synoptline}
{syntab :Main}
{synopt :{opt gen:erate(varname)}}store index in new variable {it:varname} {p_end}
{synopt :{opt treatment(varname)}}variable indicating a treatment group. I this is specified, the standardization and variance wil be computed using only control group observations. {p_end}
{synoptline}
{p2colreset}

{marker description}{...}
{title:Description}

{pstd}
{cmd:ivcwscore} computes z-scores to aggregate indicators, using weights that account
for the variance-covariance among indicators.  The computation follows Anderson (2008)
and is usefull, e.g., to address the issue of multiple hypothesis testing.

{dlgtab:Example}

{pin}
{cmd:. ivcwscore} {it:employed} {it:ownscar} {it:wateraccess} {it:ownsphome} {cmd:,} {opt generate(score)}

{pstd}
This command will standardize all four variables to have mean 0 and variance 1 and
compute the variance-covariance matrix. Rows of the inverse of the variance-covariance matrix
are summed up to obtain weights for each variable. The final index is constructed by summing up all 4 variables, using
these weights and standardizing it to have mean 0 and variance 1.



{pin}
{cmd:. ivcwscore} {it:employed} {it:ownscar} {it:wateraccess} {it:ownsphome} {cmd:,} {opt generate(score) treatment(treat)}

{pstd}
This command will standardize all four variables to have mean 0 and variance 1 in the control group (treat==0) and
compute the variance-covariance matrix (in the control group). Rows of the inverse of the variance-covariance matrix
are summed up to obtain weights for each variable. The final index is constructed by summing up all 4 variables, using
these weights and stardardizing it again, to have mean 0 and variance 1 in the control group.

{title:Citation}

{pstd}
Heß, Simon, "ivcwscore: Stata package to compute inverse variance-covariance weighted z-scores.".
{p_end}

{title:References}

{pstd}
{bf:Anderson, M. L. (2008)}. "Multiple inference and gender differences in the effects of early intervention: A reevaluation of the Abecedarian, Perry Preschool, and Early Training Projects." {it:Journal of the American statistical Association}, 103(484), 1481-1495.
{p_end}


{title:Author}

{pstd}
Simon Heß, Goethe University Frankfurt.{p_end}

{pstd}
The latest version of ivcwscore can always be obtained from {browse "https://github.com/simonheb/ivcwscore"} or {browse "http://HessS.org"}. I am happy to receive comments and suggestions regarding bugs or ideas for improvements/extensions via {browse "https://github.com/simonheb/ivcwscore/issues"}.
{p_end}
