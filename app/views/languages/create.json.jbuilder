if @language.persisted?
  json.inserted_item render(partial: "languages/language", formats: :html, locals: {language: @language})
else
  json.form render(partial: "languages/language", formats: :html, locals: {language: @language})
end
