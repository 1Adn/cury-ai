if @skill.persisted?
  json.inserted_item render(partial: "skills/skill", formats: :html, locals: {skill: @skill})
else
  json.form render(partial: "skills/skill", formats: :html, locals: {skill: @skill})
end
