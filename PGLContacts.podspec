Pod::Spec.new do |s|
  s.name             = "PGLContacts"
  s.version          = "0.1.0"
  s.summary          = "Easy to use Contacts Framework wrapper"
  s.homepage         = "https://github.com/PGLongo/PGLContacts"

  s.license          = 'MIT'
  s.author           = { "PGLongo" => "piergiuseppe.longo@gmail.com" }
  s.source           = { :git => "https://github.com/PGLongo/PGLContacts.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/PGLongo'
  s.platform     = :ios, '9.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PGLContacts' => ['Pod/Assets/*.png']
  }
  s.frameworks = 'UIKit', 'Contacts'
end
