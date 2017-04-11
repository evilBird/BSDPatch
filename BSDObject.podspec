Pod::Spec.new do |spec|
  spec.name         = 'BSDObject'
  spec.ios.deployment_target = '8.0'
  spec.version      = '0.0.1'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/evilBird/BSDPatch'
  spec.authors      = { 'Travis Henspeter' => 'travis.henspeter@gmail.com' }
  spec.summary      = 'A tiny data flow library for iOS.'
  spec.source       = { :git => 'https://github.com/evilBird/BSDPatch.git', :tag => '0.0.1' }
  spec.source_files = 'BSDPatchExample/BSDPatch/**/*.{h,m}'
  spec.exclude_files= 'BSDPatchExample/BSDPatch/UI/*.{h,m}'
  spec.requires_arc = true
  spec.framework    = 'UIKit'
end
