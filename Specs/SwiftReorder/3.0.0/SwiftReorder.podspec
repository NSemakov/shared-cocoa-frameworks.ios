# coding: utf-8
Pod::Spec.new do |s|
  s.name = 'SwiftReorder'
  s.version = '3.0.0'
  s.license = 'MIT'
  s.summary = 'Easy drag-and-drop reordering for UITableViews'
  s.homepage = 'https://github.com/adamshin/SwiftReorder'
  s.author = 'Adam Shin'
  
  s.platform = :ios, '8.0'
  
  s.source = { :git => 'https://github.com/adamshin/SwiftReorder.git', :tag => s.version }
  s.source_files = 'Source/*'

# MARK: - iOS Static Framework

  s.default_subspecs = 'Static'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftReorder-3.0.0-Static.zip'
  }

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.source_files = nil

  s.subspec 'Static' do |sc|
    sc.preserve_paths = 'SwiftReorder.framework/*'
    sc.source_files = 'SwiftReorder.framework/Headers/*.h'
    sc.public_header_files = 'SwiftReorder.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftReorder.framework'
  end
end
