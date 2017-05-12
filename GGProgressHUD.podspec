#
# Be sure to run `pod lib lint GGProgressHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GGProgressHUD'
  s.version          = '0.1.0'
  s.summary          = 'A simple Hud, wrapper with NVActivityIndicatorView '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A simple Hud, wrapper with NVActivityIndicatorView. Just enjoy.
                       DESC

  s.homepage         = 'https://github.com/gg4acrossover/swiftForFun'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'viethq' => 'gg4acrossover@gmail.com' }
  s.source           = { :git => 'https://github.com/gg4acrossover/swiftForFun.git', :tag => s.version}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = '\Project\ 02\ -\ GGProgressHUD/GGProgressHUD/Hud/**/*.swift'

  s.dependency 'NVActivityIndicatorView'
  
  # s.resource_bundles = {
  #   'GGProgressHUD' => ['GGProgressHUD/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
