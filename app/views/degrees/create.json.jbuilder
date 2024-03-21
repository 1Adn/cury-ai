if @degree.persisted?
  json.inserted_item render(partial: "degrees/degree", formats: :html, locals: {degree: @degree})
else
  json.form render(partial: "degrees/degree", formats: :html, locals: {degree: @degree})
end
