class HomeController < ApplicationController
  def index
    @activity = [
      "kicking ass",
      "saving lives",
      "fighting crime",
      "Lifting up heavy things and then putting them back down,",
      "metaphorically",
      "figuratively",
      "literally"].sample
    @color = [
      "#BA95E8",
      "#FFFB5D",
      "#61FFF8",
      "#95FFA9",
      "#77C8E8", 
      "#FF353F",
      "#FF72D2"].sample
  end
end
