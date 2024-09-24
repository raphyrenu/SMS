const sideLinks = document.querySelectorAll(".sideLinks");

sideLinks.forEach(function(sideLink) {
  sideLink.addEventListener("click", function() {
    sideLinks.forEach(function(link) {
      link.classList.remove("sideLinksActive");
    });
    this.classList.add("sideLinksActive");
  });
});
