class HomeController < ApplicationController
  def index
  end
  def version
    @version_number = ENV["HEROKU_RELEASE_VERSION"]
    if @version_number == nil
      @version_number = "non-heroku ENV - v. unknown"
    else
    end
    #Sets the Heroku ENV value (if it exists)
    @version_hash = ENV["HEROKU_SLUG_COMMIT"]
    #Checks to see if the value actually exists (are we even on Heroku?)
    if @version_hash == nil
      #If not, assumed local git deploy support. Grabs the details from HEAD
      git_hash = `git rev-parse HEAD`
      @version_hash = git_hash
    else
      #Otherwise we're already good to go!
    end
    @version_date = ENV["HEROKU_RELEASE_CREATED_AT"]
    if @version_date == nil
      git_date = `git log -1 --format=%aD`
      @version_date = git_date
    else
    end
  end
end
