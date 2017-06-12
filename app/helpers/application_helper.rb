module ApplicationHelper
  
  # Returns the full title                            # Komentarz
  def full_title(page_title = '')                     # Definicja metody, opcjonalny argument
    base_title = "Twittie WozniakAlex"  # Przypisanie zmiennej
    if page_title.empty?                              # Test logiki 0/1
      base_title                                      # Return
    else
      page_title + " | " + base_title                 # Stringi
    end
  end
end
