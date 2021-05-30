window.addEventListener('DOMContentLoaded', ()=> {

    let pollAnswers = []

    fetch('/api/poll/questions/' + window.location.href.split("/")[4] , {
            method:"get", 
            headers:{
                'content-Type': 'application/x-www-form-urlencoded'
            },
      }).then((response) => {
          response.json().then((data) => {

            let questionNumberHTML = document.querySelector('.question_number');
            let question_element = document.querySelector('.question_element')

            let questions = data.results[0];

            let dataLength = questions.length;

            let questionNumber = 1;

            let questionNum = 1;

            questionNumberHTML.innerHTML = `${questionNumber} / ${dataLength}`

            questions.forEach(element => {

                // console.log(element);
                let question_element_big_container = document.createElement('div')
                question_element_big_container.className = "question_element_big_container"
                question_element_big_container.setAttribute('data-questionid', questionNum)

                let question_element_container = document.createElement('div')
                question_element_container.className = "question_element_container"

                let question_element_number = document.createElement('h2')
                question_element_number.className= "question_element_number"
                question_element_number.innerHTML = `Question ${questionNum}`

                let question_element_question = document.createElement('p')
                question_element_question.className="question_element_question"
                question_element_question.innerHTML = element[0].description

                question_element_container.appendChild(question_element_number)
                question_element_container.appendChild(question_element_question)
                question_element.appendChild(question_element_container)


                let answer_container = document.createElement('div')
                answer_container.className = "answer_container"

                let answer_container_elements = document.createElement('div')
                answer_container_elements.className="answer_container_elements"

                let answerNumber = 1;

                element[1].forEach(answer => {

                    let answer_container_response = document.createElement('div')
                    answer_container_response.className = "answer_container_response"
                    answer_container_response.addEventListener('click', ()=> {

                        pollAnswers.push([1, answer.id]);

                        questionNumber++;

                        questionNumberHTML.innerHTML = `${questionNumber} / ${dataLength}`


                        if(questionNumber ==  dataLength + 1) {

                            console.log(pollAnswers);

                            pollAnswers.forEach((answerToDatabase) => {

                                // console.log(answerToDatabase[0]);
                                // console.log(answerToDatabase[1]);

                                fetch('/api/poll/complete' , {
                                    method:"post", 
                                    headers:{
                                        'content-Type': 'application/x-www-form-urlencoded'
                                    },
                                    body: `user_id=${answerToDatabase[0]}&answer_id=${answerToDatabase[1]}`
                                        
                                })            

                            })

                            questionNumberHTML.style.display = "none"
                            question_element.innerHTML = "Vous avez terminé le questionnaire !"

                            let homepageButton = document.createElement('button')
                            homepageButton.className= "homepage_button"

                            homepageButton.addEventListener('click', () => {
                                window.location.replace("http://pleed.local/polls");
                            })

                            homepageButton.innerHTML = "Retourner à la page des questionnaires"
                            question_element.appendChild(homepageButton)

                        }

                        questionBlock.forEach(element => {
                            if(element.getAttribute('data-questionid') == questionNumber) {
                                element.style.display = "block"
                            } else {
                                element.style.display = "none"
                            }
                        });

                    })

                    let answer_container_response_text = document.createElement('p')
                    answer_container_response_text.className = 'answer_container_response_text'
                    answer_container_response_text.innerHTML = `${answerNumber} : ${answer.content}`
                    
                    answer_container_response.appendChild(answer_container_response_text)

                    answer_container_elements.appendChild(answer_container_response)

                    answerNumber++;

                })
                answer_container.appendChild(answer_container_elements)
                question_element_big_container.appendChild(question_element_container)
                question_element_big_container.appendChild(answer_container)
                question_element.appendChild(question_element_big_container)

                questionNum++

            });

            let questionBlock = document.querySelectorAll('.question_element_big_container')

            questionBlock.forEach(element => {
                if(element.getAttribute('data-questionid') == questionNumber) {
                    element.style.display = "block"
                } else {
                    element.style.display = "none"
                }
            });

        })
    })
})