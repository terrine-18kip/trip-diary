document.addEventListener('DOMContentLoaded', function () {
  const InputMember = document.getElementById('input-member');
  document.getElementById('add-member').addEventListener('click', function(e){
    const inputElement = document.createElement('input');
    inputElement.setAttribute("name","trip[user_ids][]");
    inputElement.setAttribute("placeholder","IDを入力して下さい");
    inputElement.setAttribute("class","input-default");
    InputMember.appendChild(inputElement);
  });
});