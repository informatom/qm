module SequenceFlowsHelper
  
  def symbol(instance)
  	case instance
  	  when FlowObject
  	  	flow_object = instance
  	  else
   	    flow_object = instance.flow_object
   	end

    if flow_object.flow_object_class == "Sequence Flow"
	    image_tag( "/assets/flow-objects/" + flow_object.image_file_name, style: "width: 40px;") + raw("&nbsp;")
	  else
	    image_tag( "/assets/flow-objects/" + flow_object.image_file_name, style: "height: 20px;") + raw("&nbsp;")
	  end
  end
end
