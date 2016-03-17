$(document).ready(function() {

  document.forms.register.noValidate = true;
  $('form').on('submit', function(e) {
    var elements = this.elements;
    var valid = {};
    var isValid;
    var isFormValid;
//    var breakfastprices = $("#bkprices").val();
//    var lunchprices = $("#lunchprices").val();
//    var dinnerprices = $("#dinnerprices").val();
//
//    console.log(breakfastprices);
//       	if(breakfastprices===null){
//       		$("#bkprices").val(0.00);
//       	}
//       	if(lunchprices===null){
//       		$("#lunchprices").val(0.00);
//       	}
//       	if(dinnerprices===null){
//       		$("#dinnerprices").val(0.00);
  //     	}
    
    for(var i = 0, l = (elements.length - 1); i < 1; i++) {
      isValid = validateRequired(elements[i] && validateTypes(elements[i]));
      if(!isValid) {
        showErrorMessage(elements[i]);
      } else {
    	  
        removeErrorMessage(elements[i]);
      }
      
      
      valid[elements[i].id] = isValid;
    }
    
       	
    });
});
