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
    @title = [
      "Software Engineer",
      "Intergalactic Space Cowboy",
      "Space Cadet",
      "Code Monkey",
      "Builder of things",
      "Brigadier General",
      "Nerf Herder",
      "Nerf Herder",
      "The Very Model of a Modern Major-General",
      "A Lover"].sample
    @icon = [
      "coffee",
      "trophy",
      "pencil",
      "ticket",
      "anchor",
      "lightbulb",
      "glass",
      "lemon",
      "folder-open-alt",
      "globe",
      "umbrella",
      "cogs",
      "food",
      "puzzle-piece",
      "fire-extinguisher"].sample
  end
end
