Pod::Spec.new do |s|
  s.name         = 'DiscreteMathematics'
  s.version      = '1.1.0'
  s.summary      = 'Discrete Mathematics algorithms.'
  s.description  = <<-DESC
    A collection of implementations of various concepts from Discrete Mathematics.
  DESC
  s.homepage     = 'https://github.com/cszatma/DiscreteMathematics'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Christopher Szatmary' => 'cs@christopherszatmary.com' }
  s.source       = { :git => 'https://github.com/cszatma/DiscreteMathematics.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.source_files  = 'Sources/**/*'
  s.frameworks  = 'Foundation'
end
