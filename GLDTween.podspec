Pod::Spec.new do |s|
  s.name        = "GLDTween"
  s.version     = "0.0.1"
  s.platform    = :ios, "7.0"
  s.license     = { :type => "MIT", :file => "LICENSE" }
  s.summary     = "Fancy Animation Engine for iOS"
  s.description = <<-DESC
                  iOS needs better animation engine. CAAnimation is not so handy, so we did.
                  DESC

  s.homepage         = "https://github.com/theguildjp/GLDTween"
  s.author           = { "Takayuki Fukatsu" => "fukatsu@gmail.com" }
  s.social_media_url = "http://twitter.com/fladdict"

  s.requires_arc = true
  s.source       = { :git => "https://github.com/theguildjp/GLDTween.git", :tag => "0.0.1" }
  s.source_files = "GLDTween/**/*.{h,m,swift}"
end
