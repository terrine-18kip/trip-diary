function pullDown() {

  const pullDownbutton = document.getElementById("user-info")
  const pullDownParents = document.getElementById("pull-down")

  pullDownbutton.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color:none;")
  })

  pullDownbutton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color:none;")
  })

  pullDownbutton.addEventListener('click', function(){
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
}

window.addEventListener('DOMContentLoaded', pullDown)