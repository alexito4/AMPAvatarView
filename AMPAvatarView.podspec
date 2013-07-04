Pod::Spec.new do |s|
  s.name         = "AMPAvatarView"
  s.version      = "1.0"
  s.summary      = "A simple UIView subclass that shows an UIImage with a shadow in a circle."
  s.homepage     = "https://github.com/alexito4/AMPAvatarView"
  # s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "alexito4" => "alexito4@gmail.com" }

  s.source       = { :git => "https://github.com/alexito4/AMPAvatarView.git", :tag => "1.0" }

  s.platform     = :ios, '6.0'

  # ――― MULTI-PLATFORM VALUES ――――――――――――――――――――――――――――――――――――――――――――――――― #

  # If this Pod runs on both platforms, then specify the deployment
  # targets.
  #
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'

  s.source_files = 'AMPAvatarView/AMPAvatarView/*.{h,m}'

  s.framework  = 'QuartzCore'

  s.requires_arc = true

end