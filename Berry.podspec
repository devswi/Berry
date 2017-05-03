Pod::Spec.new do |s|
    s.name = 'Berry'
    s.version = '0.1.7'
    s.license = 'MIT'
    s.summary = '😊 Berry is an drop down menu written by Swift 3.1.'
    s.homepage = 'https://github.com/ShiWeiCN/Berry'
    s.authors = { 'Shi Wei' => 'stayfocusjs@gmail.com'}
    s.source = { :git => 'https://github.com/ShiWeiCN/Berry.git', :tag => s.version }
    s.ios.deployment_target = '8.0'
    s.ios.frameworks = 'UIKit', 'Foundation'
    s.source_files = "Source/*/*.swift"
    s.requires_arc = true
end
