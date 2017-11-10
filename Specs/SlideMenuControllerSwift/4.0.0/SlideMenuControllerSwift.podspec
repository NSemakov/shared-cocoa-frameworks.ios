# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "SlideMenuControllerSwift"
  s.version      = "4.0.0"
  s.summary      = "iOS Slide View based on iQON, Feedly, Google+, Ameba iPhone app."
  s.homepage     = "https://github.com/dekatotoro/SlideMenuControllerSwift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Yuji Hato" => "hatoyujidev@gmail.com" }
  s.social_media_url   = "https://twitter.com/dekatotoro"
  s.platform     = :ios
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/dekatotoro/SlideMenuControllerSwift.git", :tag => s.version }
  s.source_files  = "Source/*.swift"
  s.requires_arc = true

# MARK: - iOS Static Framework

  s.default_subspecs = 'Static'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SlideMenuControllerSwift-4.0.0-patch.1-Static.zip',
    sha256: '26cdc35981bf4b854b0ee4b8585811d107cb3319a5e7c40142e18185c5bc1ac3'
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
    sc.preserve_paths = 'SlideMenuControllerSwift.framework/*'
    sc.source_files = 'SlideMenuControllerSwift.framework/Headers/*.h'
    sc.public_header_files = 'SlideMenuControllerSwift.framework/Headers/*.h'
    sc.vendored_frameworks = 'SlideMenuControllerSwift.framework'
  end
end
