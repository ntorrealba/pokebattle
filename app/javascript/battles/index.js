document.addEventListener('turbolinks:load', function () {
  const page = document.getElementById('page-battle-index')
  if (page) {
    const audio = document.getElementById('battle-audio')
    audio.play();
    move();
  }
});

function move() {
  const button = document.querySelectorAll('.button-move');
  console.log(button);

}