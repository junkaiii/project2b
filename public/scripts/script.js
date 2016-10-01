$(function() {
  $("#login-btn").click(function(event){
    console.log('click');
    $(".login-bg").removeClass("invisible");
    $(".login-container").removeClass("invisible");
     event.preventDefault();
  });
});
