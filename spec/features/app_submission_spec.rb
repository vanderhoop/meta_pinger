require 'spec_helper'

def submit_app(app_url)
  visit("/")
  fill_in(:app_url, with: app_url)
  page.find("input[type='submit']").click
end

describe "the app submission process" do

  context "when the user submits a URL that doesn't contain '.herokuapp.com'" do
    before(:each) do
      submit_app("http://blarptydarp.marp.com")
    end

    it("the user is notified of their error") do
      expect(page).to have_text("seems you supplied an unworthy URL")
    end
  end # context

  context "when the user submits a URL that contains '.herokuapp.com'" do
    before(:each) do
      submit_app("appy.herokuapp.com")
    end

    context "when the submitted app hasn't been added to metapinger previusly" do
      it "the user is presented with the success page" do
        expect(page).to have_text("Congratulations")
      end
    end

    context "when the submitted app has already been added to metapinger previously" do
      before(:each) { submit_app("appy.herokuapp.com") }

      it "the user is notified" do
        expect(page).to have_text("MetaPinger is already pinging this app")
      end
    end
  end
end

