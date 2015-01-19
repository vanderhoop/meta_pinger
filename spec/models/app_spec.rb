require 'spec_helper'

describe App do

  context "when the supplied url contains '.herokuapp.com'" do
    let(:app) { App.new(url: "http://metapingertestcheck.herokuapp.com") }

    it "adds the Heroku app's project_name" do
      app
      expect(app.project_name).to eq("metapingertestcheck")
    end

    context "if the supplied url doesn't contain a protocol" do
      let(:app) { App.new(url: "metapingertestcheck.herokuapp.com") }

      it "adds the protocol" do
        expect(app.url).to eq("http://metapingertestcheck.herokuapp.com")
      end

    end

    context "when a Heroku app exists at the given url" do
      it "persists" do
        expect(app.save).to eq(true)
      end
    end

    context "when there's no Heroku app at the given url" do
      let(:app) { App.new(url: "slumberdunk07jkm25yeahhomie.herokuapp.com") }

      it "it doesn't persist" do
        expect(app.save).to eq(false)
      end


      context "on save" do

        it "it adds a no_such_app error" do
          app.save
          expect(app.errors.messages[:no_such_app]).to_not eq(nil)
        end

      end
    end
  end

  context "when the url doesn't contain 'herokuapp.com'" do
    let(:app) { App.new(url: "rottentomatoes.com") }

    it "doesn't persist" do
      expect(app.save).to eq(false)
    end

    context "on save" do

      it "adds a url error" do
        expect(app.errors.messages[:url]).to_not eq(nil)
      end

    end

  end

end
