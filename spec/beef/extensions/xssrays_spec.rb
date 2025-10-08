
#
# Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - https://beefproject.com
# See the file 'doc/COPYING' for copying permission
#
require 'extensions/xssrays/extension'

RSpec.describe 'BeEF Extension XSSRays' do
  before(:all) do
    @config = BeEF::Core::Configuration.instance
    @config.load_extensions_config
  end

  it 'loads configuration' do
    config = @config.get('beef.extension.xssrays')
    expect(config).to have_key('enable')
    expect(config).to have_key('clean_timeout')
    expect(config).to have_key('cross_origin')
  end

  it 'interface' do
    xssrays = BeEF::Extension::Xssrays::API::Scan.new
    expect(xssrays).to respond_to(:start_scan)
    expect(xssrays).to respond_to(:add_to_body)
  end
end
