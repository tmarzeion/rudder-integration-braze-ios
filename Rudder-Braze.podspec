require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

braze_kit = '~> 12.0.0'
rudder_sdk_version = '~> 1.26'
Pod::Spec.new do |s|
  s.name             = 'Rudder-Braze'
  s.version          = package['version']
  s.summary          = 'Privacy and Security focused Segment-alternative. Braze Native SDK integration support.'
  s.module_name         = 'RudderBraze'
  s.public_header_files = 'Rudder-Braze/Classes/**/*.h'
  s.requires_arc        = true
  s.description      = <<-DESC
Rudder is a platform for collecting, storing and routing customer event data to dozens of tools. Rudder is open-source, can run in your cloud environment (AWS, GCP, Azure or even your data-centre) and provides a powerful transformation framework to process your event data on the fly.
                       DESC

  s.homepage         = 'https://github.com/rudderlabs/rudder-integration-braze-ios'
  s.license          = { :type => "ELv2", :file => "LICENSE.md" }
  s.author           = { 'RudderStack' => 'arnab@rudderstack.com' }
  s.source           = { :git => 'https://github.com/rudderlabs/rudder-integration-braze-ios.git', :tag => "v#{s.version}" }
  s.static_framework = true

  s.ios.deployment_target = '13.0'
  s.source_files = 'Rudder-Braze/Classes/**/*'

  if defined?($BrazeKit)
    Pod::UI.puts "#{s.name}: Using user specified Braze SDK version '#{$BrazeKit}'"
    braze_kit = $BrazeKit
  else
    Pod::UI.puts "#{s.name}: Using default Braze SDK version '#{braze_kit}'"
  end

  if defined?($RudderSDKVersion)
      Pod::UI.puts "#{s.name}: Using user specified Rudder SDK version '#{$RudderSDKVersion}'"
      rudder_sdk_version = $RudderSDKVersion
  else
      Pod::UI.puts "#{s.name}: Using default Rudder SDK version '#{rudder_sdk_version}'"
  end

  s.dependency 'Rudder', rudder_sdk_version
  s.dependency 'BrazeKit', braze_kit
end

