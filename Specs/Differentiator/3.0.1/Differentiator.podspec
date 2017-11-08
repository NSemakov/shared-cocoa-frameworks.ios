# coding: utf-8
Pod::Spec.new do |s|
  s.name             = "Differentiator"
  s.version          = "3.0.1"
  s.summary          = "Diff algorithm for UITableView and UICollectionView."
  s.description      = <<-DESC
  Diff algorithm for UITableView and UICollectionView.
  RxDataSources is powered by Differentiator. 
                        DESC
                        
  s.homepage         = "https://github.com/RxSwiftCommunity/RxDataSources"                      
  s.license          = 'MIT'
  s.author           = { "Krunoslav Zaher" => "krunoslav.zaher@gmail.com" }
  s.source           = { :git => "https://github.com/RxSwiftCommunity/RxDataSources.git", :tag => s.version.to_s }

  s.requires_arc          = true
  
  s.source_files = 'Sources/Differentiator/**/*.swift'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

# MARK: - iOS Static Framework

  s.default_subspecs = 'Static'
  s.source = {
    http: 'https://github.com/NSemakov/shared-cocoa-frameworks.ios/releases/download/0.0.1/Differentiator-3.0.1-Static.zip'
  }

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.source_files = nil

  s.subspec 'Static' do |sc|
    sc.preserve_paths = 'Differentiator.framework/*'
    sc.source_files = 'Differentiator.framework/Headers/*.h'
    sc.public_header_files = 'Differentiator.framework/Headers/*.h'
    sc.vendored_frameworks = 'Differentiator.framework'
  end
end
