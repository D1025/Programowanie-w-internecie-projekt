var images = ["pngs/img01.png", "pngs/img02.png", "pngs/img03.png"];

// Indeks aktualnie wyświetlanego obrazka
var currentIndex = 0;

// Funkcja zmieniająca obrazek
function changeImage() {
  var img = document.getElementById("banner01");
  img.src = images[currentIndex];
  currentIndex++;
  if (currentIndex == images.length) {
    currentIndex = 0;
  }
}

// Cykliczne wywoływanie funkcji co 5 sekund
setInterval(changeImage, 5000);

