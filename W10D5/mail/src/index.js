document.addEventListener("DOMContentLoaded",(event)=>{
    window.location.hash ="#inbox";

    const navButtons = Array.from(document.querySelectorAll(".sidebar-nav li"));
    navButtons.forEach(navButton => {
        navButton.addEventListener("click", ()=> {
            let name = navButton.innerText.toLowerCase();
            location.hash = name;
        });
    });
});