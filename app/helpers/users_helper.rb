module UsersHelper
  def gravatar_for(user)
    # gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    # image_tag(gravatar_url, alt: user.name, class:"gravatar")
    image_tag("Icon.png", alt: user.name, class:"gravatar", height: "64px")
  end
end
