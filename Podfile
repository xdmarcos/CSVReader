
platform :ios, '11.4'

use_frameworks!

inhibit_all_warnings!

def app_pods
  pod 'SwiftLint'
end

target 'CSVReader' do

  app_pods

  target 'CSVReaderTests' do
    inherit! :search_paths
    app_pods
  end

  target 'CSVReaderUITests' do
    inherit! :search_paths
    app_pods
    pod 'KIF', :configurations => ['Debug_STAGE','Debug_PROD']
    pod 'KIF/IdentifierTests', :configurations => ['Debug_STAGE','Debug_PROD']
  end

end
