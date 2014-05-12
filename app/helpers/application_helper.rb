module ApplicationHelper
	# Retorna o título completo para cada página
	def full_title(page_title)
		#base_title = "Sistema de Transações"
		if page_title.empty?
			# base_title

			# $base_name é variável global definida 
			# em application_controller.rb
			$base_name
		else
			# "#{base_title} | #{page_title}"
			"#{$base_name} | #{page_title}"
		end
	end
	
end
