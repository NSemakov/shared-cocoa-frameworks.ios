# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "Siren"
  s.version      = "3.1.5"
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

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.static_framework = true

  cn = s.consumer(:ios)
  s.source_files = cn.source_files.map { |pt| "#{cn.version}/#{pt}" }
  s.resources = cn.resources.map { |pt| "#{cn.version}/#{pt}" }
  s.license = {}
end
