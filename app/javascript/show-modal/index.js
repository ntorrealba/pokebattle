edocument.addEventListener('turbolinks:load', function () {
  const page = document.getElementById('page-pokemon-show')
  if (page) {
    showModal()
  }
});

function showModal() {

  const modalOne = document.querySelector('#modal-one');
  const modalTwo = document.querySelector('#modal-two');
  const modalThree = document.querySelector('#modal-three');

  const divideOne = document.querySelector('#divide-one');
  const divideTwo = document.querySelector('#divide-two');
  const divideThree = document.querySelector('#divide-three');

  const btnOpenModal = document.querySelectorAll('.show-modal');


  for (let i = 0; i < btnOpenModal.length; i++)

    btnOpenModal[i].addEventListener('click', function () {
      if (i === 1) {
        modalOne.classList.add('hidden');
        modalThree.classList.add('hidden');
        modalTwo.classList.remove('hidden');

        divideOne.classList.add('hidden');
        divideThree.classList.add('hidden');
        divideTwo.classList.remove('hidden');

      } else if (i === 2) {
        modalOne.classList.add('hidden');
        modalTwo.classList.add('hidden');
        modalThree.classList.remove('hidden');

        divideOne.classList.add('hidden');
        divideTwo.classList.add('hidden');
        divideThree.classList.remove('hidden');

      } else {
        modalOne.classList.remove('hidden');
        modalTwo.classList.add('hidden');
        modalThree.classList.add('hidden');

        divideOne.classList.remove('hidden');
        divideTwo.classList.add('hidden');
        divideThree.classList.add('hidden');
      }
    });

}
