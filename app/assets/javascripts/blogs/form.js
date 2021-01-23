document.addEventListener("turbolinks:load", function(){
  $(function(){
    $('#text-field').keyup(function(){
      const str = $(this).val().replace(/[\n\s　]/g, "");
      const str01 = str.replace('<div>', "");
      const str02 = str01.replace('</div>', "");
      const str03 = str02.replace(/(<br>|<br \/>)/gi, "");
      const str04 = str03.replace('<h1>', "");
      const str05 = str04.replace('</h1>', "");
      const str06 = str05.replace('<blockquote>', "");
      const str07 = str06.replace('</blockquote>', "");
      const str08 = str07.replace('<pre>', "");
      const str09 = str08.replace('</pre>', "");
      const str10 = str09.replace('<ul>', "");
      const str11 = str10.replace('</ul>', "");
      const str12 = str11.replace('<ol>', "");
      const str13 = str12.replace('</ol>', "");
      const str14 = str13.replace('<strong>', "");
      const str15 = str14.replace('</strong>', "");
      const str16 = str15.replace('<em>', "");
      const str17 = str16.replace('</em>', "");
      const count = str17.length + "文字";
      $('#textlength').text(count);
    });
  });
});