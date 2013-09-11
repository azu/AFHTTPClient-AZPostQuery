Pod::Spec.new do |s|

  s.name         = "AFHTTPClient-AZPostQuery"
  s.version      = "0.0.1"
  s.summary      = "AFNetworking category for building request using query and body."
  s.homepage     = "https://github.com/azu/AFHTTPClient-AZPostQuery"
  s.license      = 'MIT'
  s.author       = { "azu" => "info@efcl.info" }
  s.source       = { :git => "https://github.com/azu/AFHTTPClient-AZPostQuery.git", :commit => "c9c021ae959c5ebec70fdcab931044618361dabb" }
  s.source_files  = 'AFHTTPClient+AZPostQuery/**/*.{h,m}'
  s.requires_arc = true

  s.ios.deployment_target = '5.0'
  s.ios.frameworks = 'MobileCoreServices', 'SystemConfiguration', 'Security', 'CoreGraphics'

  s.osx.deployment_target = '10.7'
  s.osx.frameworks = 'CoreServices', 'SystemConfiguration', 'Security'
  s.dependency 'AFNetworking'

end
