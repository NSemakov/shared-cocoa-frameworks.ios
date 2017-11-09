# coding: utf-8
Pod::Spec.new do |s|
  s.name             = "RxDataSources"
  s.version          = "3.0.2"
  s.summary          = "This is a collection of reactive data sources for UITableView and UICollectionView."
  s.description      = <<-DESC
This is a collection of reactive data sources for UITableView and UICollectionView.

It enables creation of animated data sources for table an collection views in just a couple of lines of code.

```swift
let data: Observable<Section> = ...

let dataSource = RxTableViewSectionedAnimatedDataSource<Section>()
dataSource.cellFactory = { (tv, ip, i) in
    let cell = tv.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style:.Default, reuseIdentifier: "Cell")
    cell.textLabel!.text = "\(i)"
    return cell
}

// animated
data
    .bind(to: animatedTableView.rx.items(dataSource: dataSource))
    .disposed(by: disposeBag)

// normal reload
data
    .bind(to: tableView.rx.items(dataSource: dataSource))
    .disposed(by: disposeBag)
```
                        DESC
  s.homepage         = "https://github.com/RxSwiftCommunity/RxDataSources"                      
  s.license          = 'MIT'
  s.author           = { "Krunoslav Zaher" => "krunoslav.zaher@gmail.com" }
  s.source           = { :git => "https://github.com/RxSwiftCommunity/RxDataSources.git", :tag => s.version.to_s }

  s.requires_arc          = true
  
  s.source_files = 'Sources/RxDataSources/**/*.swift'
  s.dependency 'Differentiator', '~> 3.0'
  s.dependency 'RxSwift', '~> 4.0'
  s.dependency 'RxCocoa', '~> 4.0'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

# MARK: - iOS Static Framework

  s.default_subspecs = 'Static'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/RxDataSources+Differentiator+RxCocoa-3.0.2-Static.zip',
    sha256: '11a4e4e04e10cb22942d918cbb1c36ac0f6f251cd51c9a1c317b3e09633903cd'
  }

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.source_files = nil

  s.subspec 'Static' do |sc|
    sc.preserve_paths = 'RxDataSources.framework/*'
    sc.source_files = 'RxDataSources.framework/Headers/*.h'
    sc.public_header_files = 'RxDataSources.framework/Headers/*.h'
    sc.vendored_frameworks = 'RxDataSources.framework'

    # Dependencies
    sc.dependency 'Differentiator/Static', '~> 3.0.2'
    sc.dependency 'RxSwift/Static', '~> 4.0.0'
    sc.dependency 'RxCocoa/Static', '~> 4.0.0'
  end
end
