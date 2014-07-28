def full_title(page_title)
  base_title = "Agendamento Médico"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

module RequestMacros
  def login(user)
  	page.driver.post user_session_path, 
    	:user => {:email => user.email, :password => user.password}
  end
end