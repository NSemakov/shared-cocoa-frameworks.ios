# coding: utf-8
Pod::Spec.new do |s|
  s.name             = "SQLite.swift"
  s.version          = "0.11.4"
  s.summary          = "A type-safe, Swift-language layer over SQLite3 for iOS and OS X."

  s.description      = <<-DESC
    SQLite.swift provides compile-time confidence in SQL statement syntax and
    intent.
                       DESC

  s.homepage         = "https://github.com/stephencelis/SQLite.swift"
  s.license          = 'MIT'
  s.author           = { "Stephen Celis" => "stephen@stephencelis.com" }
  s.source           = { :git => "https://github.com/stephencelis/SQLite.swift.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stephencelis'

  s.module_name      = 'SQLite'
  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "9.1"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.2"
  s.default_subspec  = 'standard'
  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '4.0',
  }

  ## s.subspec 'standard' do |ss|
  ##   ss.source_files = 'Sources/{SQLite,SQLiteObjc}/**/*.{c,h,m,swift}'
  ##   ss.exclude_files = 'Sources/**/Cipher.swift'
  ##   ss.private_header_files = 'Sources/SQLiteObjc/*.h'
  ##   ss.library = 'sqlite3'
  ##
  ##   ss.test_spec 'tests' do |test_spec|
  ##     test_spec.resources = 'Tests/SQLiteTests/fixtures/*'
  ##     test_spec.source_files = 'Tests/SQLiteTests/*.swift'
  ##   end
  ## end

  ## s.subspec 'standalone' do |ss|
  ##   ss.source_files = 'Sources/{SQLite,SQLiteObjc}/**/*.{c,h,m,swift}'
  ##   ss.exclude_files = 'Sources/**/Cipher.swift'
  ##   ss.private_header_files = 'Sources/SQLiteObjc/*.h'
  ##
  ##   ss.xcconfig = {
  ##     'OTHER_SWIFT_FLAGS' => '$(inherited) -DSQLITE_SWIFT_STANDALONE'
  ##   }
  ##   ss.dependency 'sqlite3'
  ##
  ##   ss.test_spec 'tests' do |test_spec|
  ##     test_spec.resources = 'Tests/SQLiteTests/fixtures/*'
  ##     test_spec.source_files = 'Tests/SQLiteTests/*.swift'
  ##   end
  ## end

  ## s.subspec 'SQLCipher' do |ss|
  ##   ss.source_files = 'Sources/{SQLite,SQLiteObjc}/**/*.{c,h,m,swift}'
  ##   ss.private_header_files = 'Sources/SQLiteObjc/*.h'
  ##   ss.xcconfig = {
  ##     'OTHER_SWIFT_FLAGS' => '$(inherited) -DSQLITE_SWIFT_SQLCIPHER',
  ##     'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SQLITE_HAS_CODEC=1'
  ##   }
  ##   ss.dependency 'SQLCipher', '>= 3.4.0'
  ##
  ##   ss.test_spec 'tests' do |test_spec|
  ##     test_spec.resources = 'Tests/SQLiteTests/fixtures/*'
  ##     test_spec.source_files = 'Tests/SQLiteTests/*.swift'
  ##   end
  ## end

# MARK: - iOS Static Framework

  s.default_subspecs = 'SQLCipher/Static'
  s.source = {
    http: 'https://dl.bintray.com/roxiemobile/generic/SQLite.swift+SQLCipher-0.11.4-Static.zip',
    sha256: '438bc6e713fdad6af96ab748c7f181d08f8ed2185cdda18d0dba6aca1b4cadf4'
  }

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.prepare_command = nil

  s.subspec 'SQLCipher' do |sc|
    sc.subspec 'Static' do |sp|
      sp.preserve_paths = 'SQLite.framework/*'
      sp.source_files = 'SQLite.framework/Headers/*.h'
      sp.public_header_files = 'SQLite.framework/Headers/*.h'
      sp.vendored_frameworks = 'SQLite.framework'

      # Dependencies
      sp.dependency 'SQLCipher/Static', '~> 3.4.1'
    end
  end
end
