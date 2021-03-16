// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// import 'jquery'
// import 'jquery_ujs'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.onload=function(){

    $(function() {
        $('#pictureInput').on('change', function(event) {
          var files = event.target.files;
          var image = files[0]
          var reader = new FileReader();
        //   console.log(image.size);

          reader.onload = function(file) {
            var img = new Image();
            // console.log(file);
            $(img).height(400).width(350);
            img.src = file.target.result;
            // console.log(image.size);

            $('#target').html(img);
            // console.log(image);
            
          }

          reader.readAsDataURL(image);
        //   console.log(files);
        });
      });


    const allLinks = document.querySelectorAll('a')
    // To refresh the javascript on the page each time a link is clicked 
    // allLinks.forEach((link) => {
    //     link.addEventListener('click', () =>{
    //         window.location.reload()
    //         // window.reload()
    //     })
    // })

    //day and night button effect
    const dayNightBtn = document.getElementById('day-night-btn')
    const user = document.querySelector('.user-drop-down')
    const heart = document.querySelector('.heart-select')
    const bag = document.querySelector('.bag-select')
    const nav = document.getElementById('shared-navbar')
    const heroText = document.querySelector('.hero')
    const homePage= document.getElementById('pages-home')

    dayNightBtn.addEventListener('click', () =>{
        // window.location.reload()
        // for dark mode styling
        if(dayNightBtn.classList[0] == "light"){
            dayNightBtn.classList.remove('light')
            dayNightBtn.classList.add('dark')
            user.classList.remove('user-pic')
            user.classList.add('black-user-pic')
            heart.classList.remove('heart')
            heart.classList.add('black-heart')
            bag.classList.remove('hand-bag')
            bag.classList.add('black-hand-bag')
            

            nav.style.backgroundColor = 'white';
            // homePage.style.backgroundColor = '#fff';
            heroText.style.color = "black";
        }

        // for light mode styling
        else if(dayNightBtn.classList[0] == "dark") {
            dayNightBtn.classList.remove('dark')
            dayNightBtn.classList.add('light')
            user.classList.remove('black-user-pic')
            user.classList.add('user-pic')
            heart.classList.remove('black-heart')
            heart.classList.add('heart')
            bag.classList.remove('black-hand-bag')
            bag.classList.add('hand-bag')

            nav.style.backgroundColor = '#2f2f2f';
            heroText.style.color = "white";
            // homePage.style.backgroundColor = '#2f2f2f';
        }
    })  
}