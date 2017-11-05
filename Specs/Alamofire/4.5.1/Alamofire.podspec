# coding: utf-8
Pod::Spec.new do |s|
  s.name = 'Alamofire'
  s.version = '4.5.1'
  s.license = 'MIT'
  s.summary = 'Elegant HTTP Networking in Swift'
  s.homepage = 'https://github.com/Alamofire/Alamofire'
  s.social_media_url = 'http://twitter.com/AlamofireSF'
  s.authors = { 'Alamofire Software Foundation' => 'info@alamofire.org' }
  s.source = { :git => 'https://github.com/Alamofire/Alamofire.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Source/*.swift'

# MARK: - iOS Static Framework

  s.default_subspecs = 'Static'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/Alamofire-4.5.1-Static.zip',
    sha256: 'f76eb49595290faa26e91b93974b1039595f93257e066b53044107b7f5012192'
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
    sc.preserve_paths = 'Alamofire.framework/*'
    sc.source_files = 'Alamofire.framework/Headers/*.h'
    sc.public_header_files = 'Alamofire.framework/Headers/*.h'
    sc.vendored_frameworks = 'Alamofire.framework'
  end
end
