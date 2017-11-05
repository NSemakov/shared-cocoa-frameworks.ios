# coding: utf-8
Pod::Spec.new do |s|
  s.name        = "SwiftyJSON"
  s.version     = "3.1.4"
  s.summary     = "SwiftyJSON makes it easy to deal with JSON data in Swift"
  s.homepage    = "https://github.com/SwiftyJSON/SwiftyJSON"
  s.license     = { :type => "MIT" }
  s.authors     = { "lingoer" => "lingoerer@gmail.com", "tangplin" => "tangplin@gmail.com" }

  s.requires_arc = true
  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source   = { :git => "https://github.com/SwiftyJSON/SwiftyJSON.git", :tag => s.version }
  s.source_files = "Source/*.swift"
  s.pod_target_xcconfig =  {
        'SWIFT_VERSION' => '3.0',
  }

# MARK: - iOS Static Framework

  s.default_subspecs = 'Static'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SwiftyJSON-3.1.4-Static.zip',
    sha256: '5896bd64af0474f8f85edbf4f1b6c3330b2119192617fedd315b529731a0707a'
  }

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.source_files = nil

  s.subspec 'Static' do |sc|
    sc.preserve_paths = 'SwiftyJSON.framework/*'
    sc.source_files = 'SwiftyJSON.framework/Headers/*.h'
    sc.public_header_files = 'SwiftyJSON.framework/Headers/*.h'
    sc.vendored_frameworks = 'SwiftyJSON.framework'
  end
end
