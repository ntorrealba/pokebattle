window.Battle = {
  state: {},
  battle: 'Battle',
  getRandomIntInclusive() {
    min = Math.ceil(0);
    max = Math.floor((this.state.movements.length - 1));
    return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is inclusive and the minimum is inclusive
  },
  init() {
    this.state.player1 = document.getElementById('pokemon1');
    this.state.player2 = document.getElementById('pokemon2');
    this.state.bottons = document.querySelectorAll('.btn-move');
    this.state.movements = ['animate__bounce', 'animate__swing', 'animate__shakeX', 'animate__shakeY']
    this.state.turnEvent = new Event('endTurn')
    this.state.winner = document.getElementById('modal-winner')
    let counter = 0
    console.log(counter)
    this.state.bottons.forEach(botton => {
      botton.addEventListener('click', () => {
          let randomMovement = this.getRandomIntInclusive()
          this.state.player1.classList.add(this.state.movements[randomMovement])
          setTimeout(() => {
            this.state.player1.classList.remove(this.state.movements[randomMovement])
            this.state.player2.dispatchEvent(this.state.turnEvent)
          }, 2000)
          counter++
          console.log(counter)
          if (counter === 6) {
            this.state.bottons.forEach(botton => {
            botton.classList.add('hidden')
            this.state.winner.classList.remove('hidden')
            })
          }
      })

    })


    this.state.player2.addEventListener('endTurn', () => {
      randomMovement = this.getRandomIntInclusive()
      this.state.player2.classList.add(this.state.movements[randomMovement])
      setTimeout(() => {
        this.state.player2.classList.remove(this.state.movements[randomMovement])
      }, 1000)
    })

  },
},

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
