class HomeController < ApplicationController
  def index
    @activity = [
      "kicking ass",
      "saving lives",
      "fighting crime",
      "Lifting up heavy things and then putting them back down,",
      "metaphorically",
      "figuratively",
      "doing stuff",
      "engineerorating",
      "smelling wonderful",
      "literally"].sample
    @color = [
      "#BA95E8",
      "#FFFB5D",
      "#61FFF8",
      "#95FFA9",
      "#FF353F",
      "#FF72D2"].sample
    @icon = [
      "coffee",
      "trophy",
      "pencil",
      "anchor",
      "lightbulb",
      "glass",
      "lemon",
      "folder-open-alt",
      "globe",
      "fire-extinguisher"].sample
  end
end
