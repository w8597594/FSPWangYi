#
#  Be sure to run `pod spec lint FSPWangYi.podspec' to ensure this is a
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

  s.name         = "FSPWangYi"
  s.version      = "0.0.1"
  s.summary      = "A test on iOS"
  s.description  = <<-DESC
                    only test on iOS
                   DESC

  s.homepage     = "https://github.com/w8597594/FSPWangYi"
  s.license      = "MIT"
  s.author             = { "方世沛" => "514855350@qq.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/w8597594/FSPWangYi.git", :tag => s.version.to_s }
  s.source_files = 'FSPWangYi/*'
  s.frameworks = 'Foundation','UIKit'
  s.requires_arc = true

end
