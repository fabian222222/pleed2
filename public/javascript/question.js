window.addEventListener('DOMContentLoaded', ()=> {

    fetch('http://pleed.local/api/polls', {
            method:"get", 
            headers:{
                'content-Type': 'application/x-www-form-urlencoded'
            },
      }).then(function(response){

        response.json().then(function(json){

            let question_container = document.querySelector('.questions_available_container_element')

            if(json.results.length > 0) {
                json.results[0].forEach(element => {

                    let card = document.createElement('div')
                    card.className = "questions_available_card"
    
    
                    let cardDescription = document.createElement('div')
                    cardDescription.className = "questions_available_card_description_content"
    
                    let cardDescriptionText1 = document.createElement('div')
                    cardDescriptionText1.className="questions_available_card_description_text"
                    let cardDescriptionText1Content = document.createElement('h3')
                    cardDescriptionText1Content.innerHTML = 'Questionnaire'
                    cardDescriptionText1.appendChild(cardDescriptionText1Content)
    
    
                    let cardDescriptionContainer = document.createElement('div')
    
                    let cardDescriptionText2 = document.createElement('div')
                    cardDescriptionText2.className="questions_available_card_description_text"
                    let cardDescriptionText2Content = document.createElement('p')
                    cardDescriptionText2Content.innerHTML = element.title
                    cardDescriptionText2.appendChild(cardDescriptionText2Content)
    
                    let cardDescriptionText3 = document.createElement('div')
                    cardDescriptionText3.className="questions_available_card_description_text"
                    let cardDescriptionText3Content = document.createElement('p')
                    cardDescriptionText3Content.innerHTML = element.preview
                    cardDescriptionText3.appendChild(cardDescriptionText3Content)
    
                    let cardDescriptionText4 = document.createElement('div')
                    cardDescriptionText4.className="questions_available_card_description_text"
                    let cardDescriptionText4Content = document.createElement('p')
                    cardDescriptionText4Content.innerHTML = element.name
                    cardDescriptionText4.appendChild(cardDescriptionText4Content)
    
    
                    cardDescription.appendChild(cardDescriptionText1)
                    cardDescriptionContainer.appendChild(cardDescriptionText2)
                    cardDescriptionContainer.appendChild(cardDescriptionText3)
                    cardDescriptionContainer.appendChild(cardDescriptionText4)
                    cardDescription.appendChild(cardDescriptionContainer)
    
                    let cardFilter = document.createElement('div')
                    cardFilter.className = "question_filter"
    
                    let cardImageContainer = document.createElement('div')
                    cardImageContainer.className="questions_available_card_img"
                    let cardImage = document.createElement('img')
                    cardImage.src= "images/" + element.image_path
                    cardImageContainer.appendChild(cardImage)

                    let cardHover = document.createElement('div')
                    cardHover.className ="questions_available_card_hover"
                    cardHover.addEventListener('mouseenter', () => {
                        card.style.marginTop = "-15px"
                    })
                    cardHover.addEventListener('mouseout', () => {
                        card.style.marginTop = "initial"
                    })
                    cardHover.addEventListener('click', () => {
                        window.location.replace("http://pleed.local/poll/" + element.poll_id);
                    })
    
                    card.appendChild(cardDescription)
                    card.appendChild(cardFilter)
                    card.appendChild(cardImageContainer)
                    card.appendChild(cardHover)
    
                    question_container.appendChild(card)
                });
            } else {

            }
        })
    })
})