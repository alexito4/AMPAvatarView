Pod::Spec.new do |s|
  s.name         = "AMPAvatarView"
  s.version      = "1.1"
  s.summary      = "A simple UIView subclass that shows an UIImage with a shadow in a circle."
  s.homepage     = "https://github.com/alexito4/AMPAvatarView"
  s.author       = { "Alejandro Martínez" => "alexito4@gmail.com" }
  s.license      = { :type => 'MIT'}
  s.source       = { :git => "https://github.com/alexito4/AMPAvatarView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alexito4'

  s.platform = :ios
  s.requires_arc = true
  s.framework  = 'QuartzCore'
  s.source_files = 'AMPAvatarView'

end
