# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "MBProgressHUD"
  s.version      = "1.0.0"
  s.summary      = "An iOS activity indicator view."
  s.description  = <<-DESC
                    MBProgressHUD is an iOS drop-in class that displays a translucent HUD 
                    with an indicator and/or labels while work is being done in a background thread. 
                    The HUD is meant as a replacement for the undocumented, private UIKit UIProgressHUD 
                    with some additional features.
                   DESC
  s.homepage     = "http://www.bukovinski.com"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Matej Bukovinski' => 'matej@bukovinski.com' }
  s.source       = { :git => "https://github.com/matej/MBProgressHUD.git", :tag => s.version.to_s }
  s.ios.deployment_target = '6.0'
  s.tvos.deployment_target = '9.0'
  s.source_files = '*.{h,m}'
  s.frameworks   = "CoreGraphics", "QuartzCore"
  s.requires_arc = true

# MARK: - iOS Static Framework

  s.platform = :ios
  s.ios.deployment_target = '6.0'
  s.static_framework = true

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" } if !cn.source_files.blank?
  s.license = {}
  s.pod_target_xcconfig = (cn.pod_target_xcconfig || {}).tap do |h|
    h['SWIFT_INCLUDE_PATHS'] = h.fetch('SWIFT_INCLUDE_PATHS', '$(inherited)') + ' $(PODS_TARGET_SRCROOT)/**'
  end
end