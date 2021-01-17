// var input = document.getElementById('#text-field');
// var count = input.nodeValue.length
// console.log(count);

const input = document.getElementById("text-field");
const count = document.getElementById("textlength");
input.addEventListener("keyup", function() {
  count.textlength = input.value.length;
});

$(function(){
  $('#text-field').keyup(function(){
    var count = $(this).val().length;
    $('#textlength').text(count);
  });
});
