Pod::Spec.new do |s|
  s.name         = "ThinkGamingAttributionSDK"
  s.version      = "1.0.3"
  s.summary      = "Attribution tracking for Think Gaming SDK"

  s.description  = <<-DESC
  					A library to facilitate logging between Think Gaming and Attribution Providers
                   DESC

  s.homepage     = "https://github.com/thinkgaming/attribution"

  s.license      = "MIT"

  s.author             = { "thinkgaming" => "ajunod@thinkgaming.com" }

  s.platform     = :ios, '5.0'

  s.source       = { :git => "https://github.com/thinkgaming/attribution.git", :tag => "v1.0.3" }
  s.source_files  = "ThinkGamingTrackingSDK", "ThinkGamingTrackingSDK/**/*.{h,m}"


  s.vendored_libraries = "ThinkGamingTrackingSDK/libAppsFlyerLib.a"
  s.requires_arc = true

  # s.xcconfig = { "LIBRARY_SEARCH_PATHS" => "$(PODS_ROOT)/ThinkGamingAttributionSDK" }
  s.dependency "ThinkGaming"

end
