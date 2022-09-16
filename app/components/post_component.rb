# frozen_string_literal: true

class PostComponent < ViewComponent::Base
  def initialize(post:)
    @post = post
  end
  
  def title
    @post.title
  end

  def content
    @post.content
  end

  def user
    @post&.user&.email
  end

end
