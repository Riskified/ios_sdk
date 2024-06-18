Pod::Spec.new do |s|
    s.name              = 'RiskifiedBeaconXCFramework'
    s.version           = '1.4.2'
    s.summary           = 'Riskified Beacon for iOS'
    s.homepage          = 'https://www.riskified.com/'

    s.author            = { 'Nimrod Ram' => 'nimrod@riskified.com' }
    s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :git => 'https://github.com/Riskified/ios_sdk.git', :tag => s.version.to_s }

    s.ios.deployment_target = '12.0'

    s.vendored_frameworks = 'RiskifiedBeacon.xcframework'
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
