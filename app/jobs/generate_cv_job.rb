class GenerateCvJob < ApplicationJob
  queue_as :default

  def perform(cv_generation)
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{
        role: "user",
        content: "Here is the html code for a CV:
        <div class='body-cv'>
    <div class='cv-container'>
      <div class='left-column'>
        <div class='portrait'>

          <img src='https://res.cloudinary.com/dqpfeoe6s/image/upload/v1711464925/development/fdnlesmspf0kcjwagytxru6hlfbe.jpg' alt='Description de l'image'>

        </div>
        <div class='section'>
          <p>
            <i class='icon fab fa-linkedin text-darkblue'></i> first name and last name
          </p>
        </div>
        <div class='section'>
          <h2>About me</h2>
          <p>
          Small description about the person
          </p>

        </div>
        <div class='section'>
          <h2>Skills</h2>
          <ul class='skills'>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> <strong>first skill here</strong></li>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> <strong>second skill here</strong></li>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> <strong>So on...</strong></li>
          </ul>
        </div>
        <div class='section'>
          <h2>Languages</h2>
          <p>
            first language, level of the language
            <br>
            second language, level of the language
          </p>
        </div>
        <div class='section'>
          <h2>Hobbies</h2>
          <p>
            Video games, playing and developing
            <br>
            Music, listening and composition
            <br>
            Art
            <br>
            Sports
            <br>
            Informatic
          </p>
        </div>
      </div>
      <div class='right-column'>
        <div class='header'>
          <h1>first name <span class='text-blue text-uppercase'>last name</span></h1>
          <p>title of the job offer</p>
          <ul class='infos'>
            <li><i class='icon fas fa-at text-blue'></i> <a href='email'>email</a></li>
            <li><i class='icon fas fa-phone text-blue'></i>phone number</li>
            <li><i class='icon fas fa-map-marker-alt text-blue'></i> address</li>
          </ul>
        </div>
        <div class='content'>
        <div class='section'>
        <h1 class='text-blue'>Experiences</h1>
            <p>
            <h4>experience title</h4>
              <strong>starting date <i class='fas fa-long-arrow-alt-right'></i> ending date</strong>
              <br>
              <p class='text-blue'><em>experience type</em></p>
            <p>description of the experience</p>
            </p>
            <p>
            <h4>experience title</h4>
              <strong>starting date <i class='fas fa-long-arrow-alt-right'></i> ending date</strong>
              <br>
              <p class='text-blue'><em>experience type</em></p>
            <p>description of the experience</p>
            </p>
            <p>
            <h4>experience title</h4>
              <strong>starting date <i class='fas fa-long-arrow-alt-right'></i> ending date</strong>
              <br>
              <p class='text-blue'><em>experience type</em></p>
            <p>description of the experience</p>
            </p>

          </div>

          <div class='section'>
            <h2 class='text-blue'>Degrees <br></h2>
            <p>
              <strong>degree name <i class='fas fa-long-arrow-alt-right'></i> degree level</strong>
              <br>
              <em>degree field and degree's school</em>
            </p>
          </div>
        </div>
      </div>
    </div>
</div>

              With the HTML code provided and the right informations :
-complete the HTML code with this general informations :
              -first name : #{cv_generation.profile.first_name}
              -last name : #{cv_generation.profile.last_name}
              -address : #{cv_generation.profile.address}
              -age : #{cv_generation.profile.age}
              -phone number : #{cv_generation.profile.phone_number}
              -email : #{cv_generation.profile.email}
-complete the HTML code with this skills informations :
#{got_skills(cv_generation)}
-complete the HTML code with this languages informations :
#{got_languages(cv_generation)}
-complete the HTML code with this degrees informations :
#{got_degrees(cv_generation)}
-add any hobbies you can invent that are related to the given profile.
-complete the HTML code with this experiences informations :
#{got_experiences(cv_generation)}

- create a small description of the person in the 'a propos' section as him, don't write in the 3rd person.
- all the skills, languages, degrees and experiences must be present
Give me only the html code, nothing more.

- now you can use this job offert informations to get the offer name for the cv:
#{cv_generation.job_offer}"
      }]
    })
    response_content = chatgpt_response["choices"][0]["message"]["content"]
    user = cv_generation.profile.user
    new_cv = Cv.new(content: response_content)
    new_cv.user = user
    new_cv.cv_generation = cv_generation
    new_cv.save
    p new_cv
  end


  private

  def got_degrees(cv_generation)
    degrees = "his degrees :"
    cv_generation.profile.degrees.each_with_index do |degree, index|
    degrees += " - degree number :#{index}
      Title : #{degree.title}
      Level : #{degree.level}
      Field : #{degree.field}
      School : #{degree.school}"
    end
    return degrees
  end

  def got_languages(cv_generation)
    languages = "his languages :"
    cv_generation.profile.languages.each_with_index do |language, index|
      languages += " - languages number :#{index}
        Title : #{language.title}
        Level : #{language.level}"
    end
    return languages
  end


  def got_skills(cv_generation)
    skills = "his skills :"
    cv_generation.profile.skills.each_with_index do |skill, index|
      skills += " - skills number :#{index}
        Title : #{skill.title}
        Level : #{skill.level}"
    end
    return skills
  end

  def got_experiences(cv_generation)
    experiences = "his experiences :"
    cv_generation.profile.experiences.each_with_index do |experience, index|
      experiences += " - experiences number :#{index}
        Title :  #{experience.title}
        type : #{experience.experience_type}
        domaine : #{experience.field}
        starting date : #{experience.starting_date}
        ending date : #{experience.ending_date}
        description : #{experience.description}"
    end
    return experiences

  end
end
