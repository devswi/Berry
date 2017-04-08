Pod::Spec.new do |s|
    s.name = 'Goku'
    s.version = '1.3'
    s.license = 'MIT'
    s.summary = '😊 Goku is an alert view written by swift 3, support both action sheet and alert view style.'
    s.homepage = 'https://github.com/ShiWeiCN/Goku'
    s.authors = { 'Shi Wei' => 'stayfocusjs@gmail.com'}
    s.source = { :git => 'https://github.com/ShiWeiCN/Goku.git', :tag => s.version }
    s.ios.deployment_target = '8.0'
    s.ios.frameworks = 'UIKit', 'Foundation'
    s.source_files = 'Goku/Source/**/*.swift'
    s.requires_arc = true
end
