Pod::Spec.new do |spec|
  spec.name         = "PSL-Engage-SDK"
  spec.version      = "1.0.0"
  spec.summary      = "PSL-Engage-SDK for iOS"
  spec.description  = <<-DESC
                   SL-Engage-SDK is a mobile marketing automation company.PSL-Engage-SDK contains the central configuration of your app and common Utils and modules to be used accross all the PSL-Engage-SDK frameworks. PSL-Engage-SDK framework enables you to track required data regarding user and user's activities inside the app to use the same for effective engagement.
                   DESC
  spec.homepage     = 'http://set2.dev.digo-platform.com/user/login'
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "dev Lovewanshi" => "lovewanshi.devendra@gmail.com" }
  spec.ios.deployment_target = "14.0"
  spec.source       = { :git => "https://github.com/devlove1C/DigoEngage-iOS.git", :tag => spec.version.to_s }
  spec.source_files  = "PSL-Engage-SDK/**/*.{swift}"
  spec.source_files  = "PSL-Engage-SDK/**/*.{swift}"
  spec.swift_version = "5.0"
end
