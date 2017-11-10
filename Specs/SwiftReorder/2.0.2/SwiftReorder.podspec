# coding: utf-8
Pod::Spec.new do |s|
  s.name = 'SwiftReorder'
  s.version = '2.0.2'
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
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftReorder-2.0.2-Static.zip',
    sha256: 'e22655b9c96be56b325bcabbb48596d8bc7eac41036e292d456921612ef1ffa9'
  }

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.source_files = nil

  # Technical Q&A QA1881 v2 - Embedding Content with Swift in Objective-C
  # @link https://pewpewthespells.com/blog/swift_and_objc.html

  s.user_target_xcconfig = {
    'SWIFT_STDLIB_PATH' => '${DT_TOOLCHAIN_DIR}/usr/lib/swift/${PLATFORM_NAME}',
    'OTHER_LDFLAGS' => '-L${SWIFT_STDLIB_PATH}'
  }

  s.subspec 'Static' do |sc|
    sc.preserve_paths = 'SwiftReorder.framework/*'
    sc.source_files = 'SwiftReorder.framework/Headers/*.h'
    sc.public_header_files = 'SwiftReorder.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftReorder.framework'
  end
end
