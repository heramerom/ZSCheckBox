#
#  Be sure to run `pod spec lint ZSCheckBox.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "ZSCheckBox"
  s.version      = "0.0.1"
  s.summary      = "A simple check box widget for iOS develop."

  s.description  = <<-DESC
                   A simple check box widget for iOS develop. easy to use.
                   DESC
  s.homepage     = "https://github.com/heramerom/ZSCheckBox.git"
  s.license      = "Simple BSD"
  s.author             = { "Heramerom" => "Heramerom@163.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/heramerom/ZSCheckBox.git", :tag => "0.0.1" }
  s.source_files  = "ZSCheckBox/ZSCheckBox/*.{h,m}"
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  s.requires_arc = true

end
