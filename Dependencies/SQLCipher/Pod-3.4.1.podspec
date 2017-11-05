# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SQLCipher'
  s.summary               = 'Full Database Encryption for SQLite.'
  s.description           = 'SQLCipher is an open source extension to SQLite that provides transparent 256-bit AES encryption of database files.'
  s.version               = '3.4.1'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.authors               = 'Zetetic LLC'
  s.license               = 'BSD'

  s.homepage              = 'https://www.zetetic.net/sqlcipher/'

  s.source                = { git: 'https://github.com/sqlcipher/sqlcipher.git', tag: 'v3.4.1' }
  s.prepare_command       = './configure --enable-tempstore=yes --with-crypto-lib=commoncrypto CFLAGS="-DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2 -DSQLITE_SOUNDEX -DSQLITE_THREADSAFE -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_STAT3 -DSQLITE_ENABLE_STAT4 -DSQLITE_ENABLE_COLUMN_METADATA -DSQLITE_ENABLE_MEMORY_MANAGEMENT -DSQLITE_ENABLE_LOAD_EXTENSION -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_FTS4_UNICODE61 -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_FTS5"; make sqlite3.c'

  s.requires_arc          = false

  s.default_subspecs      = 'standard'

# MARK: - Modules

  s.subspec 'common' do |sc|
    sc.source_files = 'sqlite3.{h,c}'

    sc.frameworks = [
      'Foundation',
      'Security'
    ]

    sc.compiler_flags = [
      '-DNDEBUG',
      '-DSQLITE_HAS_CODEC',
      '-DSQLITE_TEMP_STORE=2',
      '-DSQLITE_SOUNDEX',
      '-DSQLITE_THREADSAFE',
      '-DSQLITE_ENABLE_RTREE',
      '-DSQLITE_ENABLE_STAT3',
      '-DSQLITE_ENABLE_STAT4',
      '-DSQLITE_ENABLE_COLUMN_METADATA',
      '-DSQLITE_ENABLE_MEMORY_MANAGEMENT',
      '-DSQLITE_ENABLE_LOAD_EXTENSION',
      '-DSQLITE_ENABLE_FTS4',
      '-DSQLITE_ENABLE_FTS4_UNICODE61',
      '-DSQLITE_ENABLE_FTS3_PARENTHESIS',
      '-DSQLITE_ENABLE_UNLOCK_NOTIFY',
      '-DSQLITE_ENABLE_JSON1',
      '-DSQLITE_ENABLE_FTS5',
      '-DSQLCIPHER_CRYPTO_CC',
    ]

    sc.xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SQLITE_HAS_CODEC=1',
      'OTHER_CFLAGS' => '$(inherited) -DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2 -DSQLITE_SOUNDEX -DSQLITE_THREADSAFE -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_STAT3 -DSQLITE_ENABLE_STAT4 -DSQLITE_ENABLE_COLUMN_METADATA -DSQLITE_ENABLE_MEMORY_MANAGEMENT -DSQLITE_ENABLE_LOAD_EXTENSION -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_FTS4_UNICODE61 -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_FTS5 -DSQLCIPHER_CRYPTO_CC'
    }
  end

  s.subspec 'standard' do |sc|
    sc.dependency 'SQLCipher/common'
  end

  s.subspec 'fts' do |sc|
    sc.compiler_flags = []

    sc.xcconfig = {
      'OTHER_CFLAGS' => '$(inherited)'
    }

    sc.dependency 'SQLCipher/common'
  end

  s.subspec 'unlock_notify' do |sc|
    sc.compiler_flags = []

    sc.xcconfig = {
      'OTHER_CFLAGS' => '$(inherited)'
    }

    sc.dependency 'SQLCipher/common'
  end

# MARK: - iOS Static Framework

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.static_framework = true

  cn1 = s.consumer(:ios)
  s.prepare_command = "cd #{cn1.version}; #{cn1.prepare_command}; cd .."
  s.license = {}

  s.subspecs.each do |sc|
    cn2 = sc.consumer(:ios)
    sc.source_files = cn2.source_files.map { |pt| "#{cn2.version}/#{pt}" } if !cn2.source_files.blank?
  end
end
