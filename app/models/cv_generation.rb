class CvGeneration < ApplicationRecord
  belongs_to :job_offer
  belongs_to :profile
  belongs_to :cv

  def generate
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "How can we say Hello in french ? give me only 1 word, not more"}]
      })

    return chaptgpt_response["choices"][0]["message"]["content"]
  end
end
