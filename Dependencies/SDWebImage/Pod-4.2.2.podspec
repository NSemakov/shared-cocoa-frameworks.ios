# coding: utf-8
Pod::Spec.new do |s|
  s.name = 'SDWebImage'
  s.version = '4.2.2'

  s.osx.deployment_target = '10.8'
  s.ios.deployment_target = '7.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.license = 'MIT'
  s.summary = 'Asynchronous image downloader with cache support with an UIImageView category.'
  s.homepage = 'https://github.com/rs/SDWebImage'
  s.author = { 'Olivier Poitrey' => 'rs@dailymotion.com' }
  s.source = { :git => 'https://github.com/rs/SDWebImage.git', :tag => s.version.to_s }

  s.description = 'This library provides a category for UIImageView with support for remote '      \
                  'images coming from the web. It provides an UIImageView category adding web '    \
                  'image and cache management to the Cocoa Touch framework, an asynchronous '      \
                  'image downloader, an asynchronous memory + disk image caching with automatic '  \
                  'cache expiration handling, a guarantee that the same URL won\'t be downloaded ' \
                  'several times, a guarantee that bogus URLs won\'t be retried again and again, ' \
                  'and performances!'

  s.requires_arc = true
  s.framework = 'ImageIO'
  
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'SDWebImage/{NS,SD,UI}*.{h,m}'
    core.exclude_files = 'SDWebImage/UIImage+WebP.{h,m}', 'SDWebImage/SDWebImageWebPCoder.{h,m}'
    core.tvos.exclude_files = 'SDWebImage/MKAnnotationView+WebCache.*'
  end

  s.subspec 'MapKit' do |mk|
    mk.osx.deployment_target = '10.8'
    mk.ios.deployment_target = '7.0'
    mk.tvos.deployment_target = '9.0'
    mk.source_files = 'SDWebImage/MKAnnotationView+WebCache.*'
    mk.framework = 'MapKit'
    mk.dependency 'SDWebImage/Core'
  end

  s.subspec 'GIF' do |gif|
    gif.ios.deployment_target = '7.0'
    gif.source_files = 'SDWebImage/FLAnimatedImage/*.{h,m}'
    gif.dependency 'SDWebImage/Core'
    gif.dependency 'FLAnimatedImage', '~> 1.0'
    gif.xcconfig = {
      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/FLAnimatedImage/FLAnimatedImage'
    }
  end

  s.subspec 'WebP' do |webp|
    webp.source_files = 'SDWebImage/UIImage+WebP.{h,m}', 'SDWebImage/SDWebImageWebPCoder.{h,m}'
    webp.xcconfig = { 
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1',
      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
    }
    webp.watchos.xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1 WEBP_USE_INTRINSICS=1',
      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
    }
    webp.dependency 'SDWebImage/Core'
    webp.dependency 'libwebp'
  end

# MARK: - iOS Static Framework

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.static_framework = true

  cn1 = s.consumer(:ios)
  s.license = {}
  s.pod_target_xcconfig = (cn1.pod_target_xcconfig || {}).tap do |h|
    h['SWIFT_INCLUDE_PATHS'] = h.fetch('SWIFT_INCLUDE_PATHS', '$(inherited)') + ' $(PODS_TARGET_SRCROOT)/**'
  end

  attr = Pod::Specification::DSL.attributes[:xcconfig]
  s.subspecs.each do |sc|
    cn2 = sc.consumer(:ios)

    sc.source_files = cn2.source_files.map { |pt| "#{cn2.version}/#{pt}" } if !cn2.source_files.blank?
    sc.exclude_files = cn2.exclude_files.map { |pt| "#{cn2.version}/#{pt}" } if !cn2.exclude_files.blank?
    sc.private_header_files = cn2.private_header_files.map { |pt| "#{cn2.version}/#{pt}" } if !cn2.private_header_files.blank?

    sc.xcconfig = (cn2.raw_value_for_attribute(cn2.spec, attr) || {}).tap do |h|
      h['OTHER_SWIFT_FLAGS'] = h.fetch('OTHER_SWIFT_FLAGS', '$(inherited)') + ' -DSWIFT_PACKAGE'
    end
  end
end
