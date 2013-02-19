module ProcessStepsHelper
  
  def image(process_step)
    image_tag( "/assets/flow-objects/" + process_step.flow_object.image_file_name) 
  end
end
