Pod::Spec.new do |s|
  s.name         = "AMPAvatarView"
  s.version      = "1.0.1"
  s.summary      = "A simple UIView subclass that shows an UIImage with a shadow in a circle."
  s.homepage     = "https://github.com/alexito4/AMPAvatarView"
  # s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }


  s.author       = { "alexito4" => "alexito4@gmail.com" }

  s.source       = { :git => "https://github.com/alexito4/AMPAvatarView.git", :tag => "1.0.1" }


  # If this Pod runs only on iOS or OS X, then specify the platform and
  # the deployment target.
  #
  # s.platform     = :ios, '5.0'


  s.source_files = 'AMPAvatarView'

  s.framework  = 'QuartzCore'

  s.requires_arc = true

end
