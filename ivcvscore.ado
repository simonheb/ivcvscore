cap program drop ivcvscore
program ivcvscore, rclass
	syntax varlist [if], [treatment(varlist numeric)] GENerate(name)
	
	marksample touse
	
	//drop collinear variables
	_rmcoll x* if `touse', forcedrop
	local varlist = r(varlist)
	
	//I use the control group for normalization. If no treatment is given, I use everything
	if ("`treatment'"=="") {
		tempvar treatment
		gen `treatment'=0
	}
	//loop over vars to normalize and check if they vary
	foreach var of varlist `varlist'{
		tempvar z`var' 
		
		qui sum `var' if `treatment'==0 & `touse'
		
		if r(sd)==0 {
			di as err "no variation in `var', leaving it out of indices"
		}
		else {
			gen `z`var'' = (`var'-r(mean))/r(sd) if `touse'
			local usedvars `usedvars' `var'
			local components `components' `z`var''
		}
	}

	local varcount: word count `components'
		
	//get cov matrix from control group
	qui corr `components'  if `treatment'==0 & `touse', c
	matrix Cinv=inv(r(C))
	matrix Isrow = vecdiag(I(`varcount'))
	matrix weights = Isrow*Cinv
	mata st_matrix("rmm",rowminmax(st_matrix("weights")))
	if (rmm[1,1]<0 | rmm[1,2]>2) {
		di as err "Some of the weights seem a bit odd (outside [0,2]), you might want to check them:"
	}
	mat colnames weights = `usedvars'
	mat list weights 
	
	//compute weighted average
	gen `generate' = 0 if `touse'
	foreach var of local usedvars {
		mat weight = weights[1,"`var'"]
		qui replace `generate' = `generate'+weights[1,1]*`var' if `touse'
	}

	//normalize final index to have mean 0 and sd 1 in the control group
	qui sum `generate' if `treatment'==0  & `touse'
	qui replace `generate'= (`generate'-r(mean))/r(sd)	 if `touse'
	label var `generate' "Inverse covariance weighted score of: `usedvars'"	
end
