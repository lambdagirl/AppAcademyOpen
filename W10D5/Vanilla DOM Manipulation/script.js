document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
const addLi = (e) =>{
  e.preventDefault();
  const liInput = document.querySelector(".favorite-input");
  const li = liInput.value;
  liInput.value = "";
  const newLi = document.createElement("li");
  newLi.textContent = li;
  const placesList = document.getElementById("sf-places");
  placesList.append(newLi);
}

const placeSubmitButton = document.querySelector(".favorite-submit");
placeSubmitButton.addEventListener("click", addLi);

  // adding new photos

  // --- your code here!



});
