Pod::Spec.new do |s|
    s.name = 'Berry'
    s.version = '1.0.0'
    s.license = 'MIT'
    s.summary = '😊 Berry is an drop down menu written by Swift 4.2.'
    s.homepage = 'https://github.com/shiwei93/Berry'
    s.authors = { 'shiwei93' => 'stayfocusjs@gmail.com'}
    s.source = { :git => 'https://github.com/shiwei93/Berry.git', :tag => s.version }
    s.ios.deployment_target = '9.0'
    s.ios.frameworks = 'UIKit', 'Foundation'
    s.swift_version = '4.2'
    
    s.default_subspec = 'Core'
    
    s.subspec 'Core' do |core|
        core.source_files = 'Berry/Core/Classes/**/*.swift'
    end
    
    s.subspec 'Configuration' do |config|
        config.source_files = 'Berry/Configuration/Classes/**/*.swift'
        
        config.dependency 'Berry/Core'
    end
end
