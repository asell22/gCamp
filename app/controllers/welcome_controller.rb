class WelcomeController < ApplicationController

  def home
    @quotes = [
      ["Arnold Schwarzenegger", "\"Failure is not an option. Everyone has to succeed.\"",],
      ["Steve Jobs", "\"Your time is limited, so don't waste it living someone else's life\"",],
      ["Papa John", "\"Better Ingredients, Better Pizza\"",],
      ]

  end

  def about

  end

  def terms

  end

end
