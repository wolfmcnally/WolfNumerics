Pod::Spec.new do |s|
    s.name             = 'WolfNumerics'
    s.version          = '1.0.3'
    s.summary          = 'Some useful numeric types and methods for Swift.'

    s.homepage         = 'https://github.com/wolfmcnally/WolfNumerics'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Wolf McNally' => 'wolf@wolfmcnally.com' }
    s.source           = { :git => 'https://github.com/wolfmcnally/WolfNumerics.git', :tag => s.version.to_s }

    s.source_files = 'WolfNumerics/Classes/**/*'

    s.swift_version = '4.2'

    s.ios.deployment_target = '9.3'
    s.macos.deployment_target = '10.13'
    s.tvos.deployment_target = '11.0'

    s.module_name = 'WolfNumerics'
end
