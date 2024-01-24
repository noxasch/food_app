class ApplicationMutation < Mutations::Command
  def model_errors(model)
    model.errors.messages.each do |k,v|
      add_error(mode.model_name.human.downcase, k, v[0])
    end
  end
end
