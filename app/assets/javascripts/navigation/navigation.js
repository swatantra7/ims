$(function() {
  $('li').each(function(){
    $(this).find('a').each(function(){
      $(this).css("color", "black");
    });
    
  });
});