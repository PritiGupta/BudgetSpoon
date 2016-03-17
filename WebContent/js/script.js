$(document).ready(function() { 
  
	$('#logo').hover(function() {
    $(this).css("color", "#C0C0C0");
  },
  function() {
    $(this).css("color", "#D8D8D8");
  });

  $('#logo').hover(function() {
    $(this).css("border-color", "#C0C0C0");
  },
  function() {
    $(this).css("border-color", "#D8D8D8");
  });

  $('nav a').hover(function() {
    $(this).css("color", "#606060");
  },
  function() {
    $(this).css("color", "#D8D8D8");
  });
  
  $('input').hover(function() {
	  $(this).css("background-color", "#A0A0A0");
  },
  function() {
	  $(this).css("background-color", "#f8f7f7");
  });

  $('select').hover(function() {
    $(this).css("background-color", "#A0A0A0");
  },
  function() {
    $(this).css("background-color", "#f8f7f7");
  });

//  $('select').click(function() {
//  });
//   $('select').selectmenu({
//     background: "#A0A0A0"
//  });

  $(':submit').hover(function() {
    $(this).css("background-color", "#A0A0A0");
  },
  function() {
    $(this).css("background-color", "#f8f7f7");
  });

  $(':checkbox').hover(function() {
    $(this).css("background-color", "#A0A0A0");
  },
  function() {
    $(this).css("background-color", "#f8f7f7");
  });

});
