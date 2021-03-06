#
# Be sure to run `pod lib lint YJTableModelDriver.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YJTableModelDriver'
  s.version          = '1.0.2'
  s.summary          = '基于数据驱动的Tableview'
  s.swift_version    = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '基于数据驱动的Tableview封装'

  s.homepage         = 'https://github.com/full-of-fire/YJTableModelDriver'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'full-of-fire' => 'yangjie43606@gmail.com' }
  s.source           = { :git => 'https://github.com/full-of-fire/YJTableModelDriver.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YJTableModelDriver/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YJTableModelDriver' => ['YJTableModelDriver/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
