Pod::Spec.new do |s|
  s.name             = "RxCocoa"
  s.version          = "4.0.0"
  s.summary          = "RxSwift Cocoa extensions"
  s.description      = <<-DESC
* UI extensions
* NSURL extensions
* KVO extensions
                        DESC
  s.homepage         = "https://github.com/ReactiveX/RxSwift"
  s.license          = 'MIT'
  s.author           = { "Krunoslav Zaher" => "krunoslav.zaher@gmail.com" }
  s.source           = { :git => "https://github.com/ReactiveX/RxSwift.git", :tag => s.version.to_s }

  s.requires_arc          = true

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.source_files          = 'RxCocoa/RxCocoa.h', 'RxCocoa/*.swift', 'RxCocoa/Common/**/*.{swift,h,m}', 'RxCocoa/Traits/**/*.{swift,h,m}', 'RxCocoa/Foundation/**/*.{swift,h,m}', 'RxCocoa/Runtime/**/*.{swift,h,m}', 'Platform/**/*.swift'
  s.exclude_files         = 'RxCocoa/Platform/**/*.swift'

  s.ios.source_files      = 'RxCocoa/iOS/**/*.swift'
  s.osx.source_files      = 'RxCocoa/macOS/**/*.swift'
  s.watchos.source_files  = 'RxCocoa/iOS/**/*.swift'
  s.tvos.source_files     = 'RxCocoa/iOS/**/*.swift'

  s.dependency 'RxSwift', '~> 4.0'

# MARK: - iOS Static Framework

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.static_framework = true

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" }
  s.exclude_files = cn.exclude_files.map { |pt| "#{cn.version}/#{pt}" }
  s.license = {}
  s.pod_target_xcconfig = (cn.pod_target_xcconfig || {}).tap do |h|
    h['SWIFT_INCLUDE_PATHS'] = h.fetch('SWIFT_INCLUDE_PATHS', '$(inherited)') + ' $(PODS_TARGET_SRCROOT)/**'
    h['OTHER_SWIFT_FLAGS'] = h.fetch('OTHER_SWIFT_FLAGS', '$(inherited)') + ' -DSWIFT_PACKAGE'
  end
end
