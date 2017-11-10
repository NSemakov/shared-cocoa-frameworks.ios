# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "Siren"
  s.version      = "3.1.6"
  s.summary      = "Notify users that a new version of your iOS app is available, and prompt them with the App Store link."

  s.description  = <<-DESC
Notify users when a new version of your iOS app is available, and prompt them with the App Store link.
                   DESC

  s.homepage     = "https://github.com/ArtSabintsev/Siren"
  s.license      = "MIT"
  s.authors      = { "Arthur Ariel Sabintsev" => "arthur@sabintsev.com", "Aaron Brager" => "getaaron@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ArtSabintsev/Siren.git", :tag => s.version.to_s }
  s.source_files = 'Sources/*.swift'
  s.resources    = 'Sources/Siren.bundle'
  s.requires_arc = true

# MARK: - iOS Static Framework

  s.default_subspecs = 'Static'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/Siren-3.1.6-Static.zip',
    sha256: 'd9aef4073c35cc85367321dff1f093d456111901608642854274c6ab6fd7a726'
  }

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.source_files = nil
  s.resources = nil

  # Technical Q&A QA1881 v2 - Embedding Content with Swift in Objective-C
  # @link https://pewpewthespells.com/blog/swift_and_objc.html

  s.user_target_xcconfig = {
    'SWIFT_STDLIB_PATH' => '${DT_TOOLCHAIN_DIR}/usr/lib/swift/${PLATFORM_NAME}',
    'OTHER_LDFLAGS' => '-L${SWIFT_STDLIB_PATH}'
  }

  s.subspec 'Static' do |sc|
    sc.preserve_paths = 'Siren.framework/*', 'Siren.bundle'
    sc.source_files = 'Siren.framework/Headers/*.h'
    sc.public_header_files = 'Siren.framework/Headers/*.h'
    sc.vendored_frameworks = 'Siren.framework'
    sc.resources = 'Siren.bundle'
  end
end
