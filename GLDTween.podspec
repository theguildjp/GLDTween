#
#  Be sure to run `pod spec lint GLDTween.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "GLDTween"
  s.version      = "0.0.1"
  s.summary      = "Fancy Animation Engine for iOS written with Swift"

  s.description  = <<-DESC
                   iOS needs better animation engine. CAAnimation is not so handy, so we did.
                   DESC

  s.homepage     = "https://github.com/theguildjp/GLDTween"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "Takayuki Fukatsu" => "fukatsu@gmail.com" }
  s.social_media_url   = "http://twitter.com/fladdict"

  s.platform     = :ios, "7.0"
  s.requires_arc = true

  s.source       = { :git => "https://github.com/theguildjp/GLDTween.git", :tag => "0.0.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any h, m, mm, c & cpp files. For header
  #  files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"



end
