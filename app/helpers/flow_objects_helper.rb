module FlowObjectsHelper
  
  def symbol(flow_object)
	  if flow_object.flow_object_class == "Sequence Flow"
	    image_tag( "/assets/flow-objects/" + flow_object.image_file_name, style: "width: 40px;")
	  else
	    image_tag( "/assets/flow-objects/" + flow_object.image_file_name, style: "height: 20px;")
	  end
	end  
end
