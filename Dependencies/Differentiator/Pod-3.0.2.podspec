# coding: utf-8
Pod::Spec.new do |s|
  s.name             = "Differentiator"
  s.version          = "3.0.2"
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

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.static_framework = true

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" }
  s.license = {}
end
