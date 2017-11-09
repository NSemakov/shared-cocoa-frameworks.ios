# coding: utf-8
Pod::Spec.new do |spec|

  spec.name         = "R.swift"
  spec.version      = "4.0.0"
  spec.license      = "MIT"

  spec.summary      = "Get strong typed, autocompleted resources like images, fonts and segues in Swift projects"
  spec.description  = <<-DESC
                   R.swift is a tool to get strong typed, autocompleted resources like images, fonts and segues in Swift projects.

                   * Never type string identifiers again
                   * Supports images, fonts, storyboards, nibs, segues, reuse identifiers and more
                   * Compile time checks and errors instead of runtime crashes
                   DESC
  spec.homepage     = "https://github.com/mac-cain13/R.swift"
  spec.documentation_url = "https://github.com/mac-cain13/R.swift/tree/master/Documentation"
  spec.screenshots  = [ "https://raw.githubusercontent.com/mac-cain13/R.swift/master/Documentation/Images/DemoUseImage.gif",
                        "https://raw.githubusercontent.com/mac-cain13/R.swift/master/Documentation/Images/DemoRenameImage.gif" ]

  spec.author             = { "Mathijs Kadijk" => "mkadijk@gmail.com" }
  spec.social_media_url   = "https://twitter.com/mac_cain13"

  spec.requires_arc = true
  spec.source = { :http => "https://github.com/mac-cain13/R.swift/releases/download/v#{spec.version}/rswift-#{spec.version}.zip" }

  spec.ios.deployment_target     = '8.0'
  spec.tvos.deployment_target    = '9.0'

  spec.dependency "R.swift.Library", "~> 4.0.0"

  spec.preserve_paths = "rswift"

# MARK: - iOS Static Framework

  spec.platform = :ios
  spec.ios.deployment_target = '8.0'

  spec.license = {}
end
