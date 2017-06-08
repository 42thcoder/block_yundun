require "spec_helper"

feature "rails application" do
  before { Capybara.app = TestRailsApp::Application }

  scenario 'block legal request issued by yundun' do
    page.driver.header('User-Agent', ' Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;Alibaba.Security.Heimdall.950384.p')

    visit '/posts'

    expect(page.status_code).to eq 406
  end

  scenario 'block illegal request issued by yundun' do
    page.driver.header('User-Agent', ' Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;Alibaba.Security.Heimdall.950384.p')

    visit '/url_not_exists'

    expect(page.status_code).to eq 406
  end

  scenario 'normal request should be fine' do
    page.driver.header('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36')

    visit '/posts'

    expect(page.status_code).to eq 200
  end

  scenario 'illegal request should throw 404' do
    page.driver.header('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36')

    visit '/url_not_exists'

    expect(page.status_code).to eq 404
  end
end