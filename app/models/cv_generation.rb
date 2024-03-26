class CvGeneration < ApplicationRecord
  belongs_to :job_offer
  belongs_to :profile
  has_many :cvs, dependent: :destroy
  # after_create :generate

  def generate
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{
        role: "user",
        content: "Here are the instructions:
          The aim is to highlight the skills, diplomas, languages and experiences that best match the job description (job requirements). The aim is to have a CV that is optimized for the specific job offer.
          The expected result is a resume structured as follows:
          first name :
          last name :
          address :
          age :
          phone number :
          email :
          degrees
          languages
          skills
          experiences
          - Here's the job offer:
          Title : #{self.job_offer.title}
          Description : #{self.job_offer.description}
          - Here's the informations about the person:
          General profile informations :
          first name : #{self.profile.first_name}
          last name : #{self.profile.last_name}
          address : #{self.profile.address}
          age : #{self.profile.age}
          phone number : #{self.profile.phone_number}
          email : #{self.profile.email}
          #{got_degrees}
          #{got_languages}
          #{got_skills}
          #{got_experiences}
          Write a resume taking into account all the instructions given and incorporate them into this HTML code structure:
          <body class='body-cv'>
    <div class='cv-container'>
      <div class='left-column'>
        <div class='portrait'>
          <%= image_tag('image-pdf-cv-test.png', alt: 'Profil picture of your CV') %>
        </div>
        <div class='section'>
          <p>
            <i class='icon fab fa-linkedin text-darkblue'></i> pierre-gomba
          </p>
        </div>
        <div class='section'>
          <h2>À PROPOS</h2>
          <p>
            <strong>Front-end</strong> development is one of my passions: I enjoy crafting or envisioning modern interfaces, making them responsive, and adding elegance with smooth animations. My two favorite technologies are Angular and Bootstrap, which I've been using for over 6 years. I'm also Fullstack: proficient in PHP, MySQL, and Doctrine.
          </p>
        </div>
        <div class='section'>
          <h2>Skills</h2>
          <ul class='skills'>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> <strong>Angular &#124; Typescript</strong></li>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> <strong>Bootstrap</strong></li>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> <strong>HTML5 &#124; CSS3 &#124; SASS</strong></li>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> <strong>Javascript</strong></li>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> <strong>jQuery</strong></li>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> <strong>npm &#124; Webpack</strong></li>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> PHP</li>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> Zend Framework</li>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> MySQL</li>
            <li><i class='icon fas fa-check-circle text-darkblue'></i> Git &#124; Github</li>
          </ul>
        </div>
        <div class='section'>
          <h2>Languages</h2>
          <p>
            French, level
            <br>
            English, Level
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
          <h1>Zoé <span class='text-blue text-uppercase'>Cabanie</span></h1>
          <p>Freelance Front-end Developer</p>
          <ul class='infos'>
            <li><i class='icon fas fa-at text-blue'></i> <a href='mailto:zoe.cabanie@gmail.com'>zoe.cabanie@gmail.com</a></li>
            <li><i class='icon fas fa-phone text-blue'></i> 06 32 45 12 67</li>
            <li><i class='icon fas fa-map-marker-alt text-blue'></i> 123 rue Sainte-Catherine, 33000 Bordeaux</li>
          </ul>
        </div>
        <div class='content'>
          <div class='section'>
            <h2>Work <br><span class='text-blue'>experiences</span></h2>
            <p>
              <strong>2015 <i class='fas fa-long-arrow-alt-right'></i> 2021</strong>
              <br>
              Fullstack Developer full-time at <em>Webadev SPRL</em>
            </p>
            <ul class='experience-list'>
              <li>Website, e-shop, interface, and web application developments using Angular and Bootstrap</li>
              <li>Integration of Photoshop templates, Illustrator, Sketch, Figma</li>
              <li>Animations CSS / JS</li>
              <li>Responsive design</li>
              <li>UI / UX Design</li>
              <li>Projects on npm and Webpack</li>
              <li>Collaboration with other graphic studios</li>
              The response must contain only the HTML code. The text content of the html code provided serves only as an example. You must replace these examples with the relevant information provided. If an example cannot be appropriately replaced, it must be removed from the html code. However, you must retain the structure of the html code provided (class names, divs, etc.).
              If there isn't a lot of experiences related to the job offer, you should list the other experiences that has nothing to do with it. On the other hand, if there are several experiences that are directly related or similar (same sector) to the job offer, you'll have to emphasize those experiences. Same thing for skills. In the left column (<div class='left-column'>) there should only be: image, description , skills, degrees and languages.
              In the right column (<div class='right-column'>) there should only be:<div class='header'> containing contact details, personal informationabout the person. Experiences should be in the main part."

      }]
    })
    response_content = chatgpt_response["choices"][0]["message"]["content"]
    return response_content
  end

    def got_degrees
      degrees = "informations about the degrees :"
      self.profile.degrees.each_with_index do |degree, index|
      degrees += " degree number :#{index}
        Title : #{degree.title}
        Level : #{degree.level}
        Field : #{degree.field}
        School : #{degree.school}"
      end
      return degrees
    end

  def got_languages
    languages = "informations about the languages :"
    self.profile.languages.each_with_index do |language, index|
      languages += " languages number :#{index}
        Title : #{language.title}
        Level : #{language.level}"
    end
  end


  def got_skills
    skills = "informations about the skills :"
    self.profile.skills.each_with_index do |skill, index|
      skills += " skills number :#{index}
        Title : #{skill.title}
        Level : #{skill.level}"
    end
  end

  def got_experiences
    experiences = "informations about the experiences :"
    self.profile.experiences.each_with_index do |experience, index|
      experiences += " experiences number :#{index}
        Title :  #{experience.title}
        type : #{experience.experience_type}
        domaine : #{experience.field}
        starting date : #{experience.starting_date}
        ending date : #{experience.ending_date}
        description : #{experience.description}"
    end
  end
end
