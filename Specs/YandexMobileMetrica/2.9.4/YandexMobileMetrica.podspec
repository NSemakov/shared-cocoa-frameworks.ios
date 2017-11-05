# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'YandexMobileMetrica'
  s.summary               = 'This library is designed to be a part of mobile apps and provide app usage stats to Yandex AppMetrica'
  s.version               = '2.9.4'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.authors               = { 'Yandex LLC' => 'appmetrica@yandex-team.com' }
  s.license               = { type: 'PROPRIETARY', file: 'LICENSE.txt' }

  s.homepage              = 'http://appmetrica.yandex.com/'

  s.source                = { 'http': 'https://storage.mds.yandex.net/get-appmetrica-mobile-sdk/117488/YandexMobileMetrica-2.9.4-ios-0ab49d70-c217-485d-98bd-2b16f2460cb5.zip', 'sha1': '433218d21ba7edb62bddf2d9341e68791cc54af5' }
  s.libraries             = [ 'c++', 'z', 'sqlite3' ]
  s.frameworks            = [ 'UIKit', 'Foundation', 'CoreTelephony', 'CoreLocation', 'CoreGraphics', 'AdSupport' ]

  s.requires_arc          = true

  s.default_subspecs      = 'Static'

# MARK: - Modules

  ## s.subspec 'Static' do |sc|
  ##   sc.preserve_paths = 'static/YandexMobileMetrica.framework'
  ##   sc.source_files = 'static/YandexMobileMetrica.framework/Versions/A/Headers/*.h'
  ##   sc.public_header_files = 'static/YandexMobileMetrica.framework/Versions/A/Headers/*.h'
  ##   sc.vendored_frameworks = 'static/YandexMobileMetrica.framework'
  ## end

  ## s.subspec 'Dynamic' do |sc|
  ##   sc.preserve_paths = 'dynamic/YandexMobileMetrica.framework'
  ##   sc.source_files = 'dynamic/YandexMobileMetrica.framework/Headers/*.h'
  ##   sc.public_header_files = 'dynamic/YandexMobileMetrica.framework/Headers/*.h'
  ##   sc.vendored_frameworks = 'dynamic/YandexMobileMetrica.framework'
  ## end

# MARK: - iOS Static Framework

  s.default_subspecs = 'Static'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/YandexMobileMetrica-2.9.4-Static.zip',
    sha256: '5796ec609bef75f5251cb05db8b15e253f2080d4317d264ef1d5a99368eaa164'
  }

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.subspec 'Static' do |sc|
    sc.preserve_paths = 'YandexMobileMetrica.framework/*'
    sc.source_files = 'YandexMobileMetrica.framework/Versions/A/Headers/*.h'
    sc.public_header_files = 'YandexMobileMetrica.framework/Versions/A/Headers/*.h'
    sc.vendored_frameworks = 'YandexMobileMetrica.framework'
  end
end
