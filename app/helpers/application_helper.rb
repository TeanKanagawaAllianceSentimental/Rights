module ApplicationHelper
	def link_to_add_fields(name, music, association)
	    new_object = music.object.send(association).klass.new
	    id = new_object.object_id
	    fields = music.fields_for(association, new_object, child_index: id) do |music|
	      render("admin/musics/form", music: music)
	    end
	    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end

	def link_to_add_disk_fields(name, disk, association)
	    new_object = disk.object.send(association).klass.new
	    id = new_object.object_id
	    fields = disk.fields_for(association, new_object, child_index: id) do |disk|
	      render("admin/disk/form", disk: disk)
	    end
	    link_to(name, '#', class: "add_disk_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end

	def japan_time(time)
		time.strftime("%Y-%m-%d　%H:%M　")
	end

	def sub_total_update
		cart = Cart.find(params[:id])
		sub_total = cart.quantity.to_i * cart.item.unit_price.to_i
    sub_total.update
	end

	def bootstrap_class_for(flash_type)
	    { success: 'alert-primary', error: 'alert-danger',
	      alert: 'alert-warning', notice: 'alert-primary' }[flash_type.to_sym] || flash_type.to_s
	end

	def flash_messages
	    flash.each do |flash_type, message|
	    	concat(
	    		content_tag(:div, message, class: "alert #{bootstrap_class_for(flash_type)}") do
	    			concat message
	    		end
	        )
	    end
	end

	def hidden_label_tag(object, field)
		if object.errors.present? && object.errors[field].present?
	      content_tag :p, object.errors.full_messages_for(field)[0], class: 'text-danger mt-1 small'
	    end
	end
end
