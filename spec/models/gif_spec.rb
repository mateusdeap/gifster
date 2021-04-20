require 'rails_helper'

RSpec.describe Gif, type: :model do
  it "requires images smaller than 1 MB" do
    gif = Gif.new
    gif.image.attach(io: File.open("./spec/fixtures/files/the_blue_ribbon.gif"), filename: "the_blue_ribbon.gif", content_type: "image/gif")

    expect(gif).to be_invalid
    expect(gif.errors.full_messages).to include("Image too big")
  end

  it "requires the image to be a gif" do
    gif = Gif.new
    gif.image.attach(io: File.open("./spec/fixtures/files/test.jpeg"), filename: "test.jpeg", content_type: "image/jpeg")

    expect(gif).to be_invalid
    expect(gif.errors.full_messages).to include("Image wrong format")
  end

  it "succeeds validations if it is a gif" do
    gif = Gif.new
    gif.image.attach(io: File.open("./spec/fixtures/files/gif_2.gif"), filename: "gif_2.gif", content_type: "image/gif")

    expect(gif).to be_valid
  end
end
