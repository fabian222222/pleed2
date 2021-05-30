window.addEventListener('DOMContentLoaded', () => {

    fetch('http://pleed.local/api/formations', {
            method:"get", 
            headers:{
                'content-Type': 'application/x-www-form-urlencoded'
            },
      }).then((response) => {

        response.json().then((data) => {

            let list_of_formation_container_cards = document.querySelector('.list_of_formation_container_cards')

            data['results'].forEach( element => {

                let formations_container_card = document.createElement('div')
                formations_container_card.className = "formations_container_card"
                formations_container_card.addEventListener('mouseenter', () => {
                    formations_container_card.style.marginTop = '-5px'
                })
                formations_container_card.addEventListener('mouseout', () => {
                    formations_container_card.style.marginTop = 'initial'
                })


                let formation_container_card_first_contain = document.createElement('div')
                formation_container_card_first_contain.className = "formation_container_card_first_contain"

                let formation_container_card_image = document.createElement('div')
                formation_container_card_image.className = "formation_container_card_image"

                let image = document.createElement('img')
                image.src = '/images/' + element[0].photo_path

                formation_container_card_image.appendChild(image)

                formation_container_card_first_contain.appendChild(formation_container_card_image)

                let formation_container_card_title = document.createElement('div')
                formation_container_card_title.className ="formation_container_card_title" 

                let formation_container_card_title_text = document.createElement('p')
                formation_container_card_title_text.innerHTML = element[0].name

                formation_container_card_title.appendChild(formation_container_card_title_text)
                formation_container_card_first_contain.appendChild(formation_container_card_title)

                let formation_container_card_description = document.createElement('div')
                formation_container_card_description.className ="formation_container_card_description"

                let formation_container_card_description_text = document.createElement('p')
                formation_container_card_description_text.innerHTML = element[0].preview

                formation_container_card_description.appendChild(formation_container_card_description_text)
                formation_container_card_first_contain.appendChild(formation_container_card_description)

                formations_container_card.appendChild(formation_container_card_first_contain)

                let formation_container_card_second_contain = document.createElement('div')
                formation_container_card_second_contain.className ="formation_container_card_second_contain"

                let formation_container_card_second_contain_text = document.createElement('p')
                formation_container_card_second_contain_text.innerHTML = element[14]

                let card_top = document.createElement('div')
                card_top.className = "card_top"
                card_top.addEventListener('click', () => {
                    window.location.replace("http://pleed.local/formation/" + element[0].id);
                })

                formations_container_card.appendChild(card_top)

                formation_container_card_second_contain.appendChild(formation_container_card_second_contain_text)
                formations_container_card.appendChild(formation_container_card_second_contain)


                list_of_formation_container_cards.appendChild(formations_container_card)


            })

        })

      })

})