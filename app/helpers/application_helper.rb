module ApplicationHelper
	def link_to_add_fields(name, music, association)
	    new_object = music.object.send(association).klass.new
	    id = new_object.object_id
	    fields = music.fields_for(association, new_object, child_index: id) do |music|
	      render("admin/musics/form", music: music)
	    end
	    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end

	def japan_time(time)
		time.strftime("%Y-%m-%d　%H:%M　")
	end
end
