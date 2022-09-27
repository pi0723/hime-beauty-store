window.addEventListener('load', function(){
    if (document.getElementById("notice") !== null) {
      const noticeMessage = document.getElementById("notice")
      setTimeout (function(){
        noticeMessage.classList.add("fadeout");
      }, 3000);
  };
});