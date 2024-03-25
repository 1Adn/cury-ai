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
          Purpose: There is a set of information about a person linked to their resume. However, we want to keep only the information relevant to a specific job offer.
          Your role: You will receive several pieces of information concerning the CV of a fictitious person. Your role is to sort out what to keep and what not to keep in order to reconstruct a CV specific to a certain job offer that you will be given.
          Context: The aim is to have a CV that is optimized for the specific job offer. The way the information is given, the way it is presented, etc. must respect the usual conventions of a classic CV!
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
          "
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
