require 'rails_helper'

RSpec.describe Gif, type: :model do
  it "requires images smaller than 1 MB" do
    gif = Gif.new
    gif.image.attach(io: File.open("./spec/models/the_blue_ribbon.gif"), filename: "the_blue_ribbon.gif", content_type: "image/gif")

    expect(gif).to be_invalid
    expect(gif.errors.full_messages).to include("Image too big") 
  end

  it "requires the image to be a gifs"
end