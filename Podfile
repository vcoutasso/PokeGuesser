 platform :ios, '14.0'

target 'PokeGuesser' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PokeGuesser
  pod 'SwiftFormat/CLI'
  pod 'SwiftLint'
  pod 'SwiftGen'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
        end
    end
end
