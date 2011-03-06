	var sort_by = function(field, reverse, primer){

		 reverse = (reverse) ? -1 : 1;

		 return function(a,b){

		     a = a[field];
		     b = b[field];

		     if (typeof(primer) != 'undefined'){
		         a = primer(a);
		         b = primer(b);
		     }

		     if (a<b) return reverse * -1;
		     if (a>b) return reverse * 1;
		     return 0;

		 }
	}

