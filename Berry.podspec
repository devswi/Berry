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
    s.source_files = "Berry/Classes/**/*.swift"
end
