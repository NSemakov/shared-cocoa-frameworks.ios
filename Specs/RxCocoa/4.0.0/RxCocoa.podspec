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

  ## s.dependency 'RxSwift', '~> 4.0'

# MARK: - iOS Static Framework

  s.default_subspecs = 'Static'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/RxCocoa+RxSwift-4.0.0-Static.zip',
    sha256: 'eb97d47a871d636d6c0c1662ed6f02bdb6387c8b660e8a74b8fdba2a44e82ea1'
  }

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.source_files = nil
  s.exclude_files = nil
  s.ios.source_files = nil

  s.subspec 'Static' do |sc|
    sc.preserve_paths = 'RxCocoa.framework/*'
    sc.source_files = 'RxCocoa.framework/Headers/*.h'
    sc.public_header_files = 'RxCocoa.framework/Headers/*.h'
    sc.vendored_frameworks = 'RxCocoa.framework'

    # Dependencies
    sc.dependency 'RxSwift/Static', '~> 4.0.0'
  end
end
