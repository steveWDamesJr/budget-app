class SplashesController < ApplicationController
  before_action :set_splash, only: %i[show edit update destroy]

  def index; end
end
