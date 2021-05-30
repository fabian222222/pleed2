window.addEventListener('DOMContentLoaded', ()=> {

    fetch('http://pleed.local/api/formation/' + window.location.href.split("/")[4], {
            method:"get", 
            headers:{
                'content-Type': 'application/x-www-form-urlencoded'
            },
      }).then(function(response){

        response.json().then(function(json){

            data = json["results"][0][0]

            let page_title = document.querySelector('.page_title')
            page_title.innerHTML = data.name

            // let formation_image = document.querySelector('.formation_image')
            // formation_image.src = "/images/" + data.photo_path
            
            let formation_section_container_intro_text = document.querySelector('.formation_section_container_intro_text')
            formation_section_container_intro_text.innerHTML = data.intro

            let formation_section_container_prob_text = document.querySelector('.formation_section_container_prob_text')
            formation_section_container_prob_text.innerHTML = data.prob

            let formation_section_container_solution_text = document.querySelector('.formation_section_container_solution_text')
            formation_section_container_solution_text.innerHTML = data.solution

            let formation_section_container_conclusion_text = document.querySelector('.formation_section_container_conclusion_text')
            formation_section_container_conclusion_text.innerHTML = data.conclusion

        })
    })
})