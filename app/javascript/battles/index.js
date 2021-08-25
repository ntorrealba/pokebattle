window.Battle = {
  state: {},
  init() {
    this.state.player1 = document.getElementById('pokemon1');
    this.state.player2 = document.getElementById('pokemon2');
    this.state.bottons = document.querySelectorAll('.btn-move');
    this.state.movements = ['animate__bounce', 'animate__swing', 'animate__shakeX', 'animate__shakeY']
    this.actions();
    this.game();
  },
  actions() {
    this.state.bottons.forEach(botton => {
      botton.addEventListener('click', function () {
        const randomMovement = 2
        this.state.player1.classList.remove(...this.state.movements)
        this.state.player1.classList.add(this.state.movements[randomMovement])
        setTimeout(3000)
        this.state.turnEnd = true
      }.bind(this))
    })
  },
  game() {
    let counter = 1

    while (counter <= 6) {
      if (counter%2 ==! 0) {
        const randomMovement = 2
        this.state.currentPlayer = this.state.player2
        this.state.currentPlayer.classList.remove(...this.state.movements)
        this.state.currentPlayer.classList.add(this.state.movements[randomMovement])
        debugger
      }
      else {
        this.state.currentPlayer = this.state.player1
        this.state.turnEnd = false
        while (this.state.turnEnd) {
          debugger
        }
      }
      counter++
    }
  }
}




document.addEventListener('turbolinks:load', function () {
  const page = document.getElementById('page-battle-index')
  if (page) {
    const audio = document.getElementById('battle-audio')
    audio.play();
    Battle.init();
  }

});

//function battle() {
//  let pokemon1 = document.getElementById('pokemon1');
//  let pokemon2 = document.getElementById('pokemon2');

//  let btnsMove = document.querySelectorAll('.btn-move');
//  let counter = 1

//  while (counter <= 3) {

//    btnsMove[0].addEventListener('click', function () {
//      pokemon1.classList.add('animate__bounce')
//      pokemon1.addEventListener('animationend', function () {
//        pokemon1.classList.remove('animate__bounce')
//      });
//      pokemon2.classList.add('animate__flash')
//    });

//     btnsMove[1].addEventListener('click', function () {
//       pokemon1.classList.add('animate__swing')
//       pokemon1.addEventListener('animationend', function () {
//         pokemon1.classList.remove('animate__swing')
//       });
//       pokemon2.classList.add('animate__flash')
//     });

//     btnsMove[2].addEventListener('click', function () {
//       pokemon1.classList.add('animate__shakeX')
//       pokemon1.addEventListener('animationend', function () {
//         pokemon1.classList.remove('animate__shakeX')
//       });
//       pokemon2.classList.add('animate__flash')
//     });

//     btnsMove[3].addEventListener('click', function () {
//       pokemon1.classList.add('animate__shakeY')
//       pokemon1.addEventListener('animationend', function () {
//         pokemon1.classList.remove('animate__shakeY')
//       });
//       pokemon2.classList.add('animate__flash')
//     });
//     counter++;
//   }

// }
