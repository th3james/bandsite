Given /^I have no (.+)$/ do |model|
  model_name = model.gsub(' ', '_')
  model_name.classify.constantize.destroy_all
end

