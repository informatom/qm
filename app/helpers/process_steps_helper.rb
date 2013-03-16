module ProcessStepsHelper
  
  def symbol(process_step)
    if process_step.flow_object.flow_object_class == "Sequence Flow"
	    image_tag( "/assets/flow-objects/" + proces_step.flow_object.image_file_name, style: "width: 40px;")
	  else
	    image_tag( "/assets/flow-objects/" + process_step.flow_object.image_file_name, style: "height: 20px;")
	  end
  end

  def image(process_step)
    if process_step.flow_object.flow_object_class == "Sequence Flow"
	    image_tag( "/assets/flow-objects/" + proces_step.flow_object.image_file_name )
	  else
	    image_tag( "/assets/flow-objects/" + process_step.flow_object.image_file_name )
	  end
  end
end
