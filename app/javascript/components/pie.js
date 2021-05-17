const pieChart = () => {
    const pie = document.querySelector('.pie')
    const p = parseFloat(pie.textContent);
    pie.style.animationDelay = '-' + p + 's';
  };


const toggleCheckbox = () => {
  const checkBox = document.querySelector(".slider");
  checkBox.addEventListener("click", () => {  
    let toggle_one = document.getElementById('toggle_one');
    let toggle_two = document.getElementById('toggle_two');
    if (toggle_one.classList.contains("inactive")){
      toggle_one.classList.remove("inactive");
      toggle_two.classList.add("inactive");
    } else {
      toggle_one.classList.add("inactive");
      toggle_two.classList.remove("inactive");
    }
  });
};


export { pieChart, toggleCheckbox };