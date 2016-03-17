$(document).ready(function() {

  document.forms.register.noValidate = true;
  $('form').on('submit', function(e) {
    var elements = this.elements;
    var valid = {};
    var isValid;
    var isFormValid;
    var breakfastprices = document.getElementById("bkprices");
    var lunchprices = document.getElementById("lunchprices");
    var dinnerprices = document.getElementById("dinnerprices");

    for(var i = 0, l = (elements.length - 4); i < 1; i++) {
      isValid = validateRequired(elements[i] && validateTypes(elements[i]));
      if(!isValid) {
        showErrorMessage(elements[i]);
      } else {
        removeErrorMessage(elements[i]);
      }
      
      
      valid[elements[i].id] = isValid;
    }
    for(var i = 9, l = (elements.length-1); i < 1; i++){ 
       	if(breakfastprices===null){
       		breakfastprices=0.00;
       	}
       	if(lunchprices===null){
       		lunchprices=0.00;
       	}
       	if(dinnerprices===null){
       		dinnerprices=0.00;
       	}
    }
       	
    });
});
