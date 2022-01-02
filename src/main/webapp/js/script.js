let spans = document.querySelectorAll("span");

spans.forEach(element => {
    element.classList.add("form__span");
    element.lastChild.classList.add("form__span");
});

