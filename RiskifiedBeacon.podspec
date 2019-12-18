Pod::Spec.new do |s|
    s.name              = 'RiskifiedBeacon'
    s.version           = '1.3.0'
    s.summary           = 'Riskified Beacon for iOS'
    s.homepage          = 'https://www.riskified.com/'

    s.author            = { 'Nimrod Ram' => 'nimrod@riskified.com' }
    s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :git => 'https://github.com/Riskified/ios_sdk.git', :tag => s.version.to_s }

    s.source_files = '*.h'
    s.vendored_library = 'libriskifiedbeacon.a'
end
