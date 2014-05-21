Pod::Spec.new do |s|
  s.name         = "ThinkGamingTrackingSDK"
  s.version      = "1.0.1"
  s.summary      = "Allows developers to gain further insight. Contact ThinkGaming for details."
  s.homepage     = "http://thinkgaming.com"
  s.license      = { :type => "MIT", :file => "LICENSE" }
	s.author			 = "Think Gaming LLC"
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/thinkgaming/attribution.git", :tag => 'v1.0.1'}
  s.source_files  = "ThinkGamingTrackingSDK/*.{h,m}"
	s.public_header_files = "ThinkGamingTrackingSDK/ThinkGamingTrackingSDK.h"
  s.frameworks = "SystemConfiguration", "AdSupport", "iAds"
	s.requires_arc = true
end
