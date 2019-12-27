#
# Be sure to run `pod lib lint BlobPrivateComponentDemo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BlobPrivateComponentDemo'
  s.version          = '0.0.1'
  s.summary          = '私有组件制作的演示组件.'

  s.description      = <<-DESC
BlobPrivateComponentDemo 私有组件制作的演示组件.
                       DESC

  s.homepage         = 'https://github.com/fanxiaocong/BlobPrivateComponentDemo'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fanxiaocong' => '1016697223@qq.com' }
  s.source           = { :git => 'https://github.com/fanxiaocong/BlobPrivateComponentDemo.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'BlobPrivateComponentDemo/Classes/*'
  
  s.resource_bundles = {
      'BlobPrivateComponentDemo' => ['BlobPrivateComponentDemo/Assets/*.png']
  }
  
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'XCMacros', '~> 1.0.4'
end
