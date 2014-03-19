require 'spec_helper'

describe Post do
  it "is valid with a title, content and user_id" do
    post = Post.new(
    title: 'First Post',
    content: 'First Post',
    user_id: '1')
    expect(post).to be_valid
 end

  it "is invalid without user_id" do
    post = Post.new(
    title: 'First Post',
    content: 'First Post',
    user_id: nil)
   expect.to have(1).errors_on(:user_id)
  end

  it "is invalid without title" do
    post = Post.new(
    title: nil,
    content: 'First Post',
    user_id: nil)
   expect.to have(1).errors_on(:title)
  end

   it "is invalid without content" do
    post = Post.new(
    title: 'First Post',
    content: nil,
    user_id: '1')
   expect.to have(1).errors_on(:content)
  end

  it "is full string with user_id and title" do
  post = Post.new(title: 'First Post', user_id: '1' )
    expect(post.name).to eq 'First Post 1'
  end
end
